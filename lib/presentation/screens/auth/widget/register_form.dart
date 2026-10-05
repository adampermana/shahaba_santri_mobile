import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/auth_card.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_otp.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({required this.onSwitchToLogin, super.key});

  final VoidCallback onSwitchToLogin;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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

    await OtpBottomSheet.show(
      context,
      email: _emailController.text.trim(),
      variant: OtpBottomSheetVariant.verifyEmail,
      onVerified: (_) {
        Navigator.of(context).pop();
        unawaited(_showGreetingScreen());
      },
    );
  }

  Future<void> _showGreetingScreen() async {
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted) return;

    context.go(RouterPath.greetingPath);
  }

  @override
  Widget build(BuildContext context) {
    return AuthCard(
      title: 'Daftar dulu, yuk!',
      footerNote: 'Dengan mendaftar, Anda menyetujui \n',
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
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
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 10, left: 16),
                child: CacheImageOrSvg(
                  source: AppIcons.userLine,
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                  svgColor: ColorPalette.contentDisabled,
                ),
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
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 10, left: 16),
                child: CacheImageOrSvg(
                  source: AppIcons.iconLock,
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                  svgColor: ColorPalette.contentDisabled,
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
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 10, left: 16),
                child: CacheImageOrSvg(
                  source: AppIcons.iconLock,
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                  svgColor: ColorPalette.contentDisabled,
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
