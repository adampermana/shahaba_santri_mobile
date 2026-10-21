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
      padding: const EdgeInsets.symmetric(horizontal: 13.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(27),
        border: Border.all(
          color: const Color(0x14000000),
          width: 1.125,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 1,
            offset: Offset(0, 0.5),
          ),
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.searchLine,
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(
              Color(0xFF5E5E5E),
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
              cursorColor: const Color(0xFF007D56),
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w500,
                color: Color(0xFF0F172A),
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: 'Cari ayat atau surah disini',
                hintStyle: TextStyle(
                  color: Color(0xFF5E5E5E),
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
