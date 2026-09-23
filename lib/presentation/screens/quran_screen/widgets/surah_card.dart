import 'package:flutter/material.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({
    required this.surah,
    super.key,
    this.onTap,
  });

  final SurahModel surah;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        // borderRadius: BorderRadius.circular(16),
        child: Ink(
          height: 88,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: ColorPalette.scaffoldBackground,
            // borderRadius: BorderRadius.circular(16),
            boxShadow: [
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
            mainAxisSize: MainAxisSize.min,
            spacing: 24,
            children: [
              Text(
                '${int.tryParse(surah.index ?? '') ?? surah.index}',
                style: const TextStyle(
                  color: ColorPalette.primaryColor,
                  fontSize: 40,
                  fontFamily: 'Satoshi',
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
                      surah.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorPalette.kWhite,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${surah.count ?? 0} Ayat, ${surah.pages ?? 0} Hal',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.labelSmall?.copyWith(
                        color: ColorPalette.inverseSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                surah.titleAr ?? '',
                style: textTheme.displaySmall?.copyWith(
                  fontFamily: 'lpmq',
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: ColorPalette.kWhite,
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
