import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sahaba_mobile/business_logic/core_cubit/core_cubit.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';

import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoreCubit, CoreState>(
      listenWhen: (prev, next) => prev.isSubmmitBoard != next.isSubmmitBoard,
      listener: (context, state) {
        if (state.isSubmmitBoard) {
          debugPrint('===== //${state.isBoarding} ke login');
          context.go(RouterPath.loginPath);
        }
      },
      child: BlocBuilder<CoreCubit, CoreState>(
        buildWhen: (prev, next) =>
            prev.isBoarding != next.isBoarding ||
            prev.isSubmmitBoard != next.isSubmmitBoard,
        builder: (context, state) {
          return OnBoardingSlider(
            indicatorPosition: 2,
            // indicatorAbove: true,
            isTop: true,
            trailing: const SizedBox.shrink(),
            skipTextButton: const Text(
              'Lewati',
              style: TextStyle(
                color: ColorPalette.kTeal,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            skipFunctionOverride: () async {
              await context.read<CoreCubit>().saveBoardingScreen();
            },
            centerBackground: true,
            totalPage: 3,
            finishButtonText: 'Yuk, Mulai!',
            imageVerticalOffset: context.isTabletLarge
                ? 300
                : context.isTabletMedium
                ? 300
                : context.isTabletSmall
                ? 300
                : context.isPhoneLarge
                ? 180
                : context.isPhoneTall
                ? 90
                : context.isPhoneShort
                ? 60
                : 150,
            nextButtonText: 'Lanjut, Yuk!',
            finishButtonTextStyle: const TextStyle(
              fontSize: 15,
              color: ColorPalette.kWhite,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
            finishButtonStyle: FinishButtonStyle(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            colorIsActive: ColorPalette.kWhite,
            colorIsNotActive: const Color(0xFFAFAFAF),
            pageBackgroundColor: ColorPalette.scaffoldBackground,
            onFinish: () async {
              debugPrint('===onFinish');
              await context.read<CoreCubit>().saveBoardingScreen();
            },
            backgroundImageAlignments: const [
              Alignment.center,
              Alignment.center,
              Alignment.center,
            ],
            indicatorType: IndicatorType.line,
            background: [
              CacheImageOrSvg(
                source: 'assets/images/book.webp',
                fit: BoxFit.contain,
                width: context.isTabletLarge
                    ? null
                    : context.isTabletMedium
                    ? null
                    : context.isTabletSmall
                    ? null
                    : context.isPhoneLarge
                    ? 224
                    : context.isPhoneTall
                    ? 224
                    : context.isPhoneShort
                    ? 224
                    : 224,
              ),
              CacheImageOrSvg(
                source: 'assets/svg/onboarding/note.svg',
                fit: BoxFit.none,
                width: context.isTabletLarge
                    ? null
                    : context.isTabletMedium
                    ? null
                    : context.isTabletSmall
                    ? null
                    : context.isPhoneLarge
                    ? 224
                    : context.isPhoneTall
                    ? 224
                    : context.isPhoneShort
                    ? 224
                    : 224,
              ),
              _OnboardingLottieSlide3(
                width: context.isTabletLarge
                    ? null
                    : context.isTabletMedium
                    ? null
                    : context.isTabletSmall
                    ? null
                    : context.isPhoneLarge
                    ? 224
                    : context.isPhoneTall
                    ? 224
                    : context.isPhoneShort
                    ? 224
                    : 224,
              ),
            ],
            speed: 1,
            pageBodies: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    SizedBox(
                      height: context.isTabletLarge
                          ? 800
                          : context.isTabletMedium
                          ? 800
                          : context.isTabletSmall
                          ? 800
                          : context.isPhoneLarge
                          ? 500 // ega
                          : context.isPhoneTall
                          ? 400
                          : context.isPhoneShort
                          ? 320
                          : 600,
                    ),
                    Text(
                      'Ibadah tetep on-track,\nsesibuk apa pun.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: context.isTabletLarge
                            ? 48
                            : context.isTabletMedium
                            ? 48
                            : context.isTabletSmall
                            ? 48
                            : context.isPhoneMedium
                            ? 24
                            : 24,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                        color: ColorPalette.kWhite,
                      ),
                    ),
                    Text(
                      'Tenang, jadwal salat & kiblat otomatis ngikutin'
                      '\nlokasimu. Nggak ada lagi drama kelewat waktu!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorPalette.kWhite,
                        fontSize: context.isTabletLarge
                            ? 48
                            : context.isTabletMedium
                            ? 30
                            : context.isTabletSmall
                            ? 30
                            : context.isPhoneMedium
                            ? 14
                            : 14,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    SizedBox(
                      height: context.isTabletLarge
                          ? 800
                          : context.isTabletMedium
                          ? 800
                          : context.isTabletSmall
                          ? 800
                          : context.isPhoneLarge
                          ? 500
                          : context.isPhoneTall
                          ? 380
                          : context.isPhoneShort
                          ? 320
                          : 600,
                    ),
                    Text(
                      'Mulai Langkah Kecil,\nBiar Istiqamah Terus.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorPalette.kWhite,
                        fontSize: context.isTabletLarge
                            ? 48
                            : context.isTabletMedium
                            ? 48
                            : context.isTabletSmall
                            ? 48
                            : context.isPhoneMedium
                            ? 24
                            : 24,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      'Atur target tilawah sampai murajaah yang pas sama\n'
                      'ritmemu. Pelan-pelan aja, yang penting konsisten.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorPalette.kWhite,
                        fontSize: context.isTabletLarge
                            ? 48
                            : context.isTabletMedium
                            ? 30
                            : context.isTabletSmall
                            ? 30
                            : context.isPhoneMedium
                            ? 14
                            : 14,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    SizedBox(
                      height: context.isTabletLarge
                          ? 800
                          : context.isTabletMedium
                          ? 800
                          : context.isTabletSmall
                          ? 800
                          : context.isPhoneLarge
                          ? 500
                          : context.isPhoneTall
                          ? 380
                          : context.isPhoneShort
                          ? 320
                          : 600,
                    ),
                    Text(
                      'Biar Keluarga Makin\ndeket & taat bareng.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorPalette.kWhite,
                        fontSize: context.isTabletLarge
                            ? 48
                            : context.isTabletMedium
                            ? 48
                            : context.isTabletSmall
                            ? 48
                            : context.isPhoneMedium
                            ? 24
                            : 24,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      'Bangun kebiasaan baik bareng pasangan & si kecil'
                      '\nlewat misi seru dan obrolan bermakna tiap hari.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorPalette.kWhite,
                        fontSize: context.isTabletLarge
                            ? 48
                            : context.isTabletMedium
                            ? 30
                            : context.isTabletSmall
                            ? 30
                            : context.isPhoneMedium
                            ? 14
                            : 14,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            headerBackgroundColor: ColorPalette.scaffoldBackground,
          );
        },
      ),
    );
  }
}

class _OnboardingLottieSlide3 extends StatefulWidget {
  const _OnboardingLottieSlide3({this.width});

  final double? width;

  @override
  State<_OnboardingLottieSlide3> createState() =>
      _OnboardingLottieSlide3State();
}

class _OnboardingLottieSlide3State extends State<_OnboardingLottieSlide3>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isLoaded = false;
  bool _isPlayingOrPlayed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(double page) {
    final isSlide3 = page >= 1.5;
    if (isSlide3 && !_isPlayingOrPlayed) {
      _isPlayingOrPlayed = true;
      if (_isLoaded) {
        unawaited(_controller.forward(from: 0));
      }
    } else if (!isSlide3 && _isPlayingOrPlayed) {
      _isPlayingOrPlayed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = context.select<PageOffsetNotifier, double>(
      (notifier) => notifier.page,
    );
    _onPageChanged(page);

    return Lottie.asset(
      'assets/lottie/onboarding.json',
      controller: _controller,
      fit: BoxFit.contain,
      width: widget.width,
      onLoaded: (composition) {
        _controller.duration = composition.duration * 4;
        _isLoaded = true;
        if (_isPlayingOrPlayed) {
          unawaited(_controller.forward(from: 0));
        }
      },
    );
  }
}
