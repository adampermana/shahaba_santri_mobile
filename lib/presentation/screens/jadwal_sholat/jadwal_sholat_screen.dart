import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class JadwalSholatScreen extends StatelessWidget {
  const JadwalSholatScreen({super.key});

  static const _prayerTimes = [
    _PrayerTime(icon: AppIcons.foggyLine, name: 'Subuh', time: '04 : 35'),
    _PrayerTime(icon: AppIcons.hazeLine, name: 'Terbit', time: '05 : 51'),
    _PrayerTime(icon: AppIcons.sunLine, name: 'Dzuhur', time: '11 : 53'),
    _PrayerTime(icon: AppIcons.sunFoggyLine, name: 'Ashar', time: '15 : 13'),
    _PrayerTime(icon: AppIcons.hazeLine, name: 'Maghrib', time: '17 : 43'),
    _PrayerTime(icon: AppIcons.moonLine, name: 'Isya', time: '19 : 13'),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text('26 June 2026', style: textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      '10 Muharram',
                      style: textTheme.bodySmall?.copyWith(
                        color: ColorPalette.contentSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
              sliver: SliverToBoxAdapter(
                child: _NextPrayerCard(textTheme: textTheme),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  final item = _prayerTimes[index];
                  return _PrayerTimeTile(
                    item: item,
                    isActive: item.name == 'Dzuhur',
                  );
                },
                separatorBuilder: (_, _) => const Divider(
                  height: 1,
                  color: ColorPalette.borderTransparent,
                ),
                itemCount: _prayerTimes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextPrayerCard extends StatelessWidget {
  const _NextPrayerCard({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 201,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2979FF),
            Color(0xFF4FC3F7),
            Color(0xFFE0F7FA),
          ],
          stops: [0.12, 0.56, 1],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ashar',
            style: textTheme.titleLarge?.copyWith(
              color: ColorPalette.kWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '15 : 15',
            style: textTheme.displayLarge?.copyWith(
              color: ColorPalette.kWhite,
              fontSize: 48,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrayerTimeTile extends StatelessWidget {
  const _PrayerTimeTile({required this.item, required this.isActive});

  final _PrayerTime item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final backgroundColor = isActive
        ? ColorPalette.primaryColor
        : ColorPalette.kWhite;
    final contentColor = isActive
        ? ColorPalette.kWhite
        : ColorPalette.contentSecondary;
    final timeColor = isActive ? ColorPalette.kWhite : ColorPalette.kBlack;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: isActive ? BorderRadius.circular(8) : BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF333333).withValues(alpha: 0.15),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            item.icon,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              item.name,
              style: textTheme.labelMedium?.copyWith(color: contentColor),
            ),
          ),
          Text(
            item.time,
            style: textTheme.titleMedium?.copyWith(
              color: timeColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            isActive ? AppIcons.volumeUpLine : AppIcons.volumeMuteLine,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}

class _PrayerTime {
  const _PrayerTime({
    required this.icon,
    required this.name,
    required this.time,
  });

  final String icon;
  final String name;
  final String time;
}
