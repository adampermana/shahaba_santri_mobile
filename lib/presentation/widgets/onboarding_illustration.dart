import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class OnboardingIllustration extends StatelessWidget {
  const OnboardingIllustration({
    super.key,
    this.scale = 1.0,
  });

  final double scale;

  static const List<double> soundWaveHeights = [
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

  @override
  Widget build(BuildContext context) {
    Widget content = SizedBox(
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
    );

    if (scale != 1.0) {
      content = Transform.scale(
        scale: scale,
        child: content,
      );
    }

    return Center(child: content);
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
          soundWaveHeights.length,
          (index) {
            final h = soundWaveHeights[index];
            final isLast = index == soundWaveHeights.length - 1;
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
