import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_account_bloc/auth_account_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class BottomSheetPassword extends StatefulWidget {
  const BottomSheetPassword({
    required this.email,
    required this.parentContext,
    super.key,
    this.onKonfirmasi,
    this.onLupaPassword,
  });

  final String email;
  final BuildContext parentContext;
  final ValueChanged<String>? onKonfirmasi;
  final VoidCallback? onLupaPassword;

  /// Show bottom sheet dari luar.
  static Future<void> show(
    BuildContext context, {
    required String email,
    ValueChanged<String>? onKonfirmasi,
    VoidCallback? onLupaPassword,
  }) {
    final authBloc = context.read<AuthBloc>();
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: authBloc,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BottomSheetPassword(
            email: email,
            parentContext: context,
            onKonfirmasi: onKonfirmasi,
            onLupaPassword: onLupaPassword,
          ),
        ),
      ),
    );
  }

  @override
  State<BottomSheetPassword> createState() => _BottomSheetPasswordState();
}

class _BottomSheetPasswordState extends State<BottomSheetPassword> {
  final _passwordController = TextEditingController();
  bool get isComplete => _passwordController.text.trim().length >= 4;

  final _formKey = GlobalKey<FormState>();
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    if (_passwordError != null) {
      _passwordError = null;
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _passwordController
      ..removeListener(_onPasswordChanged)
      ..dispose();
    super.dispose();
  }

  void _onKonfirmasi() {
    if (_passwordError != null) {
      setState(() => _passwordError = null);
    }
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (widget.onKonfirmasi != null) {
      widget.onKonfirmasi?.call(_passwordController.text);
      return;
    }

    context.read<AuthBloc>().add(
      AuthEvent.postloginUser(
        identifier: widget.email,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        final becameSuccessLogin =
            !previous.successLoginUser && current.successLoginUser;
        final becameLoginError =
            !current.loadingUser &&
            !current.successLoginUser &&
            current.message != null &&
            current.message!.isNotEmpty &&
            (previous.loadingUser || previous.message != current.message);

        return becameSuccessLogin || becameLoginError;
      },
      listener: (context, state) {
        if (state.successLoginUser || state.statusCode == 200) {
          Navigator.of(context).pop();

          final message = state.message;
          if (message != null && message.isNotEmpty) {
            ScaffoldMessenger.of(widget.parentContext)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                CustomSnackBar.authSuccess(message: message),
              );
          }
          sl<AuthAccountBloc>().add(const AuthAccountEvent.checkAuthStatus());
        } else if (!state.loadingUser &&
            (state.alert != null || state.message != null)) {
          final statusCode = state.statusCode;
          final errorMessage = state.message;

          if (statusCode == 400 || statusCode == 401) {
            setState(() {
              _passwordError = errorMessage ?? 'Kata sandi salah';
            });
            _formKey.currentState?.validate();
          } else {
            if (errorMessage != null && errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  CustomSnackBar.failure(message: errorMessage),
                );
            }
          }
        }
      },
      builder: (context, state) {
        final isLoading = state.loadingUser;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorPalette.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Title
                const Center(
                  child: Text(
                    'Masukin kata sandi kamu',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: ColorPalette.kWhite,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Kata sandi',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: ColorPalette.inverseSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.onLupaPassword,
                          child: const Text(
                            'Lupa sandinya?',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF00C6BF),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Input password
                    CustomPasswordFormField(
                      controller: _passwordController,
                      hintText: 'Ketik kata sandimu di sini',
                      fillColor: const Color(0x1FFFFFFF),
                      useBorder: true,
                      colorBorder: const Color(0x29E8E8E8),
                      focusedBorderColor: ColorPalette.primaryColor,
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
                        if (_passwordError != null) {
                          return _passwordError;
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Tombol Konfirmasi
                SubmitButtonStylesWidget(
                  style: SubmitButtonStyle.elevated,
                  primaryColor: isComplete
                      ? ColorPalette.primaryColor
                      : ColorPalette.contentDisabled,
                  textButton: 'Konfirmasi',
                  height: 48,
                  radius: 9999,
                  isLoading: isLoading,
                  isActive: isComplete && !isLoading,
                  textStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: ColorPalette.kWhite,
                  ),
                  onPressed: _onKonfirmasi,
                ),

                // Safe area bottom
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        );
      },
    );
  }
}
