import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/auth_card.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_otp.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_password.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/devider_line.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({required this.onSwitchToRegister, super.key});

  final VoidCallback onSwitchToRegister;

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
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
      onLupaPassword: () async {
        Navigator.of(context).pop();
        await WidgetsBinding.instance.endOfFrame;
        if (!mounted) return;
        await BottomSheetOtp.show(
          context,
          email: _emailController.text.trim(),
          onVerified: (otp) {
            Navigator.of(context).pop();
            // TODO: verifikasi OTP forgot password lalu buka password baru
          },
          onResend: () {
            // TODO: request OTP forgot password
          },
        );
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
    return AuthCard(
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
                Expanded(child: DividerLine()),
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
                Expanded(child: DividerLine()),
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
