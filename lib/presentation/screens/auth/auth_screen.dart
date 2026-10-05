import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/login_form.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/register_form.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';

/// AuthMode menentukan container mana yang tampil.

class AuthScreen extends HookWidget {
  const AuthScreen({super.key, this.initialMode = AuthMode.login});

  final AuthMode initialMode;

  @override
  Widget build(BuildContext context) {
    final mode = useState(initialMode);
    final animController = useAnimationController(
      duration: const Duration(milliseconds: 380),
      initialValue: 1,
    );

    // Rebuild setiap frame animasi agar kondisi `isAnimating` selalu fresh
    useAnimation(animController);

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
      if (next == AuthMode.register) {
        animController.value = 0.0;
        mode.value = next;
        await animController.forward();
      } else {
        await animController.reverse();
        if (!context.mounted) return;
        mode.value = next;
      }
    }

    return Scaffold(
      backgroundColor: ColorPalette.background,
      // Keyboard inset ditangani manual di _AuthContainer supaya kita bisa
      // menyembunyikan footer saat keyboard terbuka.
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Header SVG — fixed, tidak ikut animasi
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
                  child: LoginForm(
                    onSwitchToRegister: () => switchMode(AuthMode.register),
                  ),
                ),
              ],
            ),
          ),

          // Register — overlay slide naik/turun di atas login
          if (mode.value == AuthMode.register || animController.isAnimating)
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: context.width * (290 / 440)),
                  Expanded(
                    child: SlideTransition(
                      position: slideAnim,
                      child: RegisterForm(
                        onSwitchToLogin: () => switchMode(AuthMode.login),
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
