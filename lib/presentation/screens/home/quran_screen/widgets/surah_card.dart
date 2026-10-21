import 'package:flutter/material.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color(0x14000000),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 3,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Text(
                    '${int.tryParse(surah.index ?? '') ?? surah.index}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF0F172A),
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
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF007D56),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${surah.count ?? 0} Ayat, ${surah.pages ?? 0} Hal',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5E5E5E),
                          letterSpacing: 0.60,
                        ),
                      ),
                    ],
                  ),
                ),
                if ((surah.titleAr ?? '').isNotEmpty) ...[
                  const SizedBox(width: 12),
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const RadialGradient(
                      radius: 1.2,
                      colors: [
                        Color(0xFF007D56),
                        Color(0xFF034D34),
                        Color(0xFF061D13),
                      ],
                      stops: [0.0, 0.6, 1.0],
                    ).createShader(bounds),
                    child: Text(
                      surah.titleAr!,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontFamily: 'lpmq',
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
