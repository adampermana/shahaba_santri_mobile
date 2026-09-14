import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass_kit/glass_kit.dart';
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
    return GlassContainer.clearGlass(
      height: 56,
      width: double.infinity,
      blur: 18,
      borderRadius: BorderRadius.circular(28),
      borderColor: Colors.white,
      borderWidth: 1,
      color: Colors.white.withValues(alpha: 0.16),
      // shadowStrength: 4,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      child: Row(
        children: [
          const SizedBox(width: 18),
          SvgPicture.asset(
            AppIcons.searchLine,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: .85),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              onTap: onTap,
              onChanged: onChanged,
              cursorColor: Colors.white,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: 'Cari ayat atau surah disini',
                hintStyle: TextStyle(
                  color: Color(0xFFA6A6A6),

                  fontSize: 14,
                  fontFamily: 'Synonym Variable',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }
}
