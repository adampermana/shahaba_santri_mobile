import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/enum/enum_widget.dart';

class SubmitButtonStylesWidget extends StatelessWidget {
  const SubmitButtonStylesWidget({
    required this.style,
    super.key,
    this.onPressed,
    this.child,
    this.icon,
    this.gradient,
    this.primaryColor,
    this.textButton = 'Submit',
    this.textButtonColor,
    this.textButtonSize,
    this.textStyle,
    this.textDecoration = TextDecoration.none,
    this.height,
    this.width,
    this.radius = 12.0,
    this.isLoading = false,
    this.isActive = true,
    this.useGradient = false,
  });

  final SubmitButtonStyle style;

  // Callbacks & content
  final VoidCallback? onPressed;
  final Widget? child;
  final Widget? icon;

  // Appearance
  final Gradient? gradient;
  final Color? primaryColor;
  final String? textButton;
  final Color? textButtonColor;
  final double? textButtonSize;
  final TextStyle? textStyle;
  final TextDecoration textDecoration;
  final double? height;
  final double? width;
  final double radius;

  // State
  final bool isLoading;
  final bool isActive;
  final bool useGradient;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case SubmitButtonStyle.elevated:
        return _elevatedButton(context);
      case SubmitButtonStyle.outlined:
        return _outlinedButton(context);
      case SubmitButtonStyle.text:
        return _textButton(context, textDecoration);
    }
  }

  Widget _elevatedButton(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveOnPressed = (isLoading || !isActive) ? null : onPressed;

    final buttonChild = isLoading
        ? const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ?icon,
              if (icon != null) const SizedBox(width: 8),
              child ??
                  Text(
                    textButton!,
                    style:
                        textStyle ??
                        theme.textTheme.labelMedium?.copyWith(
                          color: textButtonColor ?? ColorPalette.kWhite,
                          fontSize: textButtonSize,
                        ),
                  ),
            ],
          );

    final button = ElevatedButton(
      onPressed: effectiveOnPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: useGradient ? Colors.transparent : primaryColor,
        disabledBackgroundColor: useGradient
            ? Colors.transparent
            : primaryColor,
        disabledForegroundColor: textButtonColor ?? ColorPalette.kWhite,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: buttonChild,
    );

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.0,
      child: useGradient
          ? Container(
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: button,
              ),
            )
          : button,
    );
  }

  Widget _outlinedButton(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        side: BorderSide(
          color: onPressed == null
              ? theme.disabledColor
              : primaryColor ?? theme.primaryColor,
        ),
        minimumSize: Size(width ?? double.infinity, height ?? 36.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.primaryColor,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ?icon,
                if (icon != null) const SizedBox(width: 8),
                child ??
                    Text(
                      textButton!,
                      style:
                          textStyle ??
                          theme.textTheme.labelMedium?.copyWith(
                            color:
                                textButtonColor ??
                                primaryColor ??
                                theme.primaryColor,
                            fontSize: textButtonSize,
                          ),
                    ),
              ],
            ),
    );
  }

  Widget _textButton(BuildContext context, TextDecoration textDecoration) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        minimumSize: Size(width ?? double.infinity, height ?? 36.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.primaryColor,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ?icon,
                if (icon != null) const SizedBox(width: 8),
                child ??
                    Text(
                      textButton!,
                      style:
                          textStyle ??
                          theme.textTheme.labelMedium?.copyWith(
                            decoration: textDecoration,
                            color: textButtonColor ?? ColorPalette.kBlack,
                            decorationColor:
                                textButtonColor ?? ColorPalette.kBlack,
                            decorationThickness: 1.4,
                            fontSize: textButtonSize,
                          ),
                    ),
              ],
            ),
    );
  }
}
