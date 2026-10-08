import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

enum PinBottomSheetVariant {
  newPassword,
  newPin,
  confirmPin,
  currentPin,
}

class PinBottomSheet extends StatefulWidget {
  const PinBottomSheet({
    required this.variant,
    super.key,
    this.expectedPin,
    this.onSubmitted,
    this.onUsePassword,
    this.onForgotPin,
  });

  final PinBottomSheetVariant variant;
  final String? expectedPin;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onUsePassword;
  final VoidCallback? onForgotPin;

  static Future<void> show(
    BuildContext context, {
    required PinBottomSheetVariant variant,
    String? expectedPin,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onUsePassword,
    VoidCallback? onForgotPin,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: PinBottomSheet(
            variant: variant,
            expectedPin: expectedPin,
            onSubmitted: onSubmitted,
            onUsePassword: onUsePassword,
            onForgotPin: onForgotPin,
          ),
        ),
      ),
    );
  }

  @override
  State<PinBottomSheet> createState() => _PinBottomSheetState();
}

class _PinBottomSheetState extends State<PinBottomSheet> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _pinController = TextEditingController();
  var _isLoading = false;
  var _hasSubmitted = false;

  bool get _isPassword => widget.variant == PinBottomSheetVariant.newPassword;

  String get _title => switch (widget.variant) {
    PinBottomSheetVariant.newPassword => 'Masukin kata sandi Baru kamu',
    PinBottomSheetVariant.newPin => 'Masukin PIN Baru kamu',
    PinBottomSheetVariant.confirmPin => 'Konfirmasi PIN Baru kamu',
    PinBottomSheetVariant.currentPin => 'Masukin PIN kamu',
  };

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_rebuild);
    _confirmPasswordController.addListener(_rebuild);
    _pinController.addListener(_rebuild);
  }

  @override
  void dispose() {
    _newPasswordController
      ..removeListener(_rebuild)
      ..dispose();
    _confirmPasswordController
      ..removeListener(_rebuild)
      ..dispose();
    _pinController
      ..removeListener(_rebuild)
      ..dispose();
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  bool _hasUppercase(String value) => RegExp('[A-Z]').hasMatch(value);

  bool _hasLowercase(String value) => RegExp('[a-z]').hasMatch(value);

  bool _hasNumberOrSymbol(String value) => RegExp(r'[\d\W]').hasMatch(value);

  bool _isPasswordValid(String value) =>
      value.length >= 8 &&
      _hasUppercase(value) &&
      _hasLowercase(value) &&
      _hasNumberOrSymbol(value);

  bool get _isConfirmPasswordValid =>
      _isPasswordValid(_newPasswordController.text) &&
      _confirmPasswordController.text == _newPasswordController.text;

  bool get _isPinComplete => _pinController.text.length == 6;

  bool get _isPinValid {
    if (!_isPinComplete) return false;
    final expectedPin = widget.expectedPin;
    return expectedPin == null || expectedPin == _pinController.text;
  }

  void _submitPassword() {
    if (_isLoading || _hasSubmitted || !_isConfirmPasswordValid) return;
    final callback = widget.onSubmitted;
    if (callback == null) return;
    setState(() {
      _isLoading = true;
      _hasSubmitted = true;
    });
    callback(_newPasswordController.text);
  }

  void _submitPin() {
    if (_isLoading || _hasSubmitted || !_isPinValid) return;
    final callback = widget.onSubmitted;
    if (callback == null) return;
    setState(() {
      _isLoading = true;
      _hasSubmitted = true;
    });
    callback(_pinController.text);
  }

  void _onDigit(String digit) {
    if (_hasSubmitted || _pinController.text.length >= 6) return;
    _pinController.text = '${_pinController.text}$digit';
    if (_isPinComplete) _submitPin();
  }

  void _onBackspace() {
    if (_hasSubmitted || _pinController.text.isEmpty) return;
    _pinController.text = _pinController.text.substring(
      0,
      _pinController.text.length - 1,
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
      child: _isPassword ? _buildPasswordSheet() : _buildPinSheet(),
    );
  }

  Widget _buildPasswordSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle(),
        const SizedBox(height: 32),
        Column(
          children: [
            _buildPasswordField(
              controller: _newPasswordController,
              label: 'Kata sandi baru',
              hint: 'Ketik kata sandimu di sini',
            ),
            const SizedBox(height: 24),
            _buildPasswordField(
              controller: _confirmPasswordController,
              label: 'Konfirmasi kata sandi',
              hint: 'Ketik kata sandimu di sini',
            ),
            const SizedBox(height: 8),
            _buildPasswordRules(),
          ],
        ),
        const SizedBox(height: 32),
        SubmitButtonStylesWidget(
          style: SubmitButtonStyle.elevated,
          primaryColor: _isConfirmPasswordValid
              ? ColorPalette.primaryColor
              : ColorPalette.contentDisabled,
          textButton: 'Konfirmasi',
          height: 48,
          radius: 9999,
          isLoading: _isLoading,
          isActive: _isConfirmPasswordValid,
          textStyle: const TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: ColorPalette.kWhite,
          ),
          onPressed: _submitPassword,
        ),
        const _HomeIndicator(),
      ],
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: ColorPalette.inverseSecondary,
          ),
        ),
        const SizedBox(height: 8),
        CustomPasswordFormField(
          controller: controller,
          hintText: hint,
          fillColor: const Color(0x1FFFFFFF),
          useBorder: true,
          colorBorder: const Color(0x29E8E8E8),
          focusedBorderColor: ColorPalette.primaryColor,
          borderRadius: 12,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          obscureColor: ColorPalette.inverseSecondary,
          visiblePasswordIcon: Icons.visibility_outlined,
          invisiblePasswordIcon: Icons.visibility_off_outlined,
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
            padding: const EdgeInsets.only(left: 16, right: 10),
            child: SvgPicture.asset(
              AppIcons.iconLock,
              width: 18,
              height: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordRules() {
    final value = _newPasswordController.text;
    final rules = <({String label, bool valid})>[
      (label: 'Minimal 8 karakter', valid: value.length >= 8),
      (
        label: 'Huruf besar dan kecil',
        valid: _hasUppercase(value) && _hasLowercase(value),
      ),
      (label: 'Angka atau simbol', valid: _hasNumberOrSymbol(value)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password harus mengandung:',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: ColorPalette.kWhite,
          ),
        ),
        const SizedBox(height: 8),
        for (final rule in rules)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                SvgPicture.asset(
                  rule.valid
                      ? AppIcons.passwordRuleFilled
                      : AppIcons.passwordRuleEmpty,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  rule.label,
                  style: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ColorPalette.kWhite,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildPinSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle(),
        const SizedBox(height: 64),
        _buildPinDots(),
        const SizedBox(height: 64),
        _buildKeypad(),
        if (widget.variant == PinBottomSheetVariant.currentPin) ...[
          const SizedBox(height: 24),
          _buildPinActions(),
        ],
        const _HomeIndicator(),
      ],
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        _title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: ColorPalette.kWhite,
        ),
      ),
    );
  }

  Widget _buildPinDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : 28),
          child: SvgPicture.asset(
            index < _pinController.text.length
                ? AppIcons.pinDotFilled
                : AppIcons.pinDotEmpty,
            width: 12,
            height: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    const rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          for (final row in rows) ...[
            _buildKeyRow(row),
            const SizedBox(height: 24),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 48, height: 48),
              _PinKey(number: '0', onTap: () => _onDigit('0')),
              _PinKey(icon: AppIcons.pinDelete, onTap: _onBackspace),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeyRow(List<String> row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final number in row)
          _PinKey(number: number, onTap: () => _onDigit(number)),
      ],
    );
  }

  Widget _buildPinActions() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.onUsePassword,
            child: const Text(
              'Gunakan Kata Sandi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF00C6BF),
              ),
            ),
          ),
        ),
        const Text(
          '|',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xFFAFAFAF),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: widget.onForgotPin,
            child: const Text(
              'Lupa Pin?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF00C6BF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PinKey extends StatelessWidget {
  const _PinKey({required this.onTap, this.number, this.icon});

  final String? number;
  final String? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Center(
            child: icon == null
                ? Text(
                    number!,
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: ColorPalette.kWhite,
                    ),
                  )
                : SvgPicture.asset(icon!, width: 32, height: 32),
          ),
        ),
      ),
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
