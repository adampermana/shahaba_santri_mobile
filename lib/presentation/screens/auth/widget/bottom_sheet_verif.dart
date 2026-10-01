import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

// Bottom Sheet Verifikasi Email
class BottomSheetVerifEmail extends StatefulWidget {
  const BottomSheetVerifEmail({
    required this.email,
    super.key,
    this.onVerified,
    this.onResend,
    this.cooldownSeconds = 59,
  });

  final String email;
  final ValueChanged<String>? onVerified;
  final VoidCallback? onResend;
  final int cooldownSeconds;

  static Future<void> show(
    BuildContext context, {
    required String email,
    ValueChanged<String>? onVerified,
    VoidCallback? onResend,
    int cooldownSeconds = 59,
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
          child: BottomSheetVerifEmail(
            email: email,
            onVerified: onVerified,
            onResend: onResend,
            cooldownSeconds: cooldownSeconds,
          ),
        ),
      ),
    );
  }

  @override
  State<BottomSheetVerifEmail> createState() => _BottomSheetVerifEmailState();
}

class _BottomSheetVerifEmailState extends State<BottomSheetVerifEmail> {
  final _pinController = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isLoading = false;

  bool get _isComplete => _pinController.text.trim().length >= 4;

  String get _maskedEmail {
    final email = widget.email;
    final atIndex = email.indexOf('@');
    if (atIndex <= 3) return email;
    final prefix = email.substring(0, 3);
    final domain = email.substring(atIndex);
    return '$prefix****$domain';
  }

  @override
  void initState() {
    super.initState();
    _pinController.addListener(_rebuild);
    _startTimer(widget.cooldownSeconds);
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  void _startTimer(int seconds) {
    _timer?.cancel();
    if (seconds <= 0) {
      setState(() => _remainingSeconds = 0);
      return;
    }
    setState(() => _remainingSeconds = seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() => _remainingSeconds = 0);
        return;
      }
      setState(() => _remainingSeconds--);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController
      ..removeListener(_rebuild)
      ..dispose();
    super.dispose();
  }

  void _onKonfirmasi() {
    if (!_isComplete || _isLoading) return;
    setState(() => _isLoading = true);
    widget.onVerified?.call(_pinController.text.trim());
  }

  void _onResend() {
    if (_remainingSeconds > 0) return;
    widget.onResend?.call();
    _startTimer(widget.cooldownSeconds);
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorPalette.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          SizedBox(
            width: 120,
            height: 120,
            child: SvgPicture.asset(AppIcons.verifEmailIcon),
          ),

          const SizedBox(height: 32),

          // Title
          const Text(
            'Verifikasi Email Anda',
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: ColorPalette.kWhite,
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          SizedBox(
            width: 271,
            child: Text(
              'Masukkan kode verifikasi yang baru saja kami kirimkan ke '
              '$_maskedEmail',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: ColorPalette.kWhite,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Pin Code Fields
          _AnimatedOtpInput(
            controller: _pinController,
            length: 4,
            onCompleted: (_) => _onKonfirmasi(),
          ),

          const SizedBox(height: 64),

          // Resend timer
          Text(
            _remainingSeconds > 0
                ? 'Kirim ulang kode dalam ${_formatTime(_remainingSeconds)}'
                : '',
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: _remainingSeconds > 0
                  ? const Color(0xFFAFAFAF)
                  : ColorPalette.kTeal,
            ),
          ),

          if (_remainingSeconds == 0) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _onResend,
              child: const Text(
                'Kirim ulang',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: ColorPalette.kTeal,
                ),
              ),
            ),
          ],

          const SizedBox(height: 32),

          // Konfirmasi button
          SubmitButtonStylesWidget(
            style: SubmitButtonStyle.elevated,
            primaryColor: _isComplete
                ? ColorPalette.primaryColor
                : ColorPalette.contentDisabled,
            textButton: 'Konfirmasi',
            height: 48,
            radius: 9999,
            isLoading: _isLoading,
            isActive: _isComplete,
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
    );
  }
}

class _AnimatedOtpInput extends StatefulWidget {
  const _AnimatedOtpInput({
    required this.controller,
    required this.length,
    required this.onCompleted,
  });

  final TextEditingController controller;
  final int length;
  final ValueChanged<String> onCompleted;

  @override
  State<_AnimatedOtpInput> createState() => _AnimatedOtpInputState();
}

class _AnimatedOtpInputState extends State<_AnimatedOtpInput> {
  late final FocusNode _focusNode;
  var _previousValue = '';
  int? _changedIndex;
  var _changeVersion = 0;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocusChanged);
    _previousValue = widget.controller.text;
    widget.controller.addListener(_onTextChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (mounted) setState(() {});
  }

  void _onTextChanged() {
    final value = widget.controller.text;
    if (value == _previousValue) return;

    final oldValue = _previousValue;
    _previousValue = value;
    _changedIndex = value.length < oldValue.length
        ? value.length
        : value.length - 1;
    final version = ++_changeVersion;

    if (mounted) setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || version != _changeVersion) return;
      setState(() => _changedIndex = null);
    });
  }

  void _onChanged(String value) {
    if (value.length == widget.length) {
      widget.onCompleted(value);
    }
  }

  List<_OtpCellData> _cells() {
    final value = widget.controller.text;
    return List.generate(widget.length, (index) {
      final isFilled = index < value.length;
      return _OtpCellData(
        character: isFilled ? value[index] : null,
        isFilled: isFilled,
        isFocused: _focusNode.hasFocus && index == value.length,
        wasJustEntered: _changedIndex == index && isFilled,
        wasJustRemoved: _changedIndex == index && !isFilled,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final cells = _cells();
    return Semantics(
      textField: true,
      label: 'Kode verifikasi ${widget.length} digit',
      child: GestureDetector(
        onTap: _focusNode.requestFocus,
        child: Column(
          children: [
            SizedBox(
              height: 1,
              width: 1,
              child: TextField(
                controller: widget.controller,
                focusNode: _focusNode,
                autofocus: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(widget.length),
                ],
                onChanged: _onChanged,
                style: const TextStyle(
                  color: Colors.transparent,
                  fontSize: 1,
                ),
                cursorColor: Colors.transparent,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var index = 0; index < cells.length; index++) ...[
                  if (index > 0) const SizedBox(width: 24),
                  _FlipOtpCell(
                    key: ValueKey('otp-cell-$index'),
                    cell: cells[index],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OtpCellData {
  const _OtpCellData({
    required this.character,
    required this.isFilled,
    required this.isFocused,
    required this.wasJustEntered,
    required this.wasJustRemoved,
  });

  final String? character;
  final bool isFilled;
  final bool isFocused;
  final bool wasJustEntered;
  final bool wasJustRemoved;
}

class _FlipOtpCell extends StatefulWidget {
  const _FlipOtpCell({required this.cell, super.key});

  final _OtpCellData cell;

  @override
  State<_FlipOtpCell> createState() => _FlipOtpCellState();
}

class _FlipOtpCellState extends State<_FlipOtpCell>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  var _animationSequence = 0;
  late String _displaySymbol;

  @override
  void initState() {
    super.initState();
    _displaySymbol = _symbolForCell(widget.cell);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1,
    );
  }

  @override
  void didUpdateWidget(covariant _FlipOtpCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cell.wasJustEntered || widget.cell.wasJustRemoved) {
      unawaited(_animateSymbolTransition(_symbolForCell(widget.cell)));
      return;
    }

    if (widget.cell.character != oldWidget.cell.character) {
      _displaySymbol = _symbolForCell(widget.cell);
      _animationController.value = 1;
    }
  }

  String _symbolForCell(_OtpCellData cell) => cell.isFilled ? '*' : '-';

  Future<void> _animateSymbolTransition(String nextSymbol) async {
    final sequence = ++_animationSequence;
    _animationController.value = 0;

    try {
      await _animationController
          .animateTo(
            0.5,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInCubic,
          )
          .orCancel;
      if (!mounted || sequence != _animationSequence) return;

      setState(() => _displaySymbol = nextSymbol);

      await _animationController
          .animateTo(
            1,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOutCubic,
          )
          .orCancel;
    } on TickerCanceled {
      // Input transition replaced by newer input.
    }
  }

  @override
  void dispose() {
    _animationSequence++;
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.cell.isFocused
        ? ColorPalette.primaryColor
        : const Color(0x29E8E8E8);

    // Glyph '*' di Satoshi posisinya tinggi, jadi perlu digeser turun
    // supaya terlihat center secara optis.
    final isMask = _displaySymbol == '*';

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final progress = _animationController.value;
        final angle = progress <= 0.5
            ? progress * math.pi
            : (progress - 1) * math.pi;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          child: child,
        );
      },
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0x14FFFFFF),
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Transform.translate(
          offset: Offset(0, isMask ? 6 : 0),
          child: Text(
            _displaySymbol,
            textAlign: TextAlign.center,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
            strutStyle: const StrutStyle(
              fontFamily: 'Satoshi',
              fontSize: 24,
              height: 1,
              forceStrutHeight: true,
            ),
            style: const TextStyle(
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w400,
              fontSize: 24,
              height: 1,
              color: ColorPalette.kWhite,
            ),
          ),
        ),
      ),
    );
  }
}

