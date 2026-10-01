import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/login_form.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/register_form.dart';

/// AuthMode menentukan container mana yang tampil.

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.initialMode = AuthMode.login});

  final AuthMode initialMode;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AuthMode _mode;

  // Animasi slide-up / slide-down container form
  late final AnimationController _animController;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _mode = widget.initialMode;

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );

    // Rebuild setiap frame animasi agar kondisi `isAnimating` selalu fresh
    _animController.addListener(() => setState(() {}));

    _slideAnim =
        Tween<Offset>(
          begin: const Offset(0, 1), // mulai dari bawah
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _animController,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          ),
        );

    // Langsung tampilkan container (tidak perlu entry animation, sudah ada dari
    // transisi route). Forward supaya form langsung visible.
    _animController.value = 1.0;
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  /// login → register: register slide naik dari bawah
  /// register → login: register slide turun keluar, login tetap diam
  Future<void> _switchMode(AuthMode next) async {
    if (next == _mode) return;
    if (next == AuthMode.register) {
      _animController.value = 0.0;
      setState(() => _mode = next);
      await _animController.forward();
    } else {
      await _animController.reverse();
      if (!mounted) return;
      setState(() => _mode = next);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      // Keyboard inset ditangani manual di _AuthContainer supaya kita bisa
      // menyembunyikan footer saat keyboard terbuka.
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Header SVG — fixed, tidak ikut animasi
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              AppIcons.authHeader,
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
                    onSwitchToRegister: () => _switchMode(AuthMode.register),
                  ),
                ),
              ],
            ),
          ),

          // Register — overlay slide naik/turun di atas login
          if (_mode == AuthMode.register || _animController.isAnimating)
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: context.width * (290 / 440)),
                  Expanded(
                    child: SlideTransition(
                      position: _slideAnim,
                      child: RegisterForm(
                        onSwitchToLogin: () => _switchMode(AuthMode.login),
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
