import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/auth_card.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_otp.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_password.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_pin.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/devider_line.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

final _emailRegex = RegExp(
  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
);

class LoginForm extends HookWidget {
  const LoginForm({required this.onSwitchToRegister, super.key});

  final VoidCallback onSwitchToRegister;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController();
    final emailText = useValueListenable(emailController);

    final isComplete = _emailRegex.hasMatch(emailText.text.trim());

    Future<void> showPasswordSuccess() async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          CustomSnackBar.authSuccess(
            message: 'Kata sandi diperbarui. Silakan masuk kembali.',
          ),
        );
    }

    Future<void> showNewPassword() async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      await PinBottomSheet.show(
        context,
        variant: PinBottomSheetVariant.newPassword,
        onSubmitted: (_) {
          Navigator.of(context).pop();
          unawaited(showPasswordSuccess());
        },
      );
    }

    Future<void> showForgotPasswordOtp() async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      await OtpBottomSheet.show(
        context,
        email: emailController.text.trim(),
        variant: OtpBottomSheetVariant.forgotPassword,
        onVerified: (_) {
          Navigator.of(context).pop();
          unawaited(showNewPassword());
        },
        onResend: () {
          // TODO(adam): Hubungkan endpoint request OTP forgot password.
        },
      );
    }

    Future<void> showPasswordLogin() async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      await BottomSheetPassword.show(
        context,
        email: emailController.text.trim(),
        onLupaPassword: () {
          Navigator.of(context).pop();
          unawaited(showForgotPasswordOtp());
        },
      );
    }

    Future<void> onLanjut() async {
      if (!(formKey.currentState?.validate() ?? false)) return;
      await showPasswordLogin();
    }

    void onGoogle() {
      // TODO(adam): Hubungkan Google sign-in.
    }

    void onApple() {
      // TODO(adam): Hubungkan Apple sign-in.
    }

    return AuthCard(
      title: 'Masuk dulu, yuk!',
      footerNote: 'Dengan melanjutkan, Anda menyetujui \n',
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEmailFormField(
              controller: emailController,
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
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 10, left: 16),
                child: CacheImageOrSvg(
                  source: AppIcons.iconMail,
                  fit: BoxFit.contain,
                  width: 18,
                  height: 18,
                  svgColor: ColorPalette.contentDisabled,
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Isi email kamu dulu, yuk!';
                }
                if (!_emailRegex.hasMatch(value.trim())) {
                  return 'Format email tidak valid';
                }
                return null;
              },
              onsubmit: (_) => onLanjut(),
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
              onPressed: onLanjut,
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
                    onPressed: onGoogle,
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
                    onPressed: onApple,
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
                  onTap: onSwitchToRegister,
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
