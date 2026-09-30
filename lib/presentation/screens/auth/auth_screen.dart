import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_password.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

/// AuthMode menentukan container mana yang tampil.
enum AuthMode { login, register }

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
                  child: _LoginForm(
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
                      child: _RegisterForm(
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

// LOGIN FORM
class _LoginForm extends StatefulWidget {
  const _LoginForm({required this.onSwitchToRegister, super.key});

  final VoidCallback onSwitchToRegister;

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  bool get isComplete {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(_emailController.text.trim());
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_rebuild);
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _emailController
      ..removeListener(_rebuild)
      ..dispose();
    super.dispose();
  }

  Future<void> _onLanjut() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    await BottomSheetPassword.show(
      context,
      email: _emailController.text.trim(),
      onKonfirmasi: (password) {
        Navigator.of(context).pop();
        // TODO: proses login
      },
      onLupaPassword: () {
        Navigator.of(context).pop();
        // TODO: navigate ke forgot password
      },
    );
  }

  void _onGoogle() {
    // TODO: Google sign-in
  }

  void _onApple() {
    // TODO: Apple sign-in
  }

  @override
  Widget build(BuildContext context) {
    return _AuthContainer(
      title: 'Masuk dulu, yuk!',
      footerNote: 'Dengan melanjutkan, Anda menyetujui \n',
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEmailFormField(
              controller: _emailController,
              hintText: 'Ketik emailmu di sini',
              labelText: 'Email kamu',
              labelTextColor: ColorPalette.inverseSecondary,
              textInputAction: TextInputAction.done,
              fillColor: const Color(0x1FFFFFFF),
              useBorder: true,
              colorBorder: const Color(0x29E8E8E8),
              focusedBorderColor: const Color(0xFF007D56),
              borderRadius: 12,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              textStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.kWhite,
              ),
              hintStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.contentDisabled,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 16),
                child: SvgPicture.asset(
                  AppIcons.iconMail,
                  width: 18,
                  height: 18,
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Isi email kamu dulu, yuk!';
                }
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegex.hasMatch(value.trim())) {
                  return 'Format email tidak valid';
                }
                return null;
              },
              onsubmit: (_) => _onLanjut(),
            ),

            const SizedBox(height: 24),

            SubmitButtonStylesWidget(
              style: SubmitButtonStyle.elevated,
              primaryColor: isComplete
                  ? ColorPalette.primaryColor
                  : ColorPalette.contentDisabled,
              textButton: 'Lanjut',
              height: 48,
              radius: 14,
              isActive: isComplete,
              textStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: ColorPalette.kWhite,
              ),
              onPressed: _onLanjut,
            ),

            const SizedBox(height: 24),

            // Divider
            const Row(
              children: [
                Expanded(child: _DividerLine()),
                SizedBox(width: 12),
                Text(
                  'Atau masuk pakai',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorPalette.contentDisabled,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(child: _DividerLine()),
              ],
            ),

            const SizedBox(height: 24),

            // Social login
            Row(
              children: [
                Expanded(
                  child: SubmitButtonStylesWidget(
                    style: SubmitButtonStyle.elevatedGlass,
                    primaryColor: ColorPalette.surfaceTranslucent,
                    blur: 0,
                    height: 48,
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(AppIcons.iconGoogle),
                    ),
                    textButton: 'Google',
                    textStyle: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: ColorPalette.kWhite,
                    ),
                    onPressed: _onGoogle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SubmitButtonStylesWidget(
                    style: SubmitButtonStyle.elevatedGlass,
                    primaryColor: ColorPalette.surfaceTranslucent,
                    blur: 0,
                    height: 48,
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(AppIcons.iconApple),
                    ),
                    textButton: 'Apple ID',
                    textStyle: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: ColorPalette.kWhite,
                    ),
                    onPressed: _onApple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Switch ke register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Belum punya akun?',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: ColorPalette.contentDisabled,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onSwitchToRegister,
                  child: const Text(
                    'Daftar di sini, yuk!',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Color(0xFF00C6BF),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// REGISTER FORM
class _RegisterForm extends StatefulWidget {
  const _RegisterForm({required this.onSwitchToLogin, super.key});

  final VoidCallback onSwitchToLogin;

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool get isComplete =>
      _nameController.text.trim().isNotEmpty &&
      _emailController.text.trim().length >= 4 &&
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    for (final c in [
      _nameController,
      _emailController,
      _passwordController,
      _confirmPasswordController,
    ]) {
      c.addListener(_rebuild);
    }
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    for (final c in [
      _nameController,
      _emailController,
      _passwordController,
      _confirmPasswordController,
    ]) {
      c
        ..removeListener(_rebuild)
        ..dispose();
    }
    super.dispose();
  }

  Future<void> _onDaftar() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    // TODO: proses register
  }

  @override
  Widget build(BuildContext context) {
    return _AuthContainer(
      title: 'Daftar dulu, yuk!',
      footerNote: 'Dengan mendaftar, Anda menyetujui \n',
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama
            CustomTextFormFieldWidget(
              controller: _nameController,
              hintText: 'Ketik namamu di sini',
              labelText: 'Nama kamu',
              colorLabelText: ColorPalette.inverseSecondary,
              textInputAction: TextInputAction.next,
              fillColor: const Color(0x1FFFFFFF),
              useBorder: true,
              colorBorder: const Color(0x29E8E8E8),
              focusedBorderColor: const Color(0xFF007D56),
              borderRadius: 12,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              textStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.kWhite,
              ),
              hintStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.contentDisabled,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Isi nama kamu dulu, yuk!';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Email
            CustomEmailFormField(
              controller: _emailController,
              hintText: 'Ketik emailmu di sini',
              labelText: 'Email kamu',
              labelTextColor: ColorPalette.inverseSecondary,
              fillColor: const Color(0x1FFFFFFF),
              useBorder: true,
              colorBorder: const Color(0x29E8E8E8),
              focusedBorderColor: const Color(0xFF007D56),
              borderRadius: 12,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              textStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.kWhite,
              ),
              hintStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.contentDisabled,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 16),
                child: SvgPicture.asset(
                  AppIcons.iconMail,
                  width: 18,
                  height: 18,
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Isi email kamu dulu, yuk!';
                }
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegex.hasMatch(value.trim())) {
                  return 'Format email tidak valid';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Password
            CustomPasswordFormField(
              controller: _passwordController,
              hintText: 'Ketik kata sandimu di sini',
              labelText: 'Kata Sandi',
              colorLabelText: ColorPalette.inverseSecondary,
              textInputAction: TextInputAction.next,
              fillColor: const Color(0x1FFFFFFF),
              useBorder: true,
              colorBorder: const Color(0x29E8E8E8),
              focusedBorderColor: const Color(0xFF007D56),
              borderRadius: 12,
              textStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.kWhite,
              ),
              hintStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.contentDisabled,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 16),
                child: SvgPicture.asset(
                  AppIcons.iconLock,
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    ColorPalette.contentDisabled,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              visiblePasswordIcon: Icons.visibility_outlined,
              invisiblePasswordIcon: Icons.visibility_off_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kata sandi tidak boleh kosong';
                }
                if (value.length < 6) {
                  return 'Kata sandi minimal 6 karakter';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Konfirmasi Password
            CustomPasswordFormField(
              controller: _confirmPasswordController,
              hintText: 'Ketik ulang kata sandimu di sini',
              labelText: 'Konfirmasi Kata Sandi',
              colorLabelText: ColorPalette.inverseSecondary,
              textInputAction: TextInputAction.done,
              fillColor: const Color(0x1FFFFFFF),
              useBorder: true,
              colorBorder: const Color(0x29E8E8E8),
              focusedBorderColor: const Color(0xFF007D56),
              borderRadius: 12,
              textStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.kWhite,
              ),
              hintStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorPalette.contentDisabled,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 16),
                child: SvgPicture.asset(
                  AppIcons.iconLock,
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    ColorPalette.contentDisabled,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              visiblePasswordIcon: Icons.visibility_outlined,
              invisiblePasswordIcon: Icons.visibility_off_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Konfirmasi kata sandi tidak boleh kosong';
                }
                if (value != _passwordController.text) {
                  return 'Kata sandi tidak sama';
                }
                return null;
              },
            ),

            const SizedBox(height: 32),

            SubmitButtonStylesWidget(
              style: SubmitButtonStyle.elevated,
              primaryColor: isComplete
                  ? ColorPalette.primaryColor
                  : ColorPalette.contentDisabled,
              textButton: 'Daftar',
              height: 48,
              radius: 14,
              isActive: isComplete,
              textStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: ColorPalette.kWhite,
              ),
              onPressed: _onDaftar,
            ),

            const SizedBox(height: 24),

            // Switch ke login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah punya akun?',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: ColorPalette.contentDisabled,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onSwitchToLogin,
                  child: const Text(
                    'Masuk di sini, yuk!',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Color(0xFF00C6BF),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// SHARED LAYOUT: container + title + footer T&K

class _AuthContainer extends StatelessWidget {
  const _AuthContainer({
    required this.title,
    required this.child,
    required this.footerNote,
  });

  final String title;
  final Widget child;
  final String footerNote;

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = keyboardHeight > 0;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorPalette.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(bottom: keyboardHeight),
      child: Column(
        children: [
          // Judul sticky — tidak ikut scroll
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Align(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: ColorPalette.kWhite,
                ),
              ),
            ),
          ),

          // Form scroll area — berisi form + row switch akun
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: child,
            ),
          ),

          // T&K — fixed di bottom, hidden saat keyboard terbuka
          if (!isKeyboardOpen) _TncFooter(footerNote: footerNote),
        ],
      ),
    );
  }
}

class _TncFooter extends StatelessWidget {
  const _TncFooter({required this.footerNote});

  final String footerNote;

  @override
  Widget build(BuildContext context) {
    final bottomSafe = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 8, 24, 16 + bottomSafe),
      child: SizedBox(
        width: double.infinity,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: footerNote,
                style: const TextStyle(
                  color: ColorPalette.contentDisabled,
                  fontSize: 12,
                  fontFamily: 'Satoshi Variable',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const TextSpan(
                text: 'Syarat & Ketentuan',
                style: TextStyle(
                  color: Color(0xFF007D56),
                  fontSize: 12,
                  fontFamily: 'Satoshi Variable',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: ' serta Kebijakan Privasi kami.',
                style: TextStyle(
                  color: ColorPalette.contentDisabled,
                  fontSize: 12,
                  fontFamily: 'Satoshi Variable',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// SHARED WIDGET

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(0x29E8E8E8),
    );
  }
}
