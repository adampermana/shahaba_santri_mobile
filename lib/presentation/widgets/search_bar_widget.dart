import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.hintText,
    this.height = 36,
    this.borderRadius = 27,
    this.fillColor,
    this.borderColor,
    this.borderWidth = 1.125,
    this.prefixIcon,
    this.trailing,
    this.contentPadding,
    this.hintStyle,
    this.textStyle,
    this.useGlass = false,
  });

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? hintText;
  final double height;
  final double borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final double borderWidth;
  final Widget? prefixIcon;
  final Widget? trailing;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool useGlass;

  @override
  Widget build(BuildContext context) {
    final effectiveHintText =
        hintText ?? 'Cari surah, ayat, atau tafsir apa hari ini?';
    final effectiveHintStyle = hintStyle ??
        const TextStyle(
          color: Color(0xFFDDDDDD),
          fontSize: 12,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
        );
    final effectiveTextStyle = textStyle ??
        const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: 'Satoshi',
        );

    final innerRow = Row(
      children: [
        const SizedBox(width: 14),
        prefixIcon ??
            SvgPicture.asset(
              AppIcons.searchLine,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                Colors.white.withValues(alpha: 0.85),
                BlendMode.srcIn,
              ),
            ),
        const SizedBox(width: 11),
        Expanded(
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            onChanged: onChanged,
            cursorColor: Colors.white,
            style: effectiveTextStyle,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              isDense: true,
              contentPadding: contentPadding ?? EdgeInsets.zero,
              hintText: effectiveHintText,
              hintStyle: effectiveHintStyle,
            ),
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
        const SizedBox(width: 14),
      ],
    );

    if (useGlass) {
      return GlassContainer.clearGlass(
        height: height,
        width: double.infinity,
        blur: 18,
        borderRadius: BorderRadius.circular(borderRadius),
        borderColor: borderColor ?? Colors.white.withValues(alpha: 0.35),
        borderWidth: borderWidth,
        color: fillColor ?? Colors.white.withValues(alpha: 0.08),
        shadowColor: Colors.black.withValues(alpha: 0.1),
        child: innerRow,
      );
    }

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: fillColor ?? Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? const Color(0x52E8E8E8),
          width: borderWidth,
        ),
      ),
      child: innerRow,
    );
  }
}
