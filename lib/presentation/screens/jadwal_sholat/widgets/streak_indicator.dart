import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';

class StreakIndicator extends StatelessWidget {
  const StreakIndicator({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CacheImageOrSvg(
          source: AppIcons.homeStreakFlame,
          width: 32,
          height: 32,
        ),
        // const Icon(
        //   Icons.local_fire_department,
        //   size: 32,
        //   color: Color(0xFFFF6D00),
        // ),
        const SizedBox(width: 8),
        Text(
          '$count',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: ColorPalette.primaryColor,
          ),
        ),
      ],
    );
  }
}
