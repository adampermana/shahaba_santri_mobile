import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

enum OtpBottomSheetVariant { verifyEmail, forgotPassword }

class OtpBottomSheet extends StatefulWidget {
  const OtpBottomSheet({
    required this.email,
    required this.variant,
    super.key,
    this.onVerified,
    this.onResend,
    this.cooldownSeconds = 60,
    this.length = 6,
  });

  final String email;
  final OtpBottomSheetVariant variant;
  final ValueChanged<String>? onVerified;
  final VoidCallback? onResend;
  final int cooldownSeconds;
  final int length;

  static Future<void> show(
    BuildContext context, {
    required String email,
    required OtpBottomSheetVariant variant,
    ValueChanged<String>? onVerified,
    VoidCallback? onResend,
    int cooldownSeconds = 60,
    int length = 6,
  }) {
    final authBloc = context.read<AuthBloc>();
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => BlocProvider.value(
        value: authBloc,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: OtpBottomSheet(
              email: email,
              variant: variant,
              onVerified: onVerified,
              onResend: onResend,
              cooldownSeconds: cooldownSeconds,
              length: length,
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  final _pinController = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _hasError = false;
  String? _errorMessage;

  bool get _isComplete => _pinController.text.trim().length >= widget.length;

  String get _title => switch (widget.variant) {
    OtpBottomSheetVariant.verifyEmail => 'Verifikasi Email Anda',
    OtpBottomSheetVariant.forgotPassword => 'Cek Email Anda',
  };

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

  void _onKonfirmasi(BuildContext context) {
    if (!_isComplete) return;

    if (widget.onVerified != null) {
      widget.onVerified?.call(_pinController.text.trim());
      return;
    }

    if (widget.variant == OtpBottomSheetVariant.verifyEmail) {
      context.read<AuthBloc>().add(
        AuthEvent.postVerifyEmail(
          email: widget.email,
          code: _pinController.text.trim(),
        ),
      );
    }
  }

  void _onResend(BuildContext context) {
    if (_remainingSeconds > 0) return;

    if (widget.onResend != null) {
      widget.onResend?.call();
      _startTimer(widget.cooldownSeconds);
      return;
    }

    if (widget.variant == OtpBottomSheetVariant.verifyEmail) {
      context.read<AuthBloc>().add(
        AuthEvent.postResendEmailOtp(email: widget.email),
      );
    }
  }

  void _triggerError(String message) {
    unawaited(HapticFeedback.mediumImpact());
    setState(() {
      _hasError = true;
      _errorMessage = message;
    });
    // Clear input setelah shake selesai (400ms)
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      _pinController.clear();
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
    });
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        final becameSuccessVerify =
            !previous.successVerifyEmail && current.successVerifyEmail;
        final becameSuccessResend =
            !previous.successResendOtp && current.successResendOtp;
        final becameVerifyError =
            !current.loadingVerifyEmail &&
            !current.successVerifyEmail &&
            current.messageVerifyOtp != null &&
            current.messageVerifyOtp!.isNotEmpty &&
            (previous.loadingVerifyEmail ||
                previous.messageVerifyOtp != current.messageVerifyOtp);

        return becameSuccessVerify || becameSuccessResend || becameVerifyError;
      },
      listener: (context, state) {
        if (state.successVerifyEmail) {
          context
            ..pop()
            ..go(RouterPath.greetingPath);
        } else if (state.successResendOtp) {
          _startTimer(state.cooldownOtp);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              CustomSnackBar.authSuccess(
                message: 'Kode verifikasi telah dikirim ulang',
              ),
            );
        } else if (!state.loadingVerifyEmail &&
            state.messageVerifyOtp != null &&
            state.messageVerifyOtp!.isNotEmpty) {
          _triggerError(state.messageVerifyOtp!);
        }
      },
      builder: (context, state) {
        final isLoading = state.loadingVerifyEmail || state.loadingResendOtp;

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
              SizedBox(
                width: 120,
                height: 120,
                child: SvgPicture.asset(AppIcons.verifEmailIcon),
              ),

              const SizedBox(height: 32),

              Text(
                _title,
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: ColorPalette.kWhite,
                ),
              ),

              const SizedBox(height: 8),

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

              _AnimatedOtpInput(
                controller: _pinController,
                length: widget.length,
                hasError: _hasError,
                onCompleted: (_) => _onKonfirmasi(context),
              ),

              // Error message inline
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: _hasError && _errorMessage != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline_rounded,
                              color: ColorPalette.kRed300,
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _errorMessage!,
                              style: const TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: ColorPalette.kRed300,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              const SizedBox(height: 48),

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
                  onTap: () => _onResend(context),
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

              SubmitButtonStylesWidget(
                style: SubmitButtonStyle.elevated,
                primaryColor: _isComplete
                    ? ColorPalette.primaryColor
                    : ColorPalette.contentDisabled,
                textButton: 'Konfirmasi',
                height: 48,
                radius: 9999,
                isLoading: isLoading,
                isActive: _isComplete && !isLoading,
                textStyle: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: ColorPalette.kWhite,
                ),
                onPressed: () => _onKonfirmasi(context),
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }
}

class _AnimatedOtpInput extends StatefulWidget {
  const _AnimatedOtpInput({
    required this.controller,
    required this.length,
    required this.onCompleted,
    this.hasError = false,
  });

  final TextEditingController controller;
  final int length;
  final ValueChanged<String> onCompleted;
  final bool hasError;

  @override
  State<_AnimatedOtpInput> createState() => _AnimatedOtpInputState();
}

class _AnimatedOtpInputState extends State<_AnimatedOtpInput>
    with SingleTickerProviderStateMixin {
  late final FocusNode _focusNode;
  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;
  var _previousValue = '';
  int? _changedIndex;
  var _changeVersion = 0;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocusChanged);
    _previousValue = widget.controller.text;
    widget.controller.addListener(_onTextChanged);

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation =
        TweenSequence<double>([
          TweenSequenceItem(tween: Tween(begin: 0, end: -12), weight: 1),
          TweenSequenceItem(tween: Tween(begin: -12, end: 12), weight: 2),
          TweenSequenceItem(tween: Tween(begin: 12, end: -8), weight: 2),
          TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 2),
          TweenSequenceItem(tween: Tween(begin: 8, end: -4), weight: 2),
          TweenSequenceItem(tween: Tween(begin: -4, end: 0), weight: 1),
        ]).animate(
          CurvedAnimation(
            parent: _shakeController,
            curve: Curves.easeInOut,
          ),
        );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void didUpdateWidget(covariant _AnimatedOtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.hasError && widget.hasError) {
      unawaited(_shakeController.forward(from: 0));
    }
  }

  @override
  void dispose() {
    _shakeController.dispose();
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

  // Fix: kalau node sudah hasFocus tapi keyboard dismiss,
  // requestFocus() no-ops — paksa keyboard muncul via platform channel.
  Future<void> _onTap() async {
    if (_focusNode.hasFocus) {
      await SystemChannels.textInput.invokeMethod<void>('TextInput.show');
    } else {
      _focusNode.requestFocus();
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
        isError: widget.hasError,
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
        onTap: _onTap,
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
            AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (context, child) => Transform.translate(
                offset: Offset(_shakeAnimation.value, 0),
                child: child,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var index = 0; index < cells.length; index++) ...[
                    if (index > 0) SizedBox(width: widget.length > 4 ? 8 : 24),
                    _FlipOtpCell(
                      key: ValueKey('otp-cell-$index'),
                      cell: cells[index],
                      width: widget.length > 4 ? 44 : 48,
                    ),
                  ],
                ],
              ),
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
    this.isError = false,
  });

  final String? character;
  final bool isFilled;
  final bool isFocused;
  final bool wasJustEntered;
  final bool wasJustRemoved;
  final bool isError;
}

class _FlipOtpCell extends StatefulWidget {
  const _FlipOtpCell({required this.cell, super.key, this.width = 48});

  final _OtpCellData cell;
  final double width;

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
    final borderColor = widget.cell.isError
        ? ColorPalette.kRed300
        : widget.cell.isFocused
        ? ColorPalette.primaryColor
        : const Color(0x29E8E8E8);

    // Glyph '*' di Satoshi posisinya tinggi, perlu digeser turun supaya center.
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
        width: widget.width,
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
