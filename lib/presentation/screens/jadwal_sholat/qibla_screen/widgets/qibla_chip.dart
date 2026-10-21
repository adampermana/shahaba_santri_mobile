import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

/// Glass-style chip used on the Qibla screen.
///
/// Background: white at 16% opacity, border: white,
/// icon + label in [ColorPalette.inverseSecondary].
class QiblaChip extends StatelessWidget {
  const QiblaChip({
    required this.icon,
    required this.label,
    super.key,
    this.onTap,
  });

  final String icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                ColorPalette.inverseSecondary,
                BlendMode.srcIn,
              ),
            ),
            Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorPalette.inverseSecondary,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
