import 'package:flutter/material.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class JuzCard extends StatelessWidget {
  const JuzCard({
    required this.juz,
    super.key,
    this.onTap,
  });

  final JuzModel juz;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final startVerse = juz.verseStartNumber;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 88,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorPalette.scaffoldBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 2,
            ),
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 5,
            ),
            BoxShadow(
              color: Color(0x02000000),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          spacing: 24,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${int.tryParse(juz.index ?? '') ?? juz.index}',
              style: const TextStyle(
                color: ColorPalette.primaryColor,
                fontSize: 40,
                fontFamily: 'Synonym Variable',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.60,
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Juz ${int.tryParse(juz.index ?? '') ?? juz.index}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: ColorPalette.kWhite,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mulai Dari ${juz.start?.name ?? ''} Ayat $startVerse',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelSmall?.copyWith(
                      color: ColorPalette.inverseSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
