import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class PinInfoBottomSheet extends StatelessWidget {
  const PinInfoBottomSheet({
    super.key,
    this.onSetPin,
    this.onSkip,
  });

  final VoidCallback? onSetPin;
  final VoidCallback? onSkip;

  static Future<bool?> show(
    BuildContext context, {
    VoidCallback? onSetPin,
    VoidCallback? onSkip,
  }) {
    final authBloc = context.read<AuthBloc>();
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: authBloc,
        child: PinInfoBottomSheet(
          onSetPin: onSetPin,
          onSkip: onSkip,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorPalette.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIllustration(),
          const SizedBox(height: 32),
          _buildTitle(),
          const SizedBox(height: 8),
          _buildSubtitle(),
          const SizedBox(height: 32),
          _buildActionButtons(context),
          const _HomeIndicator(),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    return SvgPicture.asset(
      AppIcons.pinInfoIllustration,
      width: 91,
      height: 120,
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Biar besok masuknya lebih cepet',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w900,
        fontSize: 20,
        color: ColorPalette.kWhite,
      ),
    );
  }

  Widget _buildSubtitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Aktifin PIN yuk! Mulai sekarang, kamu nggak usah repot-repot '
        'ngetik kata sandi lagi tiap mau masuk.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.4,
          color: ColorPalette.inverseSecondary,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SubmitButtonStylesWidget(
          style: SubmitButtonStyle.elevated,
          primaryColor: ColorPalette.primaryColor,
          textButton: 'Bikin PIN Sekarang',
          height: 48,
          radius: 9999,
          textStyle: const TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: ColorPalette.kWhite,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
            onSetPin?.call();
          },
        ),
        const SizedBox(height: 16),
        SubmitButtonStylesWidget(
          style: SubmitButtonStyle.text,
          textButton: 'Nanti Aja',
          height: 48,
          radius: 9999,
          textStyle: const TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: ColorPalette.kWhite,
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
            onSkip?.call();
          },
        ),
      ],
    );
  }
}

class _HomeIndicator extends StatelessWidget {
  const _HomeIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 34,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 144,
          height: 5,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: ColorPalette.kWhite,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
