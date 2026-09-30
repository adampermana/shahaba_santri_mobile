import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/infrastructure/extension/string_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_password.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool get isComplete => _emailController.text.trim().length >= 4;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChanged);
  }

  void _onEmailChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _emailController
      ..removeListener(_onEmailChanged)
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
        // TODO: proses login dengan email + password
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

  void _onDaftar() {
    // TODO: navigate ke register screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: Stack(
        children: [
          // Header ilustrasi SVG — full width, tinggi sesuai aspect ratio SVG (402×362)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              AppIcons.authHeader,
              width: context.width,
              fit: BoxFit.fitWidth,
            ),
          ),

          // Form area — scroll aman saat keyboard muncul
          SafeArea(
            child: Column(
              children: [
                // Spacer menyesuaikan tinggi header SVG
                // SVG native: 402×362 → height = width * (290/402)
                SizedBox(
                  height: context.width * (290 / 402),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: ColorPalette.background,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                24,
                                32,
                                24,
                                40,
                              ),
                              child: Form(
                                key: _formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    const Align(
                                      child: Text(
                                        'Masuk dulu, yuk!',
                                        style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                          color: ColorPalette.kWhite,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 24),

                                    // Email Field
                                    CustomEmailFormField(
                                      controller: _emailController,
                                      hintText: 'Ketik emailmu di sini',
                                      labelText: 'Email kamu',
                                      labelTextColor:
                                          ColorPalette.inverseSecondary,
                                      textInputAction: TextInputAction.done,
                                      fillColor: const Color(0x1FFFFFFF),
                                      useBorder: true,
                                      colorBorder: const Color(0x29E8E8E8),
                                      focusedBorderColor: const Color(
                                        0xFF007D56,
                                      ),
                                      borderRadius: 12,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 16,
                                        ),
                                        child: SvgPicture.asset(
                                          AppIcons.iconMail,
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                      validator: (value) {
                                        final cleanValue =
                                            value?.trim() ?? '';
                                        if (cleanValue.isEmpty) {
                                          return 'Isi email kamu dulu, yuk!';
                                        }
                                        if (!cleanValue.isEmail) {
                                          return 'Format email tidak valid';
                                        }
                                        return null;
                                      },
                                      onsubmit: (_) => _onLanjut(),
                                    ),

                                    const SizedBox(height: 24),

                                    // Tombol Lanjut
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

                                    // Divider "Atau masuk pakai"
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

                                    // Social Login
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SubmitButtonStylesWidget(
                                            style:
                                                SubmitButtonStyle.elevatedGlass,
                                            primaryColor:
                                                ColorPalette.surfaceTranslucent,
                                            blur: 0,
                                            height: 48,
                                            icon: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: SvgPicture.asset(
                                                AppIcons.iconGoogle,
                                              ),
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
                                            style:
                                                SubmitButtonStyle.elevatedGlass,
                                            primaryColor:
                                                ColorPalette.surfaceTranslucent,
                                            blur: 0,
                                            height: 48,
                                            icon: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: SvgPicture.asset(
                                                AppIcons.iconApple,
                                              ),
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

                                    // Sign up link — tepat di bawah social login
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          onTap: _onDaftar,
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

                                    // Dorong terms ke paling bawah
                                    const Spacer(),

                                    // Syarat & Ketentuan — bottom center
                                    const SizedBox(
                                      width: double.infinity,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Dengan melanjutkan, Anda '
                                                  'menyetujui \n',
                                              style: TextStyle(
                                                color: ColorPalette
                                                    .contentDisabled,
                                                fontSize: 12,
                                                fontFamily: 'Satoshi Variable',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Syarat & Ketentuan',
                                              style: TextStyle(
                                                color: Color(0xFF007D56),
                                                fontSize: 12,
                                                fontFamily: 'Satoshi Variable',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' serta Kebijakan Privasi kami.',
                                              style: TextStyle(
                                                color: ColorPalette
                                                    .contentDisabled,
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
                                  ],
                                ),
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
        ],
      ),
    );
  }
}

// Divider Line
class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(0x29E8E8E8), // rgba(232,232,232,0.16)
    );
  }
}
