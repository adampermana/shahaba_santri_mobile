import 'package:flutter/material.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({
    required this.surah,
    super.key,
    this.onTap,
    this.isSelected = false,
  });

  final SurahModel surah;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0x14FFFFFF) : Colors.transparent,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 44,
                child: Text(
                  '${int.tryParse(surah.index ?? '') ?? surah.index}',
                  style: const TextStyle(
                    color: Color(0xFF00C6BF),
                    fontSize: 32,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.60,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surah.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${surah.count ?? 0} Ayat, ${surah.pages ?? 0} Hal',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.inverseSecondary,
                        letterSpacing: 0.60,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                surah.titleAr ?? '',
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontFamily: 'lpmq',
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1.75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
