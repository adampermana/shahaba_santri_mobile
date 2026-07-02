import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/extension/datetime_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class DateNavigator extends StatelessWidget {
  const DateNavigator({
    required this.date,
    required this.onPrevious,
    required this.onNext,
    super.key,
  });

  final DateTime date;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final monthName = IndoDateTimeX.bulan[date.month - 1];
    final formatted = '${date.day} $monthName ${date.year}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ArrowButton(
            quarterTurns: 2,
            onTap: onPrevious,
          ),
          Column(
            children: [
              Text(
                formatted,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date.hijriDateId(),
                style: textTheme.bodySmall?.copyWith(
                  color: ColorPalette.contentSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          _ArrowButton(
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.onTap, this.quarterTurns = 0});

  final VoidCallback onTap;
  final int quarterTurns;

  @override
  Widget build(BuildContext context) {
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
            colorFilter: const ColorFilter.mode(
              ColorPalette.kBlack,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
