import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/login_form.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/register_form.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';

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
      () =>
          Tween<Offset>(
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

    return Scaffold(
      backgroundColor: ColorPalette.background,
      // Keyboard inset ditangani manual di _AuthContainer supaya kita bisa
      // menyembunyikan footer saat keyboard terbuka.
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CacheImageOrSvg(
              source: 'assets/images/auth_header.webp',
              fit: BoxFit.fitWidth,
            ),
          ),

          // Login — selalu stay, tidak pernah bergerak
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(height: context.width * (290 / 440)),
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
                  SizedBox(height: context.width * (290 / 440)),
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
    );
  }
}
