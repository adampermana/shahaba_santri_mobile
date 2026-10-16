import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/core_cubit/core_cubit.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const List<double> _soundWaveHeights = [
    8.4,
    15.6,
    24.0,
    13.2,
    20.4,
    9.6,
    16.8,
    24.0,
    12.0,
    19.2,
    8.4,
    14.4,
    21.6,
    9.6,
    16.8,
    7.2,
    12.0,
    20.4,
    8.4,
  ];

  Future<void> _onStart(BuildContext context) async {
    await context.read<CoreCubit>().saveBoardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoreCubit, CoreState>(
      listenWhen: (prev, next) => prev.isSubmmitBoard != next.isSubmmitBoard,
      listener: (context, state) {
        if (state.isSubmmitBoard) {
          context.go(RouterPath.loginPath);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF09383B),
        body: Stack(
          children: [
            _buildBackgroundGlow(context),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              _buildHeader(context),
                              const Spacer(),
                              const SizedBox(height: 20),
                              const _OnboardingIllustration(),
                              const Spacer(),
                              const SizedBox(height: 24),
                              _buildBottomContent(context),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundGlow(BuildContext context) {
    const darkTeal = Color(0xFF09383B);
    const lightTeal = Color(0xFF1999A1);

    // Frame Figma "Onboarding-3" = 402 x 874
    const designWidth = 402.0;
    const ellipseSize = 674.584;
    const blurRadius = 48.0; // layer blur di Figma

    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = constraints.maxWidth / designWidth;
        final size = ellipseSize * scale;
        final bleed =
            blurRadius * scale; // ruang ekstra supaya blur tidak terpotong
        final sigma = (blurRadius / 2) * scale; // Figma radius -> Flutter sigma

        Widget glow({
          required double left,
          required double top,
          required bool flipped,
        }) {
          return Positioned(
            left: left * scale - bleed,
            top: top * scale - bleed,
            child: IgnorePointer(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: sigma,
                  sigmaY: sigma,
                  tileMode: TileMode.decal,
                ),
                child: SizedBox(
                  width: size + bleed * 2,
                  height: size + bleed * 2,
                  child: Padding(
                    padding: EdgeInsets.all(bleed),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: flipped
                              ? Alignment.bottomCenter
                              : Alignment.topCenter,
                          end: flipped
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          colors: const [darkTeal, lightTeal],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return SizedBox.expand(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [darkTeal, lightTeal],
              ),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                // Ellipse 40
                glow(left: -341.81, top: 244.19, flipped: false),
                // Ellipse 41 (flip vertikal di Figma)
                glow(left: -18.12, top: 290.89, flipped: true),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Center(
      child: Text(
        'SAHABA',
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: ColorPalette.kWhite,
          letterSpacing: 2.5,
        ),
      ),
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    final titleFontSize = context.isPhoneSmall ? 26.0 : 32.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ngaji makin lancar,\npahami tiap ayat jadi lebih dalam.',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w900,
            fontSize: titleFontSize,
            height: 1.15,
            color: ColorPalette.kWhite,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Mulai dari baca mushaf, rekam suaramu buat tahu skor '
          'dan letak salah bacaan, sampai pelajari arti kata '
          'dan berbagai tafsir sekaligus.',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.45,
            color: ColorPalette.inverseSecondary,
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () => _onStart(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF007D56),
              foregroundColor: ColorPalette.kWhite,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
              shadowColor: Colors.black.withValues(alpha: 0.05),
            ),
            child: const Text(
              'Yuk, Mulai!',
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: ColorPalette.kWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OnboardingIllustration extends StatelessWidget {
  const _OnboardingIllustration();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 312,
        height: 205,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'ٱقْرَأْ بِٱسْمِ رَبِّكَ ٱلَّذِى خَلَقَ',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'lpmq',
                    fontSize: 28,
                    color: ColorPalette.kWhite,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 41,
              top: 65,
              child: _buildFeatureIconBox(
                iconPath: AppIcons.onboardingBookOpen,
              ),
            ),
            Positioned(
              left: 117,
              top: 70,
              child: _buildTimelineAudio(),
            ),
            Positioned(
              left: 0,
              top: 154,
              child: _buildSoundWave(),
            ),
            Positioned(
              left: 215,
              top: 146,
              child: _buildFeatureIconBox(
                iconPath: AppIcons.onboardingMic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIconBox({required String iconPath}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16.8),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            ColorPalette.kWhite,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineAudio() {
    return Container(
      width: 194.4,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 9.6, vertical: 6),
      decoration: BoxDecoration(
        color: ColorPalette.kWhite,
        borderRadius: BorderRadius.circular(19.2),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.onboardingCirclePlay,
            width: 21.6,
            height: 21.6,
          ),
          const SizedBox(width: 9.6),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 3.6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC9DECE),
                    borderRadius: BorderRadius.circular(2.4),
                  ),
                ),
                Container(
                  width: 51.6,
                  height: 3.6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF198754),
                    borderRadius: BorderRadius.circular(2.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 9.6),
          const Text(
            '02:35',
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 9.6,
              fontWeight: FontWeight.w400,
              color: Color(0xFF728078),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoundWave() {
    return Container(
      width: 193.2,
      height: 38.4,
      padding: const EdgeInsets.symmetric(horizontal: 19.2),
      decoration: BoxDecoration(
        color: ColorPalette.kWhite,
        borderRadius: BorderRadius.circular(1200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          OnboardingScreen._soundWaveHeights.length,
          (index) {
            final h = OnboardingScreen._soundWaveHeights[index];
            final isLast =
                index == OnboardingScreen._soundWaveHeights.length - 1;
            return Padding(
              padding: EdgeInsets.only(right: isLast ? 0 : 4.8),
              child: Container(
                width: 3.6,
                height: h,
                decoration: BoxDecoration(
                  color: const Color(0xFF007D56),
                  borderRadius: BorderRadius.circular(1.8),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
