import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class CalendarNavHeader extends StatelessWidget {
  const CalendarNavHeader({
    required this.hijriDate,
    required this.gregorianDate,
    required this.onPrevious,
    required this.onNext,
    super.key,
  });

  final String hijriDate;
  final String gregorianDate;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _NavArrowButton(
          quarterTurns: 2,
          onTap: onPrevious,
        ),
        Column(
          children: [
            Text(
              hijriDate,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              gregorianDate,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorPalette.contentSecondary,
              ),
            ),
          ],
        ),
        _NavArrowButton(onTap: onNext),
      ],
    );
  }
}

class _NavArrowButton extends StatelessWidget {
  const _NavArrowButton({required this.onTap, this.quarterTurns = 0});

  final VoidCallback? onTap;
  final int quarterTurns;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return Container(
      width: 32,
      height: 48,
      decoration: BoxDecoration(
        color: ColorPalette.surfaceTertiary,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: IconButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        icon: RotatedBox(
          quarterTurns: quarterTurns,
          child: SvgPicture.asset(
            AppIcons.arrowDropRightLine,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isDisabled ? ColorPalette.contentDisabled : ColorPalette.kBlack,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
