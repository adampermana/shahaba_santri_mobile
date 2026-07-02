import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/location/location_state.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule/prayer_schedule_state.dart';
import 'package:sahaba_mobile/infrastructure/extension/datetime_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/home/widgets/card_jadwal_sholat.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onPrayerScheduleTap});

  final VoidCallback? onPrayerScheduleTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final today = DateTime.now();

    final locationState = context.watch<LocationCubit>().state;
    final location = locationState is LocationLoaded
        ? (locationState.city.lokasi ?? 'Jakarta Selatan')
        : 'Jakarta Selatan';

    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackground,
      appBar: CustomAppBar.buildHomeAppBar(
        date:
            '${today.day} ${IndoDateTimeX.bulan[today.month - 1]} ${today.year}',
        hijriDate: today.hijriDateId(),
        location: location,
        onLocationTap: () async {
          await context.push(
            '${RouterPath.mainPath}/select-city',
            extra: context.read<LocationCubit>(),
          );
        },
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              BlocBuilder<PrayerScheduleCubit, PrayerScheduleState>(
                builder: (context, scheduleState) {
                  final schedule = scheduleState is PrayerScheduleLoaded
                      ? scheduleState.response.jadwal
                      : null;
                  return CardJadwalSholat(
                    schedule: schedule,
                    isLoading: scheduleState is PrayerScheduleLoading,
                    onTap: onPrayerScheduleTap,
                  );
                },
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _FeatureCard(
                      icon: AppIcons.compass3Line,
                      title: 'Kiblat',
                      subtitle: 'Temukan arah akurat',
                      onTap: () => context.push(
                        '${RouterPath.mainPath}/${RouterPath.qiblaPath}',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _FeatureCard(
                      icon: AppIcons.calendarLine,
                      title: 'Kalender Hijriah',
                      subtitle: 'Lihat hari penting',
                      onTap: () => context.push(
                        '${RouterPath.mainPath}/${RouterPath.calendarPath}',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Lanjutkan baca',
                style: textTheme.titleMedium?.copyWith(
                  color: ColorPalette.contentTertiary,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 12),
              const _ContinueReadingCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 114,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorPalette.kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _cardShadow,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        ColorPalette.kWhite,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    height: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    height: 1,
                    color: ColorPalette.contentTertiary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 7,
              right: 0,
              child: SvgPicture.asset(
                AppIcons.arrowDropRightLine,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  ColorPalette.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContinueReadingCard extends StatelessWidget {
  const _ContinueReadingCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      decoration: BoxDecoration(
        color: ColorPalette.kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: _cardShadow,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Al-Baqarah',
                        style: textTheme.headlineSmall?.copyWith(
                          color: ColorPalette.kBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ayat 255',
                        style: textTheme.bodySmall?.copyWith(
                          color: ColorPalette.contentTertiary,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'البقرة',
                    textDirection: TextDirection.rtl,
                    style: textTheme.displaySmall?.copyWith(
                      color: ColorPalette.arabicText,
                      fontFamily: 'Amiri',
                      fontSize: 32,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.primaryColor,
                    foregroundColor: ColorPalette.kWhite,
                    elevation: 1,
                    shadowColor: ColorPalette.kBlack.withValues(alpha: 0.05),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                  child: Text(
                    'Lanjutkan',
                    style: textTheme.bodySmall?.copyWith(
                      color: ColorPalette.kWhite,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<BoxShadow> get _cardShadow => [
  BoxShadow(
    color: ColorPalette.kBlack.withValues(alpha: 0.08),
    blurRadius: 2,
  ),
  BoxShadow(
    color: ColorPalette.kBlack.withValues(alpha: 0.07),
    blurRadius: 4,
  ),
  BoxShadow(
    color: ColorPalette.kBlack.withValues(alpha: 0.04),
    blurRadius: 5,
  ),
  BoxShadow(
    color: ColorPalette.kBlack.withValues(alpha: 0.01),
    blurRadius: 6,
  ),
];
