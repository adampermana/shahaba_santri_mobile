import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class QuranSearchBar extends StatelessWidget {
  const QuranSearchBar({
    super.key,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.onTap,
  });

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ColorPalette.surfaceTertiary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.searchLine,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              ColorPalette.contentTertiary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              onTap: onTap,
              onChanged: onChanged,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorPalette.kBlack,
              ),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Cari ayat atau surah disini',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.contentTertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
