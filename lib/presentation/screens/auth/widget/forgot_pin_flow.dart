import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_otp.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_pin.dart';
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
    final authBloc = context.read<AuthBloc>();

    Future<void> showSuccess([String? message]) async {
      await Future<void>.delayed(const Duration(milliseconds: 200));
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
      await PinBottomSheet.show(
        context,
        variant: PinBottomSheetVariant.confirmPin,
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
      await PinBottomSheet.show(
        context,
        variant: PinBottomSheetVariant.newPin,
        onSubmitted: (pin) {
          Navigator.of(context).pop();
          unawaited(showConfirmPin(otp: otp, pin: pin));
        },
      );
    }

    authBloc.add(AuthEvent.postRequestResetPinOtp(email: email));

    await OtpBottomSheet.show(
      context,
      email: email,
      variant: OtpBottomSheetVariant.forgotPassword,
      onVerified: (otp) {
        Navigator.of(context).pop();
        unawaited(showNewPin(otp));
      },
      onResend: () {
        if (onResend != null) {
          onResend();
        } else {
          authBloc.add(AuthEvent.postRequestResetPinOtp(email: email));
        }
      },
    );
  }

  static Future<void> _complete(
    BuildContext context, {
    required String email,
    required String otp,
    required String pin,
    required ResetPinCallback? onResetPin,
    required Future<void> Function([String? message]) onSuccess,
  }) async {
    if (!context.mounted) return;
    if (onResetPin != null) {
      final success = await onResetPin(email: email, otp: otp, pin: pin);
      if (success && context.mounted) await onSuccess();
      return;
    }

    final authBloc = context.read<AuthBloc>();
    final completer = Completer<bool>();
    late final StreamSubscription<AuthState> subscription;

    subscription = authBloc.stream.listen((state) {
      if (!state.loadingResetPin) {
        if (state.successResetPin) {
          unawaited(subscription.cancel());
          if (!completer.isCompleted) completer.complete(true);
        } else if (state.message != null && state.message!.isNotEmpty) {
          unawaited(subscription.cancel());
          if (!completer.isCompleted) completer.complete(false);
        }
      }
    });

    authBloc.add(
      AuthEvent.postResetPin(
        email: email,
        code: otp,
        pin: pin,
      ),
    );

    final isSuccess = await completer.future;

    if (!context.mounted) return;

    if (isSuccess) {
      final successMsg =
          authBloc.state.resetPinResponse?.message ?? 'PIN reset successfully';
      await onSuccess(successMsg);
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          CustomSnackBar.failure(
            message: authBloc.state.message ?? 'Gagal mereset PIN',
          ),
        );
    }
  }
}
