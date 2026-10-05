import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_credential.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_otp.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';

typedef ResetPinCallback =
    FutureOr<bool> Function({
      required String email,
      required String otp,
      required String pin,
    });

class ForgotPinFlow {
  const ForgotPinFlow._();

  static Future<void> show(
    BuildContext context, {
    required String email,
    ResetPinCallback? onResetPin,
    VoidCallback? onResend,
  }) async {
    Future<void> showSuccess() async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          CustomSnackBar.authSuccess(
            message: 'Sip! PIN baru sudah disimpan.',
          ),
        );
    }

    Future<void> showConfirmPin({
      required String otp,
      required String pin,
    }) async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      await CredentialBottomSheet.show(
        context,
        variant: CredentialBottomSheetVariant.confirmPin,
        expectedPin: pin,
        onSubmitted: (confirmedPin) {
          Navigator.of(context).pop();
          unawaited(
            _complete(
              context,
              email: email,
              otp: otp,
              pin: confirmedPin,
              onResetPin: onResetPin,
              onSuccess: showSuccess,
            ),
          );
        },
      );
    }

    Future<void> showNewPin(String otp) async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      await CredentialBottomSheet.show(
        context,
        variant: CredentialBottomSheetVariant.newPin,
        onSubmitted: (pin) {
          Navigator.of(context).pop();
          unawaited(showConfirmPin(otp: otp, pin: pin));
        },
      );
    }

    await OtpBottomSheet.show(
      context,
      email: email,
      variant: OtpBottomSheetVariant.forgotPassword,
      onVerified: (otp) {
        Navigator.of(context).pop();
        unawaited(showNewPin(otp));
      },
      onResend: onResend,
    );
  }

  static Future<void> _complete(
    BuildContext context, {
    required String email,
    required String otp,
    required String pin,
    required ResetPinCallback? onResetPin,
    required Future<void> Function() onSuccess,
  }) async {
    if (!context.mounted) return;
    final success = onResetPin == null
        ? null
        : await onResetPin(email: email, otp: otp, pin: pin);
    if ((success ?? true) && context.mounted) await onSuccess();
  }
}
