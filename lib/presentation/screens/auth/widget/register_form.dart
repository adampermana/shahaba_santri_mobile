import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/auth_card.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_otp.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class RegisterForm extends HookWidget {
  const RegisterForm({required this.onSwitchToLogin, super.key});

  final VoidCallback onSwitchToLogin;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final nameText = useValueListenable(nameController).text;
    final emailText = useValueListenable(emailController).text;
    final passwordText = useValueListenable(passwordController).text;
    final confirmPasswordText =
        useValueListenable(confirmPasswordController).text;

    final isComplete = nameText.trim().isNotEmpty &&
        emailText.trim().length >= 4 &&
        passwordText.isNotEmpty &&
        confirmPasswordText.isNotEmpty;

    void onDaftar() {
      if (!(formKey.currentState?.validate() ?? false)) return;

      context.read<AuthBloc>().add(
        AuthEvent.postRegister(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );
    }

    Future<void> showOtpBottomSheet(int cooldownSeconds) async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;

      await OtpBottomSheet.show(
        context,
        email: emailController.text.trim(),
        variant: OtpBottomSheetVariant.verifyEmail,
        cooldownSeconds: cooldownSeconds,
      );
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        final becameSuccessRegister =
            !previous.successRegister && current.successRegister;
        final becameEmailUnverified =
            !previous.isEmailUnverified && current.isEmailUnverified;
        final becameRegisterError =
            !current.loading &&
            !current.successRegister &&
            current.message != null &&
            current.message!.isNotEmpty &&
            (previous.loading || previous.message != current.message);

        return becameSuccessRegister ||
            becameEmailUnverified ||
            becameRegisterError;
      },
      listener: (context, state) async {
        if (state.successRegister) {
          await showOtpBottomSheet(state.cooldownOtp);
        } else if (!state.loading && state.isEmailUnverified) {
          context.read<AuthBloc>().add(
            AuthEvent.postResendEmailOtp(email: emailController.text.trim()),
          );
          await showOtpBottomSheet(state.cooldownOtp);
        } else if (!state.loading &&
            state.message != null &&
            state.message!.isNotEmpty &&
            !state.successRegister) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              CustomSnackBar.failure(message: state.message!),
            );
        }
      },
      builder: (context, state) {
        final isLoading = state.loading;

        return AuthCard(
          title: 'Daftar dulu, yuk!',
          footerNote: 'Dengan mendaftar, Anda menyetujui \n',
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama
                CustomTextFormFieldWidget(
                  controller: nameController,
                  hintText: 'Ketik namamu di sini',
                  labelText: 'Nama kamu',
                  colorLabelText: const Color(0xFF0F172A),
                  textInputAction: TextInputAction.next,
                  fillColor: const Color(0xFFE8E8E8),
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
                    color: Color(0xFF0F172A),
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF5E5E5E),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 10, left: 16),
                    child: CacheImageOrSvg(
                      source: AppIcons.userLine,
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                      svgColor: Color(0xFF5E5E5E),
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
                  controller: emailController,
                  hintText: 'Ketik emailmu di sini',
                  labelText: 'Email kamu',
                  labelTextColor: const Color(0xFF0F172A),
                  fillColor: const Color(0xFFE8E8E8),
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
                    color: Color(0xFF0F172A),
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF5E5E5E),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 10, left: 16),
                    child: CacheImageOrSvg(
                      source: AppIcons.iconMail,
                      fit: BoxFit.contain,
                      width: 18,
                      height: 18,
                      svgColor: Color(0xFF5E5E5E),
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
                  controller: passwordController,
                  hintText: 'Ketik kata sandimu di sini',
                  labelText: 'Kata Sandi',
                  colorLabelText: const Color(0xFF0F172A),
                  textInputAction: TextInputAction.next,
                  fillColor: const Color(0xFFE8E8E8),
                  useBorder: true,
                  colorBorder: const Color(0x29E8E8E8),
                  focusedBorderColor: const Color(0xFF007D56),
                  borderRadius: 12,
                  textStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF0F172A),
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF5E5E5E),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 10, left: 16),
                    child: CacheImageOrSvg(
                      source: AppIcons.iconLock,
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                      svgColor: Color(0xFF5E5E5E),
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
                  controller: confirmPasswordController,
                  hintText: 'Ketik ulang kata sandimu di sini',
                  labelText: 'Konfirmasi Kata Sandi',
                  colorLabelText: const Color(0xFF0F172A),
                  textInputAction: TextInputAction.done,
                  fillColor: const Color(0xFFE8E8E8),
                  useBorder: true,
                  colorBorder: const Color(0x29E8E8E8),
                  focusedBorderColor: const Color(0xFF007D56),
                  borderRadius: 12,
                  textStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF0F172A),
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF5E5E5E),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 10, left: 16),
                    child: CacheImageOrSvg(
                      source: AppIcons.iconLock,
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                      svgColor: Color(0xFF5E5E5E),
                    ),
                  ),
                  visiblePasswordIcon: Icons.visibility_outlined,
                  invisiblePasswordIcon: Icons.visibility_off_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi kata sandi tidak boleh kosong';
                    }
                    if (value != passwordController.text) {
                      return 'Kata sandi tidak sama';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 32),

                SubmitButtonStylesWidget(
                  style: SubmitButtonStyle.elevated,
                  primaryColor: isComplete
                      ? const Color(0xFF007D56)
                      : ColorPalette.contentDisabled,
                  textButton: 'Daftar',
                  height: 48,
                  radius: 14,
                  isLoading: isLoading,
                  isActive: isComplete && !isLoading,
                  textStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: ColorPalette.kWhite,
                  ),
                  onPressed: onDaftar,
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
                        color: Color(0xFF5E5E5E),
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: onSwitchToLogin,
                      child: const Text(
                        'Masuk di sini, yuk!',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Color(0xFF007D56),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
