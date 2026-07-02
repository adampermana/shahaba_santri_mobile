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

  static const _hijriMonths = [
    'Muharram',
    'Safar',
    "Rabi'ul Awal",
    "Rabi'ul Akhir",
    'Jumadil Awal',
    'Jumadil Akhir',
    'Rajab',
    "Sya'ban",
    'Ramadhan',
    'Syawal',
    "Dzulqa'dah",
    'Dzulhijjah',
  ];

  String _hijriDate(DateTime date) {
    final hijriMonth = _hijriMonths[date.month - 1];
    return '${date.day} $hijriMonth';
  }

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
            icon: AppIcons.arrowLeftLine,
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
                _hijriDate(date),
                style: textTheme.bodySmall?.copyWith(
                  color: ColorPalette.contentSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          _ArrowButton(
            icon: AppIcons.arrowRightLine,
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

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
        icon: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            ColorPalette.kBlack,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
