import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_cubit.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_state.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/enum_widget/enum_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

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
  bool _wasFacingQibla = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorPalette.kWhite,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: BlocConsumer<QiblaCubit, QiblaState>(
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
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar.buildAppBarSimple(
      backgroundColor: ColorPalette.kWhite,
      elevation: 0,
      leadingWidth: 40,
      leading: IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: ColorPalette.contentSecondary,
          size: 22,
        ),
        padding: const EdgeInsets.only(left: 16),
        constraints: const BoxConstraints.tightFor(width: 40, height: 40),
        splashRadius: 20,
      ),
      titleWidget: Text(
        'Kembali',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorPalette.contentSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: _QiblaInfoButton(onTap: _showQiblaInfoModal),
        ),
      ],
    );
  }

  void _showQiblaInfoModal() {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (context) {
          return _QiblaInfoModal(
            onClose: () => Navigator.of(context).pop(),
          );
        },
      ),
    );
  }

  void _handleHaptic(QiblaLoaded state) {
    final arrowAngle = _normalizeAngle(state.qiblaDirection - state.heading);

    if (state.isFacingQibla && !_wasFacingQibla) {
      unawaited(HapticFeedback.mediumImpact());
      _lastHapticAngle = arrowAngle;
      _lastHapticAt = DateTime.now();
      _wasFacingQibla = true;
      return;
    }

    _wasFacingQibla = state.isFacingQibla;

    if (_shouldTriggerRotationHaptic(arrowAngle)) {
      unawaited(HapticFeedback.selectionClick());
      _lastHapticAngle = arrowAngle;
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
    _wasFacingQibla = false;
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
        var compassSize = availableWidth;
        if (compassSize < 184) compassSize = 184;
        if (compassSize > 204) compassSize = 204;

        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _CompassWidget(
                      heading: state.heading,
                      qiblaDirection: state.qiblaDirection,
                      isFacingQibla: state.isFacingQibla,
                      size: compassSize,
                    ),
                    const SizedBox(height: 54),
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

    return SizedBox(
      width: size,
      height: size + topOffset,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: topOffset,
            left: 0,
            child: _compassFace(),
          ),
          Positioned(
            top: 0,
            left: size / 2 - kabahSize / 2,
            child: _kabahIcon(
              size: kabahSize,
            ),
          ),
          Positioned(
            top: topOffset,
            left: 0,
            child: _compassPointer(),
          ),
        ],
      ),
    );
  }

  Widget _compassFace() {
    return CustomPaint(
      size: Size.square(size),
      painter: _CompassFacePainter(isFacingQibla: isFacingQibla),
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

  Widget _compassPointer() {
    final arrowTurns = (qiblaDirection - heading) / 360;

    return SizedBox.square(
      dimension: size,
      child: AnimatedRotation(
        turns: arrowTurns,
        duration: const Duration(milliseconds: 160),
        child: CustomPaint(
          size: Size.square(size),
          painter: _CompassPointerPainter(
            color: isFacingQibla
                ? ColorPalette.primaryColor
                : const Color(0xFFE71545),
          ),
        ),
      ),
    );
  }
}

class _CompassFacePainter extends CustomPainter {
  const _CompassFacePainter({required this.isFacingQibla});

  final bool isFacingQibla;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;
    final ringColor = isFacingQibla
        ? ColorPalette.primaryColor
        : ColorPalette.surfaceTertiary;

    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = ringColor;
    canvas.drawCircle(center, radius, ringPaint);

    final tickPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 3.4
      ..color = ColorPalette.primaryColor;

    for (final degree in const [30, 60, 120, 150, 210, 240, 300, 330]) {
      final angle = _toRadians(degree - 90);
      final outerRadius = radius * 0.84;
      final innerRadius = radius * 0.78;
      canvas.drawLine(
        Offset(
          center.dx + innerRadius * cos(angle),
          center.dy + innerRadius * sin(angle),
        ),
        Offset(
          center.dx + outerRadius * cos(angle),
          center.dy + outerRadius * sin(angle),
        ),
        tickPaint,
      );
    }

    _drawLabel(canvas, center, radius * 0.76, 'N', -90);
    _drawLabel(canvas, center, radius * 0.76, 'E', 0);
    _drawLabel(canvas, center, radius * 0.76, 'S', 90);
    _drawLabel(canvas, center, radius * 0.76, 'W', 180);
  }

  void _drawLabel(
    Canvas canvas,
    Offset center,
    double radius,
    String label,
    double degree,
  ) {
    final angle = _toRadians(degree);
    final painter = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          color: ColorPalette.kBlack,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    painter.paint(
      canvas,
      Offset(
        center.dx + radius * cos(angle) - painter.width / 2,
        center.dy + radius * sin(angle) - painter.height / 2,
      ),
    );
  }

  double _toRadians(double degree) => degree * pi / 180;

  @override
  bool shouldRepaint(_CompassFacePainter oldDelegate) {
    return oldDelegate.isFacingQibla != isFacingQibla;
  }
}

class _CompassPointerPainter extends CustomPainter {
  const _CompassPointerPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final path = Path()
      ..moveTo(center.dx, center.dy - size.height * 0.24)
      ..lineTo(center.dx + size.width * 0.13, center.dy + size.height * 0.15)
      ..lineTo(center.dx, center.dy + size.height * 0.1)
      ..lineTo(center.dx - size.width * 0.13, center.dy + size.height * 0.15)
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..color = color,
    );
  }

  @override
  bool shouldRepaint(_CompassPointerPainter oldDelegate) {
    return oldDelegate.color != color;
  }
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
      children: [
        Text(
          _directionText(),
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            height: 1.25,
            color: ColorPalette.onSurface,
          ),
        ),
        const SizedBox(height: 20),
        _degreeBadge(textTheme),
      ],
    );
  }

  String _directionText() {
    if (isFacingQibla) return 'Menghadap Kiblat';

    final diff = (qiblaDirection - heading + 360) % 360;
    return diff > 180 ? 'Belok ke kiri' : 'Belok ke kanan';
  }

  Widget _degreeBadge(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: ColorPalette.surfaceTertiary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppIcons.compass3Line,
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(
              ColorPalette.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '${qiblaDirection.toStringAsFixed(0)}°',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 11,
              color: ColorPalette.contentSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _QiblaInfoButton extends StatelessWidget {
  const _QiblaInfoButton({required this.onTap});

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
      backgroundColor: ColorPalette.kWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
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
                color: ColorPalette.kBlack,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Untuk mendapatkan arah kiblat yang lebih presisi, gerakkan '
              'ponsel Anda membentuk pola angka 8 di udara beberapa kali.',
              textAlign: TextAlign.left,
              style: textTheme.bodyLarge?.copyWith(
                color: ColorPalette.kBlack,
                fontSize: 18,
                height: 1.35,
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
    );
  }
}
