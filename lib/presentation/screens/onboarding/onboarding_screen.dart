import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/core_cubit/core_cubit.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/onboarding_background_glow.dart';
import 'package:sahaba_mobile/presentation/widgets/onboarding_illustration.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
        body: OnboardingBackgroundGlow(
          child: SafeArea(
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
                            const OnboardingIllustration(),
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
        ),
      ),
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
