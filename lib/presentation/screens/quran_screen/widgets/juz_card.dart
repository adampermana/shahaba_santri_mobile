import 'package:flutter/material.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class JuzCard extends StatelessWidget {
  const JuzCard({
    required this.juz,
    super.key,
    this.onTap,
    this.isSelected = false,
  });

  final JuzModel juz;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final startVerse = juz.verseStartNumber;

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
                  '${int.tryParse(juz.index ?? '') ?? juz.index}',
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
                      'Juz ${int.tryParse(juz.index ?? '') ?? juz.index}',
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
                      'Mulai Dari ${juz.start?.name ?? ''} Ayat $startVerse',
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
            ],
          ),
        ),
      ),
    );
  }
}
