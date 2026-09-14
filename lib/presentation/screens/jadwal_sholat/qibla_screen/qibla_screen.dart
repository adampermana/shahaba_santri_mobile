import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_cubit.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_state.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';
import 'package:sahaba_mobile/presentation/widgets/widget_info_schip.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = sl<QiblaCubit>();
        unawaited(cubit.loadQibla());
        return cubit;
      },
      child: const _QiblaView(),
    );
  }
}

class _QiblaView extends StatefulWidget {
  const _QiblaView();

  @override
  State<_QiblaView> createState() => _QiblaViewState();
}

class _QiblaViewState extends State<_QiblaView> {
  static const _hapticAngleThreshold = 5.0;
  static const _hapticThrottle = Duration(milliseconds: 180);

  double? _lastHapticAngle;
  DateTime? _lastHapticAt;
  bool _wasAlignedWithKabah = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppScaffold(
      // backgroundColor: ColorPalette.scaffoldBackground,
      appBar: _buildAppBar(context),
      body: BlocConsumer<QiblaCubit, QiblaState>(
        listenWhen: (previous, current) {
          if (current is QiblaError) return true;
          return current is QiblaLoaded;
        },
        listener: (context, state) {
          if (state is QiblaError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            _resetHapticState();
          }

          if (state is QiblaLoaded) {
            _handleHaptic(state);
          }
        },
        builder: (context, state) {
          if (state is QiblaLoading || state is QiblaInitial) {
            return _loadingState();
          }

          if (state is QiblaError) {
            return _errorState(context, state.message, textTheme);
          }

          if (state is QiblaLoaded) {
            return _loadedState(state, textTheme);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar.buildAppBarSimple(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 40,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: SizedBox.shrink(),
      ),
      leading: IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: ColorPalette.kWhite,
          size: 22,
        ),
        padding: const EdgeInsets.only(left: 16),
        constraints: const BoxConstraints.tightFor(width: 40, height: 40),
        splashRadius: 20,
      ),
      titleWidget: Text(
        'Qiblat',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorPalette.kWhite,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _handleHaptic(QiblaLoaded state) {
    final qiblaAngle = _normalizeAngle(state.qiblaDirection - state.heading);
    final isAlignedWithKabah =
        _shortestAngle(qiblaAngle) <= _hapticAngleThreshold;

    if (isAlignedWithKabah) {
      if (!_wasAlignedWithKabah) {
        unawaited(HapticFeedback.heavyImpact());
        _lastHapticAngle = qiblaAngle;
        _lastHapticAt = DateTime.now();
      }

      _wasAlignedWithKabah = true;
      return;
    }

    _wasAlignedWithKabah = false;

    if (_shouldTriggerRotationHaptic(qiblaAngle)) {
      unawaited(HapticFeedback.selectionClick());
      _lastHapticAngle = qiblaAngle;
      _lastHapticAt = DateTime.now();
    }
  }

  bool _shouldTriggerRotationHaptic(double arrowAngle) {
    final lastAngle = _lastHapticAngle;
    if (lastAngle == null) {
      _lastHapticAngle = arrowAngle;
      return false;
    }

    final now = DateTime.now();
    final lastAt = _lastHapticAt;
    if (lastAt != null && now.difference(lastAt) < _hapticThrottle) {
      return false;
    }

    final diff = _shortestAngle(arrowAngle - lastAngle);
    return diff >= _hapticAngleThreshold;
  }

  void _resetHapticState() {
    _lastHapticAngle = null;
    _lastHapticAt = null;
    _wasAlignedWithKabah = false;
  }

  double _normalizeAngle(double angle) => (angle % 360 + 360) % 360;

  double _shortestAngle(double angle) {
    final diff = _normalizeAngle(angle);
    return diff > 180 ? 360 - diff : diff;
  }

  Widget _loadingState() {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorPalette.primaryColor,
      ),
    );
  }

  Widget _errorState(
    BuildContext context,
    String message,
    TextTheme textTheme,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.explore_off_outlined,
              size: 64,
              color: ColorPalette.contentTertiary,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: ColorPalette.contentTertiary,
              ),
            ),
            const SizedBox(height: 24),
            SubmitButtonStylesWidget(
              textButton: 'Coba Lagi',
              height: 50,
              primaryColor: ColorPalette.primaryColor,
              style: SubmitButtonStyle.elevated,
              onPressed: () => context.read<QiblaCubit>().loadQibla(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loadedState(QiblaLoaded state, TextTheme textTheme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth - 32;
        final compassSize = availableWidth.clamp(230.0, 270.0);

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: Column(
                    spacing: 70,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/new-motif.png'),
                          _CompassWidget(
                            heading: state.heading,
                            qiblaDirection: state.qiblaDirection,
                            isFacingQibla: state.isFacingQibla,
                            size: compassSize,
                          ),
                        ],
                      ),
                      _DirectionInfo(
                        heading: state.heading,
                        qiblaDirection: state.qiblaDirection,
                        isFacingQibla: state.isFacingQibla,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(
              'assets/images/masjid-qibla.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        );
      },
    );
  }
}

class _CompassWidget extends StatelessWidget {
  const _CompassWidget({
    required this.heading,
    required this.qiblaDirection,
    required this.isFacingQibla,
    required this.size,
  });

  final double heading;
  final double qiblaDirection;
  final bool isFacingQibla;
  final double size;

  @override
  Widget build(BuildContext context) {
    final kabahSize = size * 0.18;
    final topOffset = kabahSize + size * 0.07;
    final kabahOffset = _kabahOffset(
      kabahSize: kabahSize,
      topOffset: topOffset,
    );

    return SizedBox(
      width: size,
      height: size + topOffset,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: topOffset,
            left: 0,
            right: 0,
            child: _rotatingCompassFace(),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 160),
            top: kabahOffset.dy,
            left: kabahOffset.dx,
            child: _kabahIcon(
              size: kabahSize,
            ),
          ),
          // jarum
          Positioned(
            top: topOffset,
            left: 0,
            right: 0,
            child: _compassNeedle(),
          ),
        ],
      ),
    );
  }

  Offset _kabahOffset({
    required double kabahSize,
    required double topOffset,
  }) {
    final relativeAngle = _toRadians(qiblaDirection - heading - 90);
    final center = Offset(size / 2, topOffset + size / 2);
    final radius = size / 2 + kabahSize / 2 + size * -0.02;

    return Offset(
      center.dx + radius * cos(relativeAngle) - kabahSize / 2,
      center.dy + radius * sin(relativeAngle) - kabahSize / 2,
    );
  }

  Widget _rotatingCompassFace() {
    // The visible dial in indicator-active.png sits about 10px above the
    // 320px canvas center because of its baked shadow.
    final visualCenterOffset = size * 10 / 320;

    return SizedBox.square(
      dimension: size,
      child: Transform.rotate(
        angle: _toRadians(-heading),
        child: Transform.translate(
          offset: Offset(0, visualCenterOffset),
          child: CacheImageOrSvg(
            source: 'assets/images/indicator-active.png',
            fit: BoxFit.contain,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget _kabahIcon({
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: ColorPalette.kWhite,
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorPalette.primaryColor,
          width: 3,
        ),
      ),
      padding: EdgeInsets.all(size * 0.13),
      child: SvgPicture.asset(
        QiblaIcons.kabah,
        width: size * 0.64,
        height: size * 0.64,
      ),
    );
  }

  Widget _compassNeedle() {
    final needleHeight = size * 0.28;
    final needleWidth = needleHeight * 62 / 93;

    return SizedBox.square(
      dimension: size,
      child: Center(
        child: SvgPicture.asset(
          QiblaIcons.jarum,
          width: needleWidth,
          height: needleHeight,
          colorFilter: ColorFilter.mode(
            isFacingQibla ? ColorPalette.primaryColor : const Color(0xFFE71545),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  double _toRadians(double degree) => degree * pi / 180;
}

class _DirectionInfo extends StatelessWidget {
  const _DirectionInfo({
    required this.heading,
    required this.qiblaDirection,
    required this.isFacingQibla,
  });

  final double heading;
  final double qiblaDirection;
  final bool isFacingQibla;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _directionText(),
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            height: 1.25,
            color: ColorPalette.kWhite,
          ),
        ),
        const SizedBox(height: 20),
        _degreeBadge(textTheme, context),
      ],
    );
  }

  String _directionText() {
    if (isFacingQibla) return 'Menghadap Kiblat';

    final diff = (qiblaDirection - heading + 360) % 360;
    return diff > 180 ? 'Hadap ke kiri' : 'Hadap ke kanan';
  }

  Widget _degreeBadge(
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoChip(
          text: '${qiblaDirection.toStringAsFixed(0)}°',
          icon: AppIcons.compass3Line,
        ),
        InfoChip(
          text: 'Panduan',
          icon: AppIcons.information2Line,
          onTap: () async => showDialog<void>(
            context: context,
            builder: (context) => _QiblaInfoModal(
              onClose: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        // _GlassBadgeButton(
        //   icon: Transform.rotate(
        //     angle: qiblaAngle,
        //     child: SvgPicture.asset(
        //       AppIcons.compass3Line,
        //       width: 24,
        //       height: 24,
        //       colorFilter: const ColorFilter.mode(
        //         ColorPalette.kWhite,
        //         BlendMode.srcIn,
        //       ),
        //     ),
        //   ),
        //   label: '${qiblaDirection.toStringAsFixed(0)}°',
        //   textTheme: textTheme,
        // ),
        // _GlassBadgeButton(
        //   onTap: () async {
        //     await showDialog<void>(
        //       context: context,
        //       builder: (context) => _QiblaInfoModal(
        //         onClose: () => Navigator.of(context).pop(),
        //       ),
        //     );
        //   },
        //   icon: SvgPicture.asset(
        //     AppIcons.information2Line,
        //     width: 24,
        //     height: 24,
        //     colorFilter: const ColorFilter.mode(
        //       ColorPalette.kWhite,
        //       BlendMode.srcIn,
        //     ),
        //   ),
        //   label: 'Panduan',
        //   textTheme: textTheme,
        // ),
      ],
    );
  }
}

// class _GlassBadgeButton extends StatelessWidget {
//   const _GlassBadgeButton({
//     required this.icon,
//     required this.label,
//     required this.textTheme,
//     this.onTap,
//   });

//   final Widget icon;
//   final String label;
//   final TextTheme textTheme;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     const borderRadius = BorderRadius.all(
//       Radius.circular(20),
//     );

//     return ClipRRect(
//       borderRadius: borderRadius,
//       child: BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaX: 24,
//           sigmaY: 24,
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: onTap,
//             borderRadius: borderRadius,
//             child: Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 6,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white.withValues(alpha: 0.30),
//                 borderRadius: borderRadius,
//                 border: Border.all(
//                   color: Colors.white.withValues(alpha: 0.20),
//                   width: 0.8,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.white.withValues(alpha: 0.12),
//                     blurRadius: 2,
//                     offset: const Offset(-1, -1),
//                   ),
//                   BoxShadow(
//                     color: Colors.black.withValues(alpha: 0.08),
//                     blurRadius: 4,
//                     offset: const Offset(1, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   icon,
//                   const SizedBox(width: 6),
//                   Text(
//                     label,
//                     style: textTheme.bodyMedium?.copyWith(
//                       color: ColorPalette.kWhite,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       height: 1,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class QiblaInfoButton extends StatelessWidget {
  const QiblaInfoButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: ColorPalette.surfaceTertiary,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          AppIcons.information2Line,
          width: 18,
          height: 18,
          colorFilter: const ColorFilter.mode(
            ColorPalette.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class _QiblaInfoModal extends StatelessWidget {
  const _QiblaInfoModal({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: ColorPalette.scaffoldBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 32, 28, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  QiblaIcons.kalibrasi,
                  width: 128,
                  height: 96,
                ),
                const SizedBox(height: 18),
                Text(
                  'Tips Akurasi Kompas',
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    color: ColorPalette.kWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  'Untuk mendapatkan arah kiblat yang lebih presisi, gerakkan '
                  'ponsel Anda membentuk pola angka 8 di udara beberapa kali.',
                  textAlign: TextAlign.justify,
                  style: textTheme.bodyLarge?.copyWith(
                    color: ColorPalette.inverseSecondary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: onClose,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.primaryColor,
                      foregroundColor: ColorPalette.kWhite,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      'Tutup',
                      style: textTheme.bodyMedium?.copyWith(
                        color: ColorPalette.kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
