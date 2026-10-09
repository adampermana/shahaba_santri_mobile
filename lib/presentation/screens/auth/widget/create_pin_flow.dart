import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_account_bloc/auth_account_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_pin.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_pin_info.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';

class CreatePinFlow {
  const CreatePinFlow._();

  static Future<void> show(
    BuildContext context, {
    VoidCallback? onComplete,
    VoidCallback? onSkip,
  }) async {
    final authBloc = context.read<AuthBloc>();

    void finishAuth() {
      if (onComplete != null) {
        onComplete();
      } else {
        sl<AuthAccountBloc>().add(const AuthAccountEvent.checkAuthStatus());
      }
    }

    Future<void> submitPin(String pin) async {
      final completer = Completer<bool>();
      late final StreamSubscription<AuthState> subscription;

      subscription = authBloc.stream.listen((state) {
        if (!state.loadingCreatePin) {
          if (state.successCreatePin) {
            unawaited(subscription.cancel());
            if (!completer.isCompleted) completer.complete(true);
          } else if (state.message != null && state.message!.isNotEmpty) {
            unawaited(subscription.cancel());
            if (!completer.isCompleted) completer.complete(false);
          }
        }
      });

      authBloc.add(AuthEvent.postCreatePin(pin: pin));

      final isSuccess = await completer.future;

      if (!context.mounted) return;

      if (isSuccess) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            CustomSnackBar.authSuccess(
              message: authBloc.state.createPinResponse?.message ??
                  'PIN berhasil dibuat.',
            ),
          );
        finishAuth();
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            CustomSnackBar.failure(
              message: authBloc.state.message ?? 'Gagal membuat PIN',
            ),
          );
      }
    }

    Future<void> showConfirmPin(String pin) async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      await PinBottomSheet.show(
        context,
        variant: PinBottomSheetVariant.confirmPin,
        expectedPin: pin,
        onSubmitted: (confirmedPin) {
          Navigator.of(context).pop();
          unawaited(submitPin(confirmedPin));
        },
      );
    }

    Future<void> showNewPin() async {
      await WidgetsBinding.instance.endOfFrame;
      if (!context.mounted) return;
      await PinBottomSheet.show(
        context,
        variant: PinBottomSheetVariant.newPin,
        onSubmitted: (pin) {
          Navigator.of(context).pop();
          unawaited(showConfirmPin(pin));
        },
      );
    }

    await PinInfoBottomSheet.show(
      context,
      onSetPin: () {
        unawaited(showNewPin());
      },
      onSkip: () {
        if (onSkip != null) {
          onSkip();
        } else {
          finishAuth();
        }
      },
    );
  }
}
