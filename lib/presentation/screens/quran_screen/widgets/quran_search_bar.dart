import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class QuranSearchBar extends StatelessWidget {
  const QuranSearchBar({
    super.key,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.height = 36,
  });

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    final searchWidget = Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.searchLine,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.85),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              onTap: onTap,
              onChanged: onChanged,
              cursorColor: Colors.white,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: 'Cari ayat atau surah disini',
                hintStyle: TextStyle(
                  color: Color(0xFFA6A6A6),
                  fontSize: 12,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    if (readOnly && onTap != null) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: searchWidget,
      );
    }

    return searchWidget;
  }
}
