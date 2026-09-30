import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:sahaba_mobile/infrastructure/extension/string_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.controller,
    this.initialValue,
    this.textStyle,
    this.requiredMarking = false,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.colorLabelText,
    this.fillColor,
    this.prefixIcon,
    this.onsubmit,
    this.suffixIcon,
    this.manualError = false,
    this.clearText = false,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.validator,
    this.error,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.colorBorder,
    this.focusedBorderColor,
    this.useBorder = false,
    this.showShadow = false,
    this.borderRadius,
    this.contentPadding,
    this.suffixIconConstraints,
    this.focusNode,
    this.minLines,
    this.maxLines = 1,
    this.autovalidateMode,
  }) : assert(
         error == null || errorText == null,
         'Only one of error and errorText can be specified.',
       );

  final TextEditingController? controller;
  final String? initialValue;
  final TextStyle? textStyle;
  final bool requiredMarking;
  final bool obscureText;
  final bool readOnly;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final Color? colorLabelText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool manualError;
  final bool clearText;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onsubmit;
  final FormFieldValidator<String>? validator;
  final Widget? error;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final Color? colorBorder;
  final Color? focusedBorderColor;
  final bool useBorder;
  final bool showShadow;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? suffixIconConstraints;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;

  // Warna fill default
  static const Color _kFillColor = ColorPalette.kGray;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // suffix builder
    Widget? buildSuffix({required bool showClear}) {
      final widgets = <Widget>[];

      if (suffixIcon != null) widgets.add(suffixIcon!);

      if (clearText && showClear && !readOnly && controller != null) {
        widgets.add(
          GestureDetector(
            onTap: () {
              controller!.clear();
              onChanged?.call('');
            },
            child: const Icon(Icons.clear, size: 18),
          ),
        );
      }

      if (widgets.isEmpty) return null;
      if (widgets.length == 1) return widgets.first;
      return Row(mainAxisSize: MainAxisSize.min, children: widgets);
    }

    // border helpers
    final effectiveBorderRadius = BorderRadius.circular(borderRadius ?? 8);
    final effectiveContentPadding =
        contentPadding ??
        const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        );
    final effectiveMinLines = obscureText ? null : minLines;
    final effectiveMaxLines = obscureText ? 1 : maxLines;

    OutlineInputBorder border(Color color, [double width = 1.5]) =>
        OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: color, width: width),
        );

    final noBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
    );

    final InputBorder enabledBorder = manualError
        ? border(const Color(0xFFDE1135))
        : (useBorder
              ? border(colorBorder ?? const Color(0xFF231F20))
              : readOnly
              ? border(const Color(0xFFCCCCCC))
              : noBorder);

    final InputBorder focusedBorder = manualError
        ? border(const Color(0xFFDE1135))
        : border(
            focusedBorderColor ?? colorBorder ?? theme.colorScheme.primary,
          );

    final InputBorder errorBorder = border(const Color(0xFFDE1135));
    final InputBorder focusedErrorBorder = border(
      const Color(0xFFDE1135),
    );

    final InputBorder disabledBorder = useBorder
        ? border(theme.disabledColor.withValues(alpha: 0.2))
        : noBorder;

    // shadow decoration helper
    const shadowDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 6,
          offset: Offset(0, 4),
          spreadRadius: -1,
        ),
        BoxShadow(
          color: Color(0x0F000000),
          blurRadius: 4,
          offset: Offset(0, 2),
          spreadRadius: -1,
        ),
      ],
    );

    // core FormField + TextField
    Widget textField({required Widget? suffix}) {
      return FormField<String>(
        autovalidateMode: autovalidateMode,
        initialValue: controller?.text ?? initialValue ?? '',
        validator: validator != null
            ? (value) => validator!(controller?.text ?? value)
            : null,
        builder: (state) {
          final validationErrorText = state.errorText;
          final hasError =
              validationErrorText != null ||
              error != null ||
              errorText != null ||
              manualError;
          final inputBorder = hasError ? errorBorder : enabledBorder;
          final inputFocusedBorder = hasError
              ? focusedErrorBorder
              : focusedBorder;

          final effectiveErrorStyle =
              errorStyle ??
              const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0xFFDE1135),
              );

          final errorWidget =
              error ??
              ((validationErrorText != null &&
                          validationErrorText.isNotEmpty) ||
                      (errorText != null && errorText!.isNotEmpty)
                  ? Text(
                      validationErrorText ?? errorText!,
                      style: effectiveErrorStyle,
                      maxLines: errorMaxLines,
                      overflow: errorMaxLines == null
                          ? null
                          : TextOverflow.ellipsis,
                    )
                  : null);

          Widget inputField = TextField(
            key: key,
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText,
            readOnly: readOnly,
            onSubmitted: onsubmit,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textCapitalization: textCapitalization,
            minLines: effectiveMinLines,
            maxLines: effectiveMaxLines,
            inputFormatters: inputFormatters,
            style: textStyle ?? DefaultTextStyle.of(context).style,
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? (readOnly ? _kFillColor : _kFillColor),
              hintText: hintText,
              hintStyle:
                  hintStyle ??
                  TextStyle(color: theme.disabledColor, fontSize: 14),
              prefixIcon: prefixIcon,
              suffixIcon: suffix,
              contentPadding: effectiveContentPadding,
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputFocusedBorder,
              disabledBorder: disabledBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder,
              suffixIconConstraints: suffixIconConstraints,
            ),
            onTap: onTap,
            onChanged: (value) {
              state.didChange(value);
              onChanged?.call(value);
            },
          );

          if (showShadow) {
            inputField = DecoratedBox(
              decoration: hasError ? const BoxDecoration() : shadowDecoration,
              child: inputField,
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputField,
              if (errorWidget != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: DefaultTextStyle.merge(
                    style: effectiveErrorStyle,
                    maxLines: errorMaxLines,
                    overflow: errorMaxLines == null
                        ? TextOverflow.clip
                        : TextOverflow.ellipsis,
                    child: errorWidget,
                  ),
                ),
            ],
          );
        },
      );
    }

    // label + field
    Widget labeledField(Widget field) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Text.rich(
              TextSpan(
                text: labelText,
                style: TextStyle(
                  color: colorLabelText ?? ColorPalette.kBlack,
                  fontWeight: FontWeight.w500,
                ),
                children: !requiredMarking
                    ? null
                    : [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: colorLabelText ?? ColorPalette.kBlack,
                          ),
                        ),
                      ],
              ),
            ),
            const SizedBox(height: 8),
          ],
          field,
        ],
      );
    }

    // build dengan ValueListenableBuilder bila ada controller
    if (controller != null) {
      return ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller!,
        builder: (context, value, _) {
          final hasText = value.text.isNotEmpty;
          return labeledField(
            textField(suffix: buildSuffix(showClear: hasText)),
          );
        },
      );
    }

    return labeledField(textField(suffix: buildSuffix(showClear: false)));
  }
}

class CustomPasswordFormFieldWidget extends StatefulWidget {
  const CustomPasswordFormFieldWidget({
    super.key,
    this.controller,
    this.requiredMarking = false,
    this.readOnly = false,
    this.clearText = false,
    this.textInputAction,
    this.hintText,
    this.hintStyle,
    this.initialValue,
    this.textStyle,
    this.labelText,
    this.colorLabelText,
    this.obscureColor,
    this.fillColor,
    this.prefixIcon,
    this.visiblePasswordIcon,
    this.invisiblePasswordIcon,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.validator,
    this.error,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.colorBorder,
    this.focusedBorderColor,
    this.useBorder = false,
    this.borderRadius,
    this.contentPadding,
    this.suffixIconConstraints,
    this.autovalidateMode,
  });

  final TextEditingController? controller;
  final bool requiredMarking;
  final bool readOnly;
  final bool clearText;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? initialValue;
  final TextStyle? textStyle;
  final String? labelText;
  final Color? colorLabelText;
  final Color? fillColor;
  final Color? obscureColor;
  final Widget? prefixIcon;
  final IconData? visiblePasswordIcon;
  final IconData? invisiblePasswordIcon;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? error;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final Color? colorBorder;
  final Color? focusedBorderColor;
  final bool useBorder;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? suffixIconConstraints;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CustomPasswordFormFieldWidget> createState() =>
      _CustomPasswordFormFieldWidgetState();
}

class _CustomPasswordFormFieldWidgetState
    extends State<CustomPasswordFormFieldWidget> {
  bool _isObscuring = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      key: context.widget.key,
      controller: widget.controller,
      requiredMarking: widget.requiredMarking,
      obscureText: _isObscuring,
      readOnly: widget.readOnly,
      clearText: widget.clearText,
      textStyle: widget.textStyle ?? DefaultTextStyle.of(context).style,
      initialValue: widget.initialValue,
      keyboardType: _isObscuring ? null : TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      colorLabelText: widget.colorLabelText,
      fillColor: widget.fillColor,
      labelText: widget.labelText,
      prefixIcon: widget.prefixIcon,
      useBorder: widget.useBorder,
      colorBorder: widget.colorBorder,
      focusedBorderColor: widget.focusedBorderColor,
      borderRadius: widget.borderRadius,
      contentPadding: widget.contentPadding,
      suffixIconConstraints: widget.suffixIconConstraints,
      autovalidateMode: widget.autovalidateMode,
      suffixIcon: GestureDetector(
        onTap: () => setState(() => _isObscuring = !_isObscuring),
        child: Icon(
          _isObscuring
              ? widget.invisiblePasswordIcon
              : widget.visiblePasswordIcon,
          size: 16,
          color: widget.obscureColor ?? Colors.black,
        ),
      ),
      inputFormatters: widget.inputFormatters,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      validator: widget.validator,
      error: widget.error,
      errorText: widget.errorText,
      errorStyle: widget.errorStyle,
      errorMaxLines: widget.errorMaxLines,
    );
  }
}

class CustomEmailFormField extends StatefulWidget {
  const CustomEmailFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.textStyle,
    this.requiredMarking = false,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.hintText = 'Masukkan alamat email',
    this.hintStyle,
    this.labelText,
    this.labelTextColor,
    this.prefixIcon,
    this.onsubmit,
    this.onTap,
    this.onChanged,
    this.validator,
    this.error,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.showSuggestions = true,
    this.fillColor,
    this.showShadow = false,
    this.colorBorder,
    this.focusedBorderColor,
    this.useBorder = false,
    this.borderRadius,
    this.contentPadding,
    this.autovalidateMode,
  }) : assert(
         error == null || errorText == null,
         'Only one of error and errorText can be specified.',
       );

  final TextEditingController? controller;
  final String? initialValue;
  final TextStyle? textStyle;
  final bool requiredMarking;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final Color? labelTextColor;
  final Widget? prefixIcon;
  final ValueChanged<String>? onsubmit;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? error;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final bool showSuggestions;
  final Color? fillColor;
  final bool showShadow;
  final Color? colorBorder;
  final Color? focusedBorderColor;
  final bool useBorder;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CustomEmailFormField> createState() => _CustomEmailFormFieldState();
}

class _CustomEmailFormFieldState extends State<CustomEmailFormField> {
  late TextEditingController _controller;
  bool showSuggestions = false;
  String _currentInput = '';
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final FocusNode _focusNode = FocusNode();

  static const List<String> _emailDomains = [
    '@gmail.com',
    '@hotmail.com',
    '@outlook.com',
    '@yahoo.com',
    '@icloud.com',
  ];

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
      _currentInput = widget.initialValue!;
    }

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        if (widget.showSuggestions &&
            !widget.readOnly &&
            _currentInput.isNotEmpty &&
            !_isCompleteDomain(_currentInput)) {
          _showSuggestionsList();
        }
      } else {
        _hideSuggestions();
      }
    });
  }

  @override
  void dispose() {
    _hideSuggestions(silent: true);
    _focusNode.dispose();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    _currentInput = value;

    final needOverlay =
        widget.showSuggestions &&
        !widget.readOnly &&
        value.isNotEmpty &&
        (!value.contains('@') || !_isCompleteDomain(value));

    if (needOverlay) {
      if (_overlayEntry == null) {
        _showSuggestionsList();
      } else {
        _overlayEntry!.markNeedsBuild();
      }
    } else {
      _hideSuggestions();
    }

    if (mounted) setState(() {});
    widget.onChanged?.call(value);
  }

  bool _isCompleteDomain(String email) {
    final atIndex = email.indexOf('@');
    if (atIndex == -1) return false;
    final domain = email.substring(atIndex);
    return _emailDomains.contains(domain);
  }

  void _showSuggestionsList() {
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
      return;
    }
    if (!_focusNode.hasFocus || _getFilteredSuggestions().isEmpty) return;

    final box = context.findRenderObject() as RenderBox?;
    final width = box?.size.width ?? MediaQuery.of(context).size.width - 32;

    _overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        width: width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: Material(
            color: Theme.of(context).cardColor,
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: _getFilteredSuggestions()
                    .map(
                      (s) => ListTile(
                        dense: true,
                        title: Text(
                          s,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        onTap: () => _selectSuggestion(s),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  List<String> _getFilteredSuggestions() {
    if (_currentInput.isEmpty) return [];

    if (!_currentInput.contains('@')) {
      return _emailDomains.map((domain) => _currentInput + domain).toList();
    } else {
      final atIndex = _currentInput.indexOf('@');
      final username = _currentInput.substring(0, atIndex);
      final partialDomain = _currentInput.substring(atIndex);

      return _emailDomains
          .where((domain) => domain.startsWith(partialDomain))
          .map((domain) => username + domain)
          .toList();
    }
  }

  void _selectSuggestion(String suggestion) {
    _controller.text = suggestion;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: suggestion.length),
    );
    setState(() {
      _currentInput = suggestion;
    });
    _hideSuggestions();
    widget.onChanged?.call(suggestion);
  }

  void _hideSuggestions({bool silent = false}) {
    _overlayEntry?.remove();
    _overlayEntry = null;
    showSuggestions = false;
    if (!silent && mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final effectiveBorderRadius = BorderRadius.circular(
      widget.borderRadius ?? 8,
    );
    final effectiveContentPadding =
        widget.contentPadding ??
        const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        );

    OutlineInputBorder b(Color c, [double w = 1.5]) => OutlineInputBorder(
      borderSide: BorderSide(color: c, width: w),
      borderRadius: effectiveBorderRadius,
    );

    final effectiveBorderColor = widget.colorBorder ?? const Color(0xFFE5E7EB);

    final noBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: widget.useBorder
          ? BorderSide(color: effectiveBorderColor)
          : const BorderSide(color: Colors.transparent, width: 0),
    );

    const shadowDeco = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 6,
          offset: Offset(0, 4),
          spreadRadius: -1,
        ),
        BoxShadow(
          color: Color(0x0F000000),
          blurRadius: 4,
          offset: Offset(0, 2),
          spreadRadius: -1,
        ),
      ],
    );

    final suffix = _currentInput.isNotEmpty && !widget.readOnly
        ? GestureDetector(
            onTap: () {
              _controller.clear();
              setState(() => _currentInput = '');
              _hideSuggestions();
              widget.onChanged?.call('');
            },
            child: const Icon(Icons.clear, size: 18),
          )
        : null;

    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) ...[
            Text.rich(
              TextSpan(
                text: widget.labelText,
                style: TextStyle(
                  color: widget.labelTextColor ?? ColorPalette.kBlack,
                  fontWeight: FontWeight.w500,
                ),
                children: !widget.requiredMarking
                    ? null
                    : [
                        const TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
              ),
            ),
            const SizedBox(height: 8),
          ],
          FormField<String>(
            autovalidateMode: widget.autovalidateMode,
            initialValue: _controller.text,
            validator: widget.validator ?? _defaultEmailValidator,
            builder: (state) {
              final validationErrorText = state.errorText;
              final hasError =
                  validationErrorText != null ||
                  widget.error != null ||
                  widget.errorText != null;

              final inputBorder = hasError
                  ? b(const Color(0xFFDE1135))
                  : (widget.readOnly ? b(const Color(0xFFCCCCCC)) : noBorder);

              final inputFocusedBorder = hasError
                  ? b(const Color(0xFFDE1135))
                  : b(
                      widget.focusedBorderColor ?? theme.colorScheme.primary,
                    );

              final effectiveErrorStyle =
                  widget.errorStyle ??
                  const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Color(0xFFDE1135),
                  );

              final errorWidget =
                  widget.error ??
                  ((validationErrorText != null &&
                              validationErrorText.isNotEmpty) ||
                          (widget.errorText != null &&
                              widget.errorText!.isNotEmpty)
                      ? Text(
                          validationErrorText ?? widget.errorText!,
                          style: effectiveErrorStyle,
                          maxLines: widget.errorMaxLines,
                          overflow: widget.errorMaxLines == null
                              ? null
                              : TextOverflow.ellipsis,
                        )
                      : null);

              Widget inputField = TextField(
                key: widget.key,
                controller: _controller,
                focusNode: _focusNode,
                readOnly: widget.readOnly,
                keyboardType: TextInputType.emailAddress,
                textInputAction: widget.textInputAction,
                style: widget.textStyle ?? DefaultTextStyle.of(context).style,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.fillColor ?? const Color(0xFFE8E8E8),
                  hintText: widget.hintText,
                  hintStyle:
                      widget.hintStyle ??
                      TextStyle(
                        color: theme.disabledColor,
                        fontSize: 14,
                      ),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: suffix,
                  contentPadding: effectiveContentPadding,
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputFocusedBorder,
                  disabledBorder: noBorder,
                  errorBorder: b(const Color(0xFFDE1135)),
                  focusedErrorBorder: b(const Color(0xFFDE1135)),
                ),
                onTap: widget.onTap,
                onChanged: (value) {
                  state.didChange(value);
                  _onTextChanged(value);
                },
                onSubmitted: widget.onsubmit,
              );

              if (widget.showShadow) {
                inputField = DecoratedBox(
                  decoration: hasError ? const BoxDecoration() : shadowDeco,
                  child: inputField,
                );
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputField,
                  if (errorWidget != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: DefaultTextStyle.merge(
                        style: effectiveErrorStyle,
                        maxLines: widget.errorMaxLines,
                        overflow: widget.errorMaxLines == null
                            ? TextOverflow.clip
                            : TextOverflow.ellipsis,
                        child: errorWidget,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  static String? _defaultEmailValidator(String? value) {
    final cleanValue = value?.trim() ?? '';
    if (cleanValue.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!cleanValue.isEmail) {
      return 'Emailya kurang pas nih. Coba dicek lagi, ya.';
    }
    return null;
  }
}

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    this.controller,
    this.requiredMarking = false,
    this.readOnly = false,
    this.clearText = false,
    this.textInputAction,
    this.hintText,
    this.hintStyle,
    this.initialValue,
    this.textStyle,
    this.labelText,
    this.colorLabelText,
    this.fillColor,
    this.prefixIcon,
    this.visiblePasswordIcon,
    this.invisiblePasswordIcon,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.validator,
    this.error,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.showShadow = false,
    this.colorBorder,
    this.useBorder = false,
    this.borderRadius,
    this.focusedBorderColor,
    this.autovalidateMode,
  });

  final TextEditingController? controller;
  final bool requiredMarking;
  final bool readOnly;
  final bool clearText;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? initialValue;
  final TextStyle? textStyle;
  final String? labelText;
  final Color? colorLabelText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final IconData? visiblePasswordIcon;
  final IconData? invisiblePasswordIcon;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? error;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final bool showShadow;
  final Color? colorBorder;
  final bool useBorder;
  final double? borderRadius;
  final Color? focusedBorderColor;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool _isObscuring = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      key: context.widget.key,
      controller: widget.controller,
      requiredMarking: widget.requiredMarking,
      obscureText: _isObscuring,
      readOnly: widget.readOnly,
      clearText: widget.clearText,
      textStyle: widget.textStyle ?? DefaultTextStyle.of(context).style,
      initialValue: widget.initialValue,
      keyboardType: _isObscuring ? null : TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      labelText: widget.labelText,
      colorLabelText: widget.colorLabelText,
      fillColor: widget.fillColor,
      prefixIcon: widget.prefixIcon,
      suffixIcon: GestureDetector(
        onTap: () => setState(() => _isObscuring = !_isObscuring),
        child: Icon(
          _isObscuring
              ? widget.invisiblePasswordIcon
              : widget.visiblePasswordIcon,
          size: 16,
          color: widget.colorLabelText ?? Colors.white,
        ),
      ),
      inputFormatters: widget.inputFormatters,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      validator: widget.validator,
      error: widget.error,
      errorText: widget.errorText,
      errorStyle: widget.errorStyle,
      errorMaxLines: widget.errorMaxLines,
      showShadow: widget.showShadow,
      colorBorder: widget.colorBorder,
      useBorder: widget.useBorder,
      borderRadius: widget.borderRadius,
      focusedBorderColor: widget.focusedBorderColor,
      autovalidateMode: widget.autovalidateMode,
    );
  }
}

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.textStyle,
    this.requiredMarking = false,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.hintText = 'Masukkan nomor handphone',
    this.hintStyle,
    this.labelText,
    this.fillColor,
    this.prefixIcon,
    this.onsubmit,
    this.onTap,
    this.onChanged,
    this.validator,
    this.error,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.colorBorder,
    this.useBorder = false,
    this.autovalidateMode,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final TextStyle? textStyle;
  final bool requiredMarking;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final ValueChanged<String>? onsubmit;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? error;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final Color? colorBorder;
  final bool useBorder;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      key: context.widget.key,
      controller: controller,
      initialValue: initialValue,
      textStyle: textStyle ?? DefaultTextStyle.of(context).style,
      requiredMarking: requiredMarking,
      readOnly: readOnly,
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      hintText: hintText,
      hintStyle: hintStyle,
      labelText: labelText,
      fillColor: fillColor ?? ColorPalette.kWhite,
      prefixIcon: prefixIcon,
      onsubmit: onsubmit,
      colorBorder: colorBorder,
      useBorder: useBorder,
      autovalidateMode: autovalidateMode,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(17),
        _IndonesianPhoneNumberFormatter(),
      ],
      onTap: onTap,
      onChanged: onChanged,
      validator: validator ?? _defaultPhoneValidator,
      error: error,
      errorText: errorText,
      errorStyle: errorStyle,
      errorMaxLines: errorMaxLines,
    );
  }

  static String? _defaultPhoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    final cleanNumber = value.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanNumber.length < 3) {
      return 'Nomor telepon terlalu pendek, minimal 3 digit';
    }
    return null;
  }
}

class _IndonesianPhoneNumberFormatter extends TextInputFormatter {
  static const _validPrefixes = <String>{
    '81',
    '82',
    '83',
    '85',
    '87',
    '88',
    '89',
    '811',
    '812',
    '813',
    '814',
    '815',
    '816',
    '817',
    '818',
    '819',
    '821',
    '822',
    '823',
    '831',
    '838',
    '851',
    '852',
    '853',
    '855',
    '856',
    '857',
    '858',
    '859',
    '878',
    '895',
    '896',
    '897',
    '898',
    '899',
  };

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.length > 17) digits = digits.substring(0, 17);
    if (digits.isEmpty) return TextEditingValue.empty;

    if (digits.startsWith('62')) {
      digits = digits.substring(2);
    } else if (digits.startsWith('0')) {
      digits = digits.substring(1);
    }

    final prefix2 = digits.length >= 2 ? digits.substring(0, 2) : digits;
    final prefix3 = digits.length >= 3 ? digits.substring(0, 3) : '';
    if (!_validPrefixes.contains(prefix2) &&
        !_validPrefixes.contains(prefix3)) {
      return TextEditingValue(
        text: digits,
        selection: TextSelection.collapsed(offset: digits.length),
      );
    }

    final buffer = StringBuffer('(+62) ');
    for (var i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      if ((i + 1) % 4 == 0 && i != digits.length - 1) {
        buffer.write('-');
      }
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Widget TextFormField reusable dengan dukungan:
/// - Style default (border/fill biasa, opsional shadow)
/// - Style glassmorphism (`useGlass: true`) menggunakan `GlassContainer`
///
/// Contoh pemakaian glass (search bar):
/// ```dart
/// CustomTextFormFieldWidget(
///   controller: controller,
///   useGlass: true,
///   hintText: 'Cari ayat atau surah disini',
///   prefixIcon: SvgPicture.asset(AppIcons.searchLine, ...),
/// )
/// ```
class CustomTextFormFieldGlassWidget extends StatelessWidget {
  const CustomTextFormFieldGlassWidget({
    super.key,
    this.controller,
    this.initialValue,
    this.textStyle,
    this.requiredMarking = false,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.colorLabelText,
    this.fillColor,
    this.prefixIcon,
    this.onsubmit,
    this.suffixIcon,
    this.manualError = false,
    this.clearText = false,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.validator,
    this.error,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.colorBorder,
    this.focusedBorderColor,
    this.useBorder = false,
    this.showShadow = false,
    this.borderRadius,
    this.contentPadding,
    this.suffixIconConstraints,
    this.focusNode,
    this.minLines,
    this.maxLines = 1,
    this.autovalidateMode,
    // Glassmorphism
    this.useGlass = false,
    this.glassHeight,
    this.glassBlur = 18,
    this.glassColor,
    this.glassBorderColor,
    this.glassBorderWidth = 1,
    this.glassShadowColor,
    this.glassCursorColor,
    this.glassIconSpacing = 12,
    this.glassContentPaddingStart = 18,
    this.glassContentPaddingEnd = 18,
  }) : assert(
         error == null || errorText == null,
         'Only one of error and errorText can be specified.',
       );

  final TextEditingController? controller;
  final String? initialValue;
  final TextStyle? textStyle;
  final bool requiredMarking;
  final bool obscureText;
  final bool readOnly;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final Color? colorLabelText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool manualError;
  final bool clearText;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onsubmit;
  final FormFieldValidator<String>? validator;
  final Widget? error;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final Color? colorBorder;
  final Color? focusedBorderColor;
  final bool useBorder;
  final bool showShadow;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? suffixIconConstraints;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;

  // Glassmorphism config
  /// Aktifkan style glassmorphism (mis. search bar transparan di atas gambar/gradient).
  final bool useGlass;
  final double? glassHeight;
  final double glassBlur;
  final Color? glassColor;
  final Color? glassBorderColor;
  final double glassBorderWidth;
  final Color? glassShadowColor;
  final Color? glassCursorColor;
  final double glassIconSpacing;
  final double glassContentPaddingStart;
  final double glassContentPaddingEnd;

  // Warna fill default
  static const Color _kFillColor = ColorPalette.kGray;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // suffix builder (dipakai di kedua mode: default & glass)
    Widget? buildSuffix({required bool showClear, Color? iconColor}) {
      final widgets = <Widget>[];

      if (suffixIcon != null) widgets.add(suffixIcon!);

      if (clearText && showClear && !readOnly && controller != null) {
        widgets.add(
          GestureDetector(
            onTap: () {
              controller!.clear();
              onChanged?.call('');
            },
            child: Icon(Icons.clear, size: 18, color: iconColor),
          ),
        );
      }

      if (widgets.isEmpty) return null;
      if (widgets.length == 1) return widgets.first;
      return Row(mainAxisSize: MainAxisSize.min, children: widgets);
    }

    // MODE GLASSMORPHIC
    if (useGlass) {
      final effectiveGlassRadius = BorderRadius.circular(borderRadius ?? 28);
      final effectiveGlassHeight = glassHeight ?? 56;

      Widget glassField({required Widget? suffix}) {
        return FormField<String>(
          autovalidateMode: autovalidateMode,
          initialValue: controller?.text ?? initialValue ?? '',
          validator: validator != null
              ? (value) => validator!(controller?.text ?? value)
              : null,
          builder: (state) {
            final validationErrorText = state.errorText;
            final effectiveErrorStyle =
                errorStyle ??
                const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Color(0xFFDE1135),
                );
            final errorWidget =
                error ??
                ((validationErrorText != null &&
                            validationErrorText.isNotEmpty) ||
                        (errorText != null && errorText!.isNotEmpty)
                    ? Text(
                        validationErrorText ?? errorText!,
                        style: effectiveErrorStyle,
                        maxLines: errorMaxLines,
                        overflow: errorMaxLines == null
                            ? null
                            : TextOverflow.ellipsis,
                      )
                    : null);

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassContainer.clearGlass(
                  height: effectiveGlassHeight,
                  width: double.infinity,
                  blur: glassBlur,
                  borderRadius: effectiveGlassRadius,
                  borderColor:
                      glassBorderColor ?? Colors.white.withValues(alpha: 0.35),
                  borderWidth: glassBorderWidth,
                  color: glassColor ?? Colors.white.withValues(alpha: 0.08),
                  shadowColor:
                      glassShadowColor ?? Colors.black.withValues(alpha: 0.1),
                  child: Row(
                    children: [
                      SizedBox(width: glassContentPaddingStart),
                      if (prefixIcon != null) ...[
                        prefixIcon!,
                        SizedBox(width: glassIconSpacing),
                      ],
                      Expanded(
                        child: TextField(
                          focusNode: focusNode,
                          controller: controller,
                          obscureText: obscureText,
                          readOnly: readOnly,
                          onSubmitted: onsubmit,
                          keyboardType: keyboardType,
                          textInputAction: textInputAction,
                          textCapitalization: textCapitalization,
                          minLines: obscureText ? null : minLines,
                          maxLines: obscureText ? 1 : maxLines,
                          inputFormatters: inputFormatters,
                          cursorColor: glassCursorColor ?? Colors.white,
                          textAlignVertical: TextAlignVertical.center,
                          style:
                              textStyle ??
                              const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: hintText,
                            hintStyle:
                                hintStyle ??
                                const TextStyle(
                                  color: Color(0xFFA6A6A6),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                            suffixIcon: suffix,
                            suffixIconConstraints: suffixIconConstraints,
                          ),
                          onTap: onTap,
                          onChanged: (value) {
                            state.didChange(value);
                            onChanged?.call(value);
                          },
                        ),
                      ),
                      SizedBox(width: glassContentPaddingEnd),
                    ],
                  ),
                ),
                if (errorWidget != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: DefaultTextStyle.merge(
                      style: effectiveErrorStyle,
                      maxLines: errorMaxLines,
                      overflow: errorMaxLines == null
                          ? TextOverflow.clip
                          : TextOverflow.ellipsis,
                      child: errorWidget,
                    ),
                  ),
              ],
            );
          },
        );
      }

      Widget labeledGlass(Widget field) {
        if (labelText == null) return field;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: labelText,
                style: TextStyle(
                  color: colorLabelText ?? Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                children: !requiredMarking
                    ? null
                    : [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: colorLabelText ?? Colors.white,
                          ),
                        ),
                      ],
              ),
            ),
            const SizedBox(height: 8),
            field,
          ],
        );
      }

      if (controller != null) {
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller!,
          builder: (context, value, _) {
            final hasText = value.text.isNotEmpty;
            return labeledGlass(
              glassField(
                suffix: buildSuffix(
                  showClear: hasText,
                  iconColor: Colors.white70,
                ),
              ),
            );
          },
        );
      }

      return labeledGlass(glassField(suffix: buildSuffix(showClear: false)));
    }

    // MODE DEFAULT (border/fill biasa)
    final effectiveBorderRadius = BorderRadius.circular(borderRadius ?? 8);
    final effectiveContentPadding =
        contentPadding ??
        const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        );
    final effectiveMinLines = obscureText ? null : minLines;
    final effectiveMaxLines = obscureText ? 1 : maxLines;

    OutlineInputBorder border(Color color, [double width = 1.5]) =>
        OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: color, width: width),
        );

    final noBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
    );

    final InputBorder enabledBorder = manualError
        ? border(const Color(0xFFDE1135))
        : (useBorder
              ? border(colorBorder ?? const Color(0xFF231F20))
              : readOnly
              ? border(const Color(0xFFCCCCCC))
              : noBorder);

    final InputBorder focusedBorder = manualError
        ? border(const Color(0xFFDE1135))
        : border(
            focusedBorderColor ?? colorBorder ?? theme.colorScheme.primary,
          );

    final InputBorder errorBorder = border(const Color(0xFFDE1135));
    final InputBorder focusedErrorBorder = border(
      const Color(0xFFDE1135),
    );

    final InputBorder disabledBorder = useBorder
        ? border(theme.disabledColor.withValues(alpha: 0.2))
        : noBorder;

    const shadowDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 6,
          offset: Offset(0, 4),
          spreadRadius: -1,
        ),
        BoxShadow(
          color: Color(0x0F000000),
          blurRadius: 4,
          offset: Offset(0, 2),
          spreadRadius: -1,
        ),
      ],
    );

    Widget textField({required Widget? suffix}) {
      return FormField<String>(
        autovalidateMode: autovalidateMode,
        initialValue: controller?.text ?? initialValue ?? '',
        validator: validator != null
            ? (value) => validator!(controller?.text ?? value)
            : null,
        builder: (state) {
          final validationErrorText = state.errorText;
          final hasError =
              validationErrorText != null ||
              error != null ||
              errorText != null ||
              manualError;
          final inputBorder = hasError ? errorBorder : enabledBorder;
          final inputFocusedBorder = hasError
              ? focusedErrorBorder
              : focusedBorder;

          final effectiveErrorStyle =
              errorStyle ??
              const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0xFFDE1135),
              );

          final errorWidget =
              error ??
              ((validationErrorText != null &&
                          validationErrorText.isNotEmpty) ||
                      (errorText != null && errorText!.isNotEmpty)
                  ? Text(
                      validationErrorText ?? errorText!,
                      style: effectiveErrorStyle,
                      maxLines: errorMaxLines,
                      overflow: errorMaxLines == null
                          ? null
                          : TextOverflow.ellipsis,
                    )
                  : null);

          Widget inputField = TextField(
            key: key,
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText,
            readOnly: readOnly,
            onSubmitted: onsubmit,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textCapitalization: textCapitalization,
            minLines: effectiveMinLines,
            maxLines: effectiveMaxLines,
            inputFormatters: inputFormatters,
            style: textStyle ?? DefaultTextStyle.of(context).style,
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? (readOnly ? _kFillColor : _kFillColor),
              hintText: hintText,
              hintStyle:
                  hintStyle ??
                  TextStyle(color: theme.disabledColor, fontSize: 14),
              prefixIcon: prefixIcon,
              suffixIcon: suffix,
              contentPadding: effectiveContentPadding,
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputFocusedBorder,
              disabledBorder: disabledBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder,
              suffixIconConstraints: suffixIconConstraints,
            ),
            onTap: onTap,
            onChanged: (value) {
              state.didChange(value);
              onChanged?.call(value);
            },
          );

          if (showShadow) {
            inputField = DecoratedBox(
              decoration: hasError ? const BoxDecoration() : shadowDecoration,
              child: inputField,
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputField,
              if (errorWidget != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: DefaultTextStyle.merge(
                    style: effectiveErrorStyle,
                    maxLines: errorMaxLines,
                    overflow: errorMaxLines == null
                        ? TextOverflow.clip
                        : TextOverflow.ellipsis,
                    child: errorWidget,
                  ),
                ),
            ],
          );
        },
      );
    }

    Widget labeledField(Widget field) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Text.rich(
              TextSpan(
                text: labelText,
                style: TextStyle(
                  color: colorLabelText ?? ColorPalette.kBlack,
                  fontWeight: FontWeight.w500,
                ),
                children: !requiredMarking
                    ? null
                    : [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: colorLabelText ?? ColorPalette.kBlack,
                          ),
                        ),
                      ],
              ),
            ),
            const SizedBox(height: 8),
          ],
          field,
        ],
      );
    }

    if (controller != null) {
      return ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller!,
        builder: (context, value, _) {
          final hasText = value.text.isNotEmpty;
          return labeledField(
            textField(suffix: buildSuffix(showClear: hasText)),
          );
        },
      );
    }

    return labeledField(textField(suffix: buildSuffix(showClear: false)));
  }
}
