import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/login_form.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/register_form.dart';
import 'package:sahaba_mobile/presentation/widgets/onboarding_background_glow.dart';
import 'package:sahaba_mobile/presentation/widgets/onboarding_illustration.dart';

class AuthScreen extends HookWidget {
  const AuthScreen({super.key, this.initialMode = AuthMode.login});

  final AuthMode initialMode;

  @override
  Widget build(BuildContext context) {
    final mode = useState(initialMode);
    final animController = useAnimationController(
      duration: const Duration(milliseconds: 380),
      initialValue: initialMode == AuthMode.register ? 1.0 : 0.0,
    );

    final slideAnim = useMemoized(
      () => Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animController,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        ),
      ),
      [animController],
    );

    /// login → register: register slide naik dari bawah
    /// register → login: register slide turun keluar, login tetap diam
    Future<void> switchMode(AuthMode next) async {
      if (next == mode.value) return;
      FocusManager.instance.primaryFocus?.unfocus();
      mode.value = next;
      if (next == AuthMode.register) {
        await animController.forward();
      } else {
        await animController.reverse();
      }
    }

    final topSpacerHeight = context.width * (310 / 402);

    return Scaffold(
      backgroundColor: const Color(0xFF09383B),
      resizeToAvoidBottomInset: false,
      body: OnboardingBackgroundGlow(
        child: Stack(
          children: [
            // Top elements (Brand Logo SAHABA & Illustration)
            const SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Text(
                        'SAHABA',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: ColorPalette.kWhite,
                          letterSpacing: 2.5,
                        ),
                      ),
                      SizedBox(height: 16),
                      OnboardingIllustration(scale: 0.95),
                    ],
                  ),
                ),
              ),
            ),

            // Login — selalu stay, tidak pernah bergerak
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: topSpacerHeight),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: animController,
                      builder: (context, child) => IgnorePointer(
                        ignoring: animController.value > 0,
                        child: child,
                      ),
                      child: LoginForm(
                        onSwitchToRegister: () => switchMode(AuthMode.register),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Register — overlay slide naik/turun di atas login
            AnimatedBuilder(
              animation: animController,
              builder: (context, child) {
                if (animController.isDismissed) {
                  return const SizedBox.shrink();
                }
                return SlideTransition(
                  position: slideAnim,
                  child: child,
                );
              },
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    SizedBox(height: topSpacerHeight),
                    Expanded(
                      child: RegisterForm(
                        onSwitchToLogin: () => switchMode(AuthMode.login),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
