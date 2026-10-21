import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_account_bloc/auth_account_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/auth_card.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_pin.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/forgot_pin_flow.dart';
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
    final passwordController = useTextEditingController();

    final emailText = useValueListenable(emailController).text;
    final passwordText = useValueListenable(passwordController).text;

    final isComplete =
        _emailRegex.hasMatch(emailText.trim()) && passwordText.isNotEmpty;

    // Future<void> showForgotPassword() async {
    //   await WidgetsBinding.instance.endOfFrame;
    //   if (!context.mounted) return;
    //   await ForgotPasswordFlow.show(
    //     context,
    //     email: emailController.text.trim(),
    //   );
    // }

    Future<void> showForgotPin() async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      await ForgotPinFlow.show(
        context,
        email: emailController.text.trim(),
      );
    }

    // Future<void> showPinLogin() async {
    //   await WidgetsBinding.instance.endOfFrame;
    //   if (!context.mounted) return;
    //   await PinBottomSheet.show(
    //     context,
    //     variant: PinBottomSheetVariant.currentPin,
    //     onSubmitted: (pin) {
    //       context.read<AuthBloc>().add(
    //         AuthEvent.postLoginPin(
    //           identifier: emailController.text.trim(),
    //           pin: pin,
    //         ),
    //       );
    //     },
    //     onUsePassword: () {
    //       Navigator.of(context).pop();
    //     },
    //     onForgotPin: () {
    //       Navigator.of(context).pop();
    //       unawaited(showForgotPin());
    //     },
    //   );
    // }

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        final becameSuccessLogin =
            !previous.successLoginUser && current.successLoginUser;
        final becameSuccessLoginPin =
            !previous.successLoginPin && current.successLoginPin;
        final becameLoginError =
            previous.loadingUser &&
            !current.loadingUser &&
            !current.successLoginUser &&
            current.message != null &&
            current.message!.isNotEmpty;

        return becameSuccessLogin || becameSuccessLoginPin || becameLoginError;
      },
      listener: (context, state) async {
        if (state.successLoginUser) {
          // CreatePinFlow.shouldPromptOnMain = true;
          final message = state.message;
          if (message != null && message.isNotEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(CustomSnackBar.authSuccess(message: message));
          }
          sl<AuthAccountBloc>().add(const AuthAccountEvent.checkAuthStatus());
        } else {
          final message = state.message;
          if (message != null && message.isNotEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(CustomSnackBar.failure(message: message));
          }
        }

        //  else if (state.successLoginPin) {
        //   CreatePinFlow.shouldPromptOnMain = false;
        //   final message = state.message;
        //   if (message != null && message.isNotEmpty) {
        //     ScaffoldMessenger.of(context)
        //       ..hideCurrentSnackBar()
        //       ..showSnackBar(CustomSnackBar.authSuccess(message: message));
        //   }
        //   sl<AuthAccountBloc>().add(const AuthAccountEvent.checkAuthStatus());
        // }
        // else if (!state.loadingUser &&
        //     state.message != null &&
        //     state.message!.isNotEmpty &&
        //     !state.successLoginUser) {
        //   final msg = state.message!.toLowerCase();
        //   if (msg.contains('pin') || msg.contains('gunakan pin')) {
        //     await showPinLogin();
        //   } else {
        //     ScaffoldMessenger.of(context)
        //       ..hideCurrentSnackBar()
        //       ..showSnackBar(
        //         CustomSnackBar.failure(message: state.message!),
        //       );
        //   }
        // }
      },
      builder: (context, state) {
        final isLoading = state.loadingUser;

        return AuthCard(
          title: 'Masuk dulu, yuk!',
          footerNote: 'Dengan melanjutkan, Anda menyetujui \n',
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email Field
                CustomEmailFormField(
                  controller: emailController,
                  hintText: 'Ketik emailmu di sini',
                  labelText: 'Email ',
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 16),
                    child: SvgPicture.asset(
                      AppIcons.iconMail,
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF5E5E5E),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Isi email kamu dulu, yuk!';
                    }
                    if (!_emailRegex.hasMatch(value.trim())) {
                      return 'Emailnya kurang pas nih. Coba dicek lagi, ya.';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Password Field Container with Label Row
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kata sandi',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: showForgotPassword,
                        //   child: const Text(
                        //     'Lupa sandinya?',
                        //     style: TextStyle(
                        //       fontFamily: 'Satoshi',
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 12,
                        //       color: Color(0xFF00C6BF),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CustomPasswordFormField(
                      controller: passwordController,
                      hintText: 'Ketik kata sandimu di sini',
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
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 16),
                        child: SvgPicture.asset(
                          AppIcons.iconLock,
                          width: 18,
                          height: 18,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF5E5E5E),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      visiblePasswordIcon: Icons.visibility_outlined,
                      invisiblePasswordIcon: Icons.visibility_off_outlined,
                      obscureColor: const Color(0xFF5E5E5E),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Isi kata sandimu dulu, yuk!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Button Lanjut
                SubmitButtonStylesWidget(
                  style: SubmitButtonStyle.elevated,
                  primaryColor: isComplete
                      ? const Color(0xFF007D56)
                      : const Color(0xFFA6A6A6),
                  textButton: 'Lanjut',
                  height: 48,
                  radius: 1000,
                  isLoading: isLoading,
                  isActive: isComplete && !isLoading,
                  textStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: ColorPalette.kWhite,
                  ),
                  onPressed: () async {
                    if (!(formKey.currentState?.validate() ?? false)) return;
                    context.read<AuthBloc>().add(
                      AuthEvent.postloginUser(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Switch ke Register
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text(
                //       'Belum punya akun?',
                //       style: TextStyle(
                //         fontFamily: 'Satoshi',
                //         fontWeight: FontWeight.w400,
                //         fontSize: 13,
                //         color: Color(0xFF5E5E5E),
                //       ),
                //     ),
                //     const SizedBox(width: 4),
                //     GestureDetector(
                //       onTap: onSwitchToRegister,
                //       child: const Text(
                //         'Daftar di sini, yuk!',
                //         style: TextStyle(
                //           fontFamily: 'Satoshi',
                //           fontWeight: FontWeight.w700,
                //           fontSize: 13,
                //           color: Color(0xFF007D56),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
