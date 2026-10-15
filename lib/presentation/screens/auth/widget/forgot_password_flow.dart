import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_otp.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_pin.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';

typedef ResetPasswordCallback =
    FutureOr<bool> Function({
      required String email,
      required String otp,
      required String newPassword,
    });

class ForgotPasswordFlow {
  const ForgotPasswordFlow._();

  static Future<void> show(
    BuildContext context, {
    required String email,
    ResetPasswordCallback? onResetPassword,
    VoidCallback? onResend,
    VoidCallback? onSuccess,
  }) async {
    final authBloc = context.read<AuthBloc>();

    Future<void> showSuccess([String? message]) async {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          CustomSnackBar.authSuccess(
            message: 'Kata sandi diperbarui. Silakan masuk kembali.',
          ),
        );
      onSuccess?.call();
    }

    Future<void> showNewPassword(String otp) async {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      if (!context.mounted) return;
      await PinBottomSheet.show(
        context,
        variant: PinBottomSheetVariant.newPassword,
        onSubmitted: (newPassword) {
          Navigator.of(context).pop();
          unawaited(
            _complete(
              context,
              email: email,
              otp: otp,
              newPassword: newPassword,
              onResetPassword: onResetPassword,
              onSuccess: showSuccess,
            ),
          );
        },
      );
    }

    authBloc.add(AuthEvent.postRequestForgotPasswordOtp(email: email));

    await OtpBottomSheet.show(
      context,
      email: email,
      variant: OtpBottomSheetVariant.forgotPassword,
      onVerified: (otp) {
        Navigator.of(context).pop();
        unawaited(showNewPassword(otp));
      },
      onResend: () {
        if (onResend != null) {
          onResend();
        } else {
          authBloc.add(AuthEvent.postRequestForgotPasswordOtp(email: email));
        }
      },
    );
  }

  static Future<void> _complete(
    BuildContext context, {
    required String email,
    required String otp,
    required String newPassword,
    required ResetPasswordCallback? onResetPassword,
    required Future<void> Function([String? message]) onSuccess,
  }) async {
    if (!context.mounted) return;
    if (onResetPassword != null) {
      final success = await onResetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );
      if (success && context.mounted) await onSuccess();
      return;
    }

    final authBloc = context.read<AuthBloc>();
    final completer = Completer<bool>();
    late final StreamSubscription<AuthState> subscription;

    subscription = authBloc.stream.listen((state) {
      if (!state.loadingResetPassword) {
        if (state.successResetPassword) {
          unawaited(subscription.cancel());
          if (!completer.isCompleted) completer.complete(true);
        } else if (state.message != null && state.message!.isNotEmpty) {
          unawaited(subscription.cancel());
          if (!completer.isCompleted) completer.complete(false);
        }
      }
    });

    authBloc.add(
      AuthEvent.postResetPassword(
        email: email,
        code: otp,
        newPassword: newPassword,
      ),
    );

    final isSuccess = await completer.future;

    if (!context.mounted) return;

    if (isSuccess) {
      await onSuccess('Kata sandi diperbarui. Silakan masuk kembali.');
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          CustomSnackBar.failure(
            message: authBloc.state.message ?? 'Gagal mereset kata sandi',
          ),
        );
    }
  }
}
