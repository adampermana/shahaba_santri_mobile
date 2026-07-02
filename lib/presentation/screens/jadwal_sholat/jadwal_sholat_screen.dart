import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/location/location_state.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule/prayer_schedule_state.dart';
import 'package:sahaba_mobile/business_logic/streak/streak_cubit.dart';
import 'package:sahaba_mobile/business_logic/streak/streak_state.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/home/widgets/card_jadwal_sholat.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/date_navigator.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/prayer_time_tile.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/streak_indicator.dart';

class JadwalSholatScreen extends StatelessWidget {
  const JadwalSholatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackground,
      body: SafeArea(
        child: BlocBuilder<PrayerScheduleCubit, PrayerScheduleState>(
          builder: (context, state) {
            if (state is PrayerScheduleLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorPalette.primaryColor,
                ),
              );
            }
            if (state is PrayerScheduleError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _reload(context),
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              );
            }
            if (state is PrayerScheduleLoaded) {
              return _LoadedView(
                state: state,
                schedule: state.response.jadwal,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<void> _reload(BuildContext context) async {
    final locationState = context.read<LocationCubit>().state;
    if (locationState is LocationLoaded) {
      await context.read<PrayerScheduleCubit>().loadSchedule(
        locationState.city.id!,
        DateTime.now(),
      );
    }
  }
}

class _LoadedView extends StatelessWidget {
  const _LoadedView({required this.state, required this.schedule});

  final PrayerScheduleLoaded state;
  final PrayerScheduleModel? schedule;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
          sliver: SliverToBoxAdapter(
            child: DateNavigator(
              date: state.date,
              onPrevious: () =>
                  context.read<PrayerScheduleCubit>().previousDay(),
              onNext: () => context.read<PrayerScheduleCubit>().nextDay(),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          sliver: SliverToBoxAdapter(
            child: _NextPrayerCard(
              textTheme: textTheme,
              nextPrayer: state.nextPrayer,
              schedule: schedule,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          sliver: SliverToBoxAdapter(
            child: _InfoRow(
              textTheme: textTheme,
              onCompassTap: () => context.push(
                '${RouterPath.mainPath}/${RouterPath.qiblaPath}',
              ),
              onLocationTap: () async {
                await context.push(
                  '${RouterPath.mainPath}/select-city',
                  extra: context.read<LocationCubit>(),
                );
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          sliver: SliverList.builder(
            itemCount: _prayers.length,
            itemBuilder: (context, index) {
              final item = _prayers[index];
              final time =
                  schedule?.getTimeByPrayerName(
                    item.name.toLowerCase(),
                  ) ??
                  item.defaultTime;
              final isActive = state.activePrayer?.label == item.name;
              final streakState = context.watch<StreakCubit>().state;
              final isChecked =
                  streakState is StreakLoaded &&
                  streakState.isPrayerChecked(
                    item.name.toLowerCase(),
                  );
              final isFuture = _isPrayerInFuture(
                time,
                state.date,
              );

              return PrayerTimeTile(
                icon: item.icon,
                name: item.name,
                time: _formatTime(time),
                isActive: isActive,
                isChecked: isChecked,
                isEnabled: !isChecked && !isFuture,
                showCheckbox: item.showCheckbox,
                isVolumeMuted: item.isVolumeMuted,
                onCheck: () => _onCheck(context, item.name, time),
              );
            },
          ),
        ),
      ],
    );
  }

  bool _isPrayerInFuture(String? time, DateTime date) {
    if (time == null) return true;
    final parts = time.split(':');
    if (parts.length != 2) return true;
    final h = int.tryParse(parts[0].trim()) ?? 0;
    final m = int.tryParse(parts[1].trim()) ?? 0;
    final now = DateTime.now();
    final prayerTime = DateTime(
      date.year,
      date.month,
      date.day,
      h,
      m,
    );
    return now.isBefore(prayerTime);
  }

  void _onCheck(
    BuildContext context,
    String name,
    String? time,
  ) {
    final now = DateTime.now();
    if (schedule == null) return;

    context.read<StreakCubit>().checkPrayer(
      prayerName: name.toLowerCase(),
      now: now,
      schedule: schedule!,
    );
  }

  String _formatTime(String? time) {
    if (time == null) return '-- : --';
    final parts = time.split(':');
    if (parts.length != 2) return time;
    return '${parts[0].trim()} : ${parts[1].trim()}';
  }

  static const _prayers = [
    _PrayerItem(
      icon: AppIcons.foggyLine,
      name: 'Subuh',
      defaultTime: '04:35',
    ),
    _PrayerItem(
      icon: AppIcons.hazeLine,
      name: 'Terbit',
      defaultTime: '05:51',
      showCheckbox: false,
    ),
    _PrayerItem(
      icon: AppIcons.sunLine,
      name: 'Dzuhur',
      defaultTime: '11:53',
    ),
    _PrayerItem(
      icon: AppIcons.sunFoggyLine,
      name: 'Ashar',
      defaultTime: '15:13',
    ),
    _PrayerItem(
      icon: AppIcons.hazeLine,
      name: 'Maghrib',
      defaultTime: '17:43',
      isVolumeMuted: true,
    ),
    _PrayerItem(
      icon: AppIcons.moonLine,
      name: 'Isya',
      defaultTime: '19:13',
    ),
  ];
}

class _PrayerItem {
  const _PrayerItem({
    required this.icon,
    required this.name,
    required this.defaultTime,
    this.showCheckbox = true,
    this.isVolumeMuted = false,
  });

  final String icon;
  final String name;
  final String defaultTime;
  final bool showCheckbox;
  final bool isVolumeMuted;
}

class _NextPrayerCard extends StatelessWidget {
  const _NextPrayerCard({
    required this.textTheme,
    required this.nextPrayer,
    required this.schedule,
  });

  final TextTheme textTheme;
  final WaktuSholat? nextPrayer;
  final PrayerScheduleModel? schedule;

  @override
  Widget build(BuildContext context) {
    final w = nextPrayer ?? WaktuSholat.subuh;
    final time = schedule?.getTimeByPrayerName(w.label.toLowerCase()) ?? w.time;

    final isNight = w == WaktuSholat.maghrib || w == WaktuSholat.isya;
    final masjidAsset = isNight
        ? AppIcons.jadwalSholatMasjidMalam
        : AppIcons.jadwalSholatMasjidSiang;
    final celestialAsset = isNight
        ? AppIcons.jadwalSholatMoon
        : AppIcons.jadwalSholatSubuhCapa1; // using subuh capa for sun

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: 201,
      decoration: BoxDecoration(
        gradient: w.gradient.toLinearGradient(),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Celestial body (Sun / Moon)
          Positioned(
            top: isNight ? -20 : -90,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              child: SvgPicture.asset(
                celestialAsset,
                key: ValueKey(celestialAsset),
                height: 151,
              ),
            ),
          ),
          // Masjid
          Positioned(
            bottom: context.isTabletLarge
                ? -350
                : context.isTabletMedium
                ? -200
                : context.isTabletSmall
                ? -200
                : context.isPhoneLarge
                ? -110
                : context.isPhoneMedium
                ? -100
                : context.isPhoneSmall
                ? -100
                : -100,
            left: -10,
            right: -10,
            child: SvgPicture.asset(
              masjidAsset,
              fit: BoxFit.cover,
            ),
          ),
          // Clouds Left
          Positioned(
            left: w.vectorLT.dx,
            top: w.vectorLT.dy,
            child: SvgPicture.asset(
              w.vectorL,
              width: w.vectorLSize,
            ),
          ),
          // Clouds Right
          Positioned(
            left: w.vectorRT.dx,
            top: w.vectorRT.dy,
            child: SvgPicture.asset(
              w.vectorR,
              width: w.vectorRSize,
            ),
          ),
          // Text content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  w.label,
                  style: textTheme.titleLarge?.copyWith(
                    color: ColorPalette.kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  _formatTime(time),
                  style: textTheme.displayLarge?.copyWith(
                    color: ColorPalette.kWhite,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(String? time) {
    if (time == null) return '-- : --';
    final parts = time.split(':');
    if (parts.length != 2) return time;
    return '${parts[0].trim()} : ${parts[1].trim()}';
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.textTheme,
    required this.onCompassTap,
    required this.onLocationTap,
  });

  final TextTheme textTheme;
  final VoidCallback onCompassTap;
  final VoidCallback onLocationTap;

  @override
  Widget build(BuildContext context) {
    final streakState = context.watch<StreakCubit>().state;
    final streakCount = streakState is StreakLoaded
        ? streakState.currentStreak
        : 0;

    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        final location = state is LocationLoaded
            ? (state.city.lokasi ?? 'Jakarta')
            : 'Jakarta';

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreakIndicator(count: streakCount),
            Row(
              children: [
                _InfoChip(
                  icon: AppIcons.compass3Line,
                  onTap: onCompassTap,
                ),
                const SizedBox(width: 10),
                _LocationChip(
                  label: location,
                  onTap: onLocationTap,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: ColorPalette.surfaceTertiary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            ColorPalette.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class _LocationChip extends StatelessWidget {
  const _LocationChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: ColorPalette.surfaceTertiary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.mapPin2Line,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                ColorPalette.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 80),
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: ColorPalette.contentSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SvgPicture.asset(
              AppIcons.arrowDropDownLine,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                ColorPalette.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
