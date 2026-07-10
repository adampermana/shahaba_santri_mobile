import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_state.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_state.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_cubit.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_state.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/extension/datetime_extension.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/infrastructure/services/adzan_service.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/enum/enum_widget.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/home/widgets/card_jadwal_sholat.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/prayer_time_tile.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/streak_indicator.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class JadwalSholatScreen extends StatelessWidget {
  const JadwalSholatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerScheduleCubit, PrayerScheduleState>(
      builder: (context, scheduleState) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: scheduleState is PrayerScheduleLoaded
              ? const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark,
                )
              : const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
          child: Scaffold(
            backgroundColor: ColorPalette.scaffoldBackground,
            body: BlocListener<PrayerScheduleCubit, PrayerScheduleState>(
              listenWhen: (previous, current) {
                if (current is! PrayerScheduleLoaded) return false;
                if (previous is! PrayerScheduleLoaded) return true;
                return !_isSameDate(previous.date, current.date);
              },
              listener: (context, state) {
                if (state is PrayerScheduleLoaded) {
                  unawaited(
                    context.read<StreakCubit>().loadStreak(state.date),
                  );
                }
              },
              child: BlocBuilder<PrayerScheduleCubit, PrayerScheduleState>(
                builder: (context, state) {
                  if (state is PrayerScheduleLoading) {
                    return const SafeArea(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorPalette.primaryColor,
                        ),
                      ),
                    );
                  }
                  if (state is PrayerScheduleError) {
                    return SafeArea(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.message),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: SubmitButtonStylesWidget(
                                textButton: 'Coba Lagi',
                                height: 50,
                                primaryColor: ColorPalette.primaryColor,
                                style: SubmitButtonStyle.elevated,
                                onPressed: () => _reload(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (state is PrayerScheduleLoaded) {
                    return _LoadedView(
                      state: state,
                      schedule: state.response.jadwal,
                      onPrevious: () =>
                          context.read<PrayerScheduleCubit>().previousDay(),
                      onNext: () =>
                          context.read<PrayerScheduleCubit>().nextDay(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

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

class _LoadedView extends StatefulWidget {
  const _LoadedView({
    required this.state,
    required this.schedule,
    required this.onPrevious,
    required this.onNext,
  });

  final PrayerScheduleLoaded state;
  final PrayerScheduleModel? schedule;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  State<_LoadedView> createState() => _LoadedViewState();
}

class _LoadedViewState extends State<_LoadedView> {
  final AdzanService _adzanService = AdzanService.instance();
  Map<String, bool> _adzanEnabled = const {};

  @override
  void initState() {
    super.initState();
    unawaited(_syncAdzan());
  }

  @override
  void didUpdateWidget(covariant _LoadedView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final scheduleChanged = oldWidget.schedule != widget.schedule;
    final dateChanged = !_isSameDate(oldWidget.state.date, widget.state.date);
    if (scheduleChanged || dateChanged) {
      unawaited(_syncAdzan());
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _NextPrayerCard(
            textTheme: textTheme,
            date: widget.state.date,
            nextPrayer: widget.state.nextPrayer,
            schedule: _isFutureDate(widget.state.date)
                ? (widget.state.todaySchedule ?? widget.schedule)
                : widget.schedule,
            onPrevious: widget.onPrevious,
            onNext: widget.onNext,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
          sliver: SliverToBoxAdapter(
            child: _InfoRow(
              textTheme: textTheme,
              date: widget.state.date,
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
                  widget.schedule?.getTimeByPrayerName(
                    item.name.toLowerCase(),
                  ) ??
                  item.defaultTime;
              final isActive = widget.state.activePrayer?.label == item.name;
              final streakState = context.watch<StreakCubit>().state;
              final isChecked =
                  streakState is StreakLoaded &&
                  streakState.date == _dateKey(widget.state.date) &&
                  streakState.isPrayerChecked(
                    item.name.toLowerCase(),
                  );
              final isPastDay = _isPastDate(widget.state.date);
              final isFutureDay = _isFutureDate(widget.state.date);
              final canInteract = !isPastDay && !isFutureDay && isActive;

              return PrayerTimeTile(
                icon: item.icon,
                name: item.name,
                time: _formatTime(time),
                isActive: isActive,
                isChecked: isChecked,
                isHistory: isPastDay || (!isFutureDay && !isActive),
                isEnabled: canInteract,
                showCheckbox: item.showCheckbox,
                showVolume: item.showVolume,
                isVolumeMuted: item.showVolume && !_isAdzanEnabled(item.name),
                onVolumeTap: canInteract && item.showVolume
                    ? () => _onVolumeTap(context, item)
                    : null,
                onCheck: canInteract
                    ? () => _onCheck(context, item.name, time)
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _syncAdzan() async {
    final preferences = _adzanService.getAdzanPreferences(
      _prayers.where((item) => item.showVolume).map((item) => item.name),
    );
    if (mounted) {
      setState(() => _adzanEnabled = preferences);
    }

    await _adzanService.syncSchedule(
      date: widget.state.date,
      cityId: widget.state.cityId,
    );
  }

  Future<void> _onVolumeTap(
    BuildContext context,
    _PrayerItem item,
  ) async {
    final isEnabled = await _adzanService.toggleAdzan(
      prayerName: item.name,
      date: widget.state.date,
      cityId: widget.state.cityId,
    );

    if (!mounted) return;
    setState(() {
      _adzanEnabled = {
        ..._adzanEnabled,
        item.name.toLowerCase(): isEnabled,
      };
    });
  }

  bool _isAdzanEnabled(String prayerName) =>
      _adzanEnabled[prayerName.toLowerCase()] ?? true;

  bool _isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool _isFutureDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    return target.isAfter(today);
  }

  bool _isPastDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    return target.isBefore(today);
  }

  void _onCheck(
    BuildContext context,
    String name,
    String? time,
  ) {
    final now = DateTime.now();
    if (widget.schedule == null) return;

    unawaited(
      context.read<StreakCubit>().checkPrayer(
        prayerName: name.toLowerCase(),
        now: now,
        schedule: widget.schedule!,
      ),
    );
  }

  String _formatTime(String? time) {
    if (time == null) return '-- : --';
    final parts = time.split(':');
    if (parts.length != 2) return time;
    return '${parts[0].trim()} : ${parts[1].trim()}';
  }

  String _dateKey(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
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
      showVolume: false,
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
    this.showVolume = true,
  });

  final String icon;
  final String name;
  final String defaultTime;
  final bool showCheckbox;
  final bool showVolume;
}

class _NextPrayerCard extends StatelessWidget {
  const _NextPrayerCard({
    required this.textTheme,
    required this.date,
    required this.nextPrayer,
    required this.schedule,
    required this.onPrevious,
    required this.onNext,
  });

  final TextTheme textTheme;
  final DateTime date;
  final WaktuSholat? nextPrayer;
  final PrayerScheduleModel? schedule;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  static const _mosqueColor = Color(0xFF474747);

  @override
  Widget build(BuildContext context) {
    final w = nextPrayer ?? WaktuSholat.subuh;
    final time = schedule?.getTimeByPrayerName(w.label.toLowerCase()) ?? w.time;
    const headerHeight = 327.0;
    final mosqueAsset = _mosqueAsset();
    final celestialAsset = _celestialAsset(w);
    final cloudWidth = _cloudWidth(context.mediaQuerySize.width);
    final cloudPosition = _cloudPosition(w, cloudWidth);
    final celestial = _celestialPosition(w);
    final mosqueSize = _mosqueSize(context.mediaQuerySize.width);

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: headerHeight,
      decoration: BoxDecoration(
        gradient: w.gradient.toLinearGradient(),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            left: cloudPosition.left,
            top: cloudPosition.leftTop,
            child: SvgPicture.asset(
              w.vectorL,
              width: cloudWidth,
            ),
          ),
          Positioned(
            right: cloudPosition.right,
            top: cloudPosition.rightTop,
            child: SvgPicture.asset(
              w.vectorR,
              width: cloudWidth,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: celestial.top,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 760),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                transitionBuilder: (child, animation) {
                  final offset = Tween<Offset>(
                    begin: _celestialEntryOffset(w),
                    end: Offset.zero,
                  ).animate(animation);

                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: offset,
                      child: child,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  celestialAsset,
                  key: ValueKey('${w.name}-$celestialAsset'),
                  width: celestial.size,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -mosqueSize.height * 0.6,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: mosqueSize.width,
                height: mosqueSize.height,
                child: SvgPicture.asset(
                  mosqueAsset,
                  fit: BoxFit.fill,
                  colorFilter: const ColorFilter.mode(
                    _mosqueColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 16,
            right: 16,
            child: _HeaderDateNavigator(
              date: date,
              textTheme: textTheme,
              onPrevious: onPrevious,
              onNext: onNext,
            ),
          ),
          Positioned(
            top: 164,
            left: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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

  double _cloudWidth(double cardWidth) =>
      (cardWidth * 0.62).clamp(154.0, 210.0);

  String _mosqueAsset() => AppIcons.jadwalSholatMasjidMalam;

  String _celestialAsset(WaktuSholat prayer) {
    return switch (prayer) {
      WaktuSholat.terbit => AppIcons.jadwalSholatTerbitCapa1,
      WaktuSholat.maghrib => AppIcons.jadwalSholatMaghribFlat,
      WaktuSholat.isya => AppIcons.jadwalSholatMoon,
      _ => AppIcons.jadwalSholatSubuhCapa1,
    };
  }

  Offset _celestialEntryOffset(WaktuSholat prayer) {
    return switch (prayer) {
      WaktuSholat.maghrib => const Offset(0, -0.20),
      _ => const Offset(0, 0.28),
    };
  }

  _CelestialPosition _celestialPosition(WaktuSholat prayer) {
    return switch (prayer) {
      WaktuSholat.maghrib => const _CelestialPosition(
        top: 204,
        size: 178,
      ),
      WaktuSholat.isya => const _CelestialPosition(
        top: 209,
        size: 118,
      ),
      WaktuSholat.terbit => const _CelestialPosition(
        top: 227,
        size: 184,
      ),
      _ => const _CelestialPosition(
        top: 227,
        size: 184,
      ),
    };
  }

  Size _mosqueSize(double screenWidth) {
    const figmaMosqueWidth = 593.563;
    const figmaMosqueHeight = 249.053;
    final width = screenWidth * (figmaMosqueWidth / 402);
    final height = width * (figmaMosqueHeight / figmaMosqueWidth);
    return Size(width, height);
  }

  _CloudPosition _cloudPosition(WaktuSholat prayer, double cloudWidth) {
    switch (prayer) {
      case WaktuSholat.maghrib:
        return _CloudPosition(
          left: -cloudWidth * 0.74,
          leftTop: -2,
          right: -cloudWidth * 0.56,
          rightTop: 0,
        );
      case WaktuSholat.isya:
        return _CloudPosition(
          left: -cloudWidth * 0.66,
          leftTop: -6,
          right: -cloudWidth * 0.62,
          rightTop: -6,
        );
      case WaktuSholat.terbit:
        return _CloudPosition(
          left: -cloudWidth * 0.74,
          leftTop: 0,
          right: -cloudWidth * 0.60,
          rightTop: -4,
        );
      case WaktuSholat.subuh:
      case WaktuSholat.dzuhur:
      case WaktuSholat.ashar:
        return _CloudPosition(
          left: -cloudWidth * 0.62,
          leftTop: 118,
          right: -cloudWidth * 0.5,
          rightTop: 145,
        );
    }
  }

  String _formatTime(String? time) {
    if (time == null) return '-- : --';
    final parts = time.split(':');
    if (parts.length != 2) return time;
    return '${parts[0].trim()} : ${parts[1].trim()}';
  }
}

class _HeaderDateNavigator extends StatelessWidget {
  const _HeaderDateNavigator({
    required this.date,
    required this.textTheme,
    required this.onPrevious,
    required this.onNext,
  });

  final DateTime date;
  final TextTheme textTheme;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final monthName = IndoDateTimeX.bulan[date.month - 1];
    final formatted = '${date.day} $monthName ${date.year}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _HeaderDateArrowButton(
          quarterTurns: 2,
          onTap: onPrevious,
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formatted,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleMedium?.copyWith(
                  color: ColorPalette.kWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date.hijriDateId(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  color: ColorPalette.kWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        _HeaderDateArrowButton(
          onTap: onNext,
        ),
      ],
    );
  }
}

class _HeaderDateArrowButton extends StatelessWidget {
  const _HeaderDateArrowButton({required this.onTap, this.quarterTurns = 0});

  final VoidCallback onTap;
  final int quarterTurns;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 48,
      decoration: BoxDecoration(
        color: ColorPalette.kWhite.withValues(alpha: 0.38),
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
              ColorPalette.kWhite,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _CelestialPosition {
  const _CelestialPosition({
    required this.top,
    required this.size,
  });

  final double top;
  final double size;
}

class _CloudPosition {
  const _CloudPosition({
    required this.left,
    required this.leftTop,
    required this.right,
    required this.rightTop,
  });

  final double left;
  final double leftTop;
  final double right;
  final double rightTop;
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.textTheme,
    required this.date,
    required this.onCompassTap,
    required this.onLocationTap,
  });

  final TextTheme textTheme;
  final DateTime date;
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
              spacing: 14,
              children: [
                _InfoChip(
                  icon: AppIcons.compass3Line,
                  onTap: onCompassTap,
                ),
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
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 90),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: ColorPalette.contentSecondary,
                fontWeight: FontWeight.w500,
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
