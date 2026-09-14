import 'dart:async';
import 'dart:ui';

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
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/infrastructure/extension/datetime_extension.dart';
import 'package:sahaba_mobile/infrastructure/services/adzan_service.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/card_jadwal_sholat.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/prayer_landscape.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/prayer_time_tile.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/streak_indicator.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';
import 'package:sahaba_mobile/presentation/widgets/widget_info_schip.dart';

const double _tabletBreakpoint = 600;
const double _scheduleContentMaxWidth = 560;

double _horizontalPaddingFor(double width) =>
    width >= _tabletBreakpoint ? 24 : 16;

class JadwalSholatScreen extends StatelessWidget {
  const JadwalSholatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final cubit = sl<LocationCubit>();
            unawaited(cubit.loadSavedCity());
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) => sl<PrayerScheduleCubit>(),
        ),
        BlocProvider.value(value: sl<StreakCubit>()),
      ],
      child: BlocListener<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is LocationLoaded) {
            final cityId = state.city.id;
            if (cityId != null) {
              final now = DateTime.now();
              unawaited(
                context.read<PrayerScheduleCubit>().loadSchedule(cityId, now),
              );
              unawaited(context.read<StreakCubit>().loadStreak(now));
            }
          }
        },
        child: BlocBuilder<PrayerScheduleCubit, PrayerScheduleState>(
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
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.message,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 16),
                                SubmitButtonStylesWidget(
                                  textButton: 'Coba Lagi',
                                  height: 50,
                                  textButtonColor: ColorPalette.kWhite,
                                  primaryColor: ColorPalette.primaryColor,
                                  style: SubmitButtonStyle.elevated,
                                  onPressed: () => _reload(context),
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
        ),
      ),
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
  Widget build(
    BuildContext context,
  ) {
    final textTheme = Theme.of(context).textTheme;

    final prayer = widget.state.nextPrayer ?? WaktuSholat.subuh;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final horizontalPadding = _horizontalPaddingFor(width);

        return SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: PrayerLandscape.heightFor(width),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  child: PrayerLandscape(key: ValueKey(prayer), prayer: prayer),
                ),
              ),
              Column(
                children: [
                  _NextPrayerCard(
                    nextPrayer: prayer,
                    schedule: _isFutureDate(widget.state.date)
                        ? (widget.state.todaySchedule ?? widget.schedule)
                        : widget.schedule,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      32,
                      horizontalPadding,
                      24 + MediaQuery.paddingOf(context).bottom,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x330F172A), ColorPalette.background],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: _scheduleContentMaxWidth,
                        ),
                        child: Column(
                          children: [
                            _HeaderDateNavigator(
                              date: widget.state.date,
                              textTheme: textTheme,
                              onPrevious: widget.onPrevious,
                              onNext: widget.onNext,
                            ),
                            const SizedBox(height: 32),
                            _InfoRow(
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
                            const SizedBox(height: 16),
                            for (
                              var index = 0;
                              index < _prayers.length;
                              index++
                            )
                              _buildPrayerTile(context, index),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPrayerTile(BuildContext context, int index) {
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
    final isCurrentDay = !isPastDay && !isFutureDay;

    // Checkbox: cuma bisa dicentang untuk prayer yang sedang aktif
    final canCheck = isCurrentDay && isActive;

    // Volume: bisa di-toggle untuk semua prayer di hari ini,
    // gak peduli isActive atau bukan
    final canToggleVolume = isCurrentDay;

    return PrayerTimeTile(
      icon: item.icon,
      name: item.name,
      time: _formatTime(time),
      isActive: isActive,
      isChecked: isChecked,
      isHistory: isPastDay || (!isFutureDay && !isActive),
      isEnabled: canToggleVolume,
      showCheckbox: item.showCheckbox,
      showVolume: item.showVolume,
      isVolumeMuted: item.showVolume && !_isAdzanEnabled(item.name),
      onVolumeTap: canToggleVolume && item.showVolume
          ? () => _onVolumeTap(context, item)
          : null,
      onCheck: canCheck ? () => _onCheck(context, item.name, time) : null,
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
      locationName: _locationName(context),
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
      locationName: _locationName(context),
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

  String _locationName(BuildContext context) {
    final responseLocation = widget.state.response.lokasi?.trim();
    if (responseLocation != null && responseLocation.isNotEmpty) {
      return responseLocation;
    }

    final locationState = context.read<LocationCubit>().state;
    if (locationState is LocationLoaded) {
      final cityLocation = locationState.city.lokasi?.trim();
      if (cityLocation != null && cityLocation.isNotEmpty) {
        return cityLocation;
      }
    }

    return 'Anda';
  }

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
  const _NextPrayerCard({required this.nextPrayer, required this.schedule});

  final WaktuSholat nextPrayer;
  final PrayerScheduleModel? schedule;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final time =
        schedule?.getTimeByPrayerName(nextPrayer.label.toLowerCase()) ??
        nextPrayer.time;
    final formattedTime = time
        .split(':')
        .map((part) => part.trim())
        .join(' : ');

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final scale = PrayerLandscape.scaleFor(width);
        final horizontalPadding = width >= _tabletBreakpoint ? 24.0 : 8.0;

        return SizedBox(
          height: 314 * scale,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.paddingOf(context).top + 4,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: _scheduleContentMaxWidth,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            tooltip: 'Kembali',
                            onPressed: () => context.pop(),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            padding: const EdgeInsets.all(8),
                            icon: SvgPicture.asset(
                              AppIcons.arrowLeftLine,
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                ColorPalette.kWhite,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          Text(
                            'Jadwal Salat',
                            style: textTheme.bodyMedium?.copyWith(
                              color: ColorPalette.kWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 143 * scale,
                left: 16,
                right: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      nextPrayer.label,
                      style: textTheme.titleLarge?.copyWith(
                        color: ColorPalette.kWhite,
                        fontSize: 20,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      formattedTime,
                      style: textTheme.displayLarge?.copyWith(
                        color: ColorPalette.kWhite,
                        fontSize: 48,
                        height: 1.1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
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
  const _HeaderDateArrowButton({
    required this.onTap,
    this.quarterTurns = 0,
  });

  final VoidCallback onTap;
  final int quarterTurns;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(
      Radius.circular(24),
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius,
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.16),
                borderRadius: borderRadius,
                border: Border.all(
                  color: Colors.white,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.12),
                    blurRadius: 2,
                    offset: const Offset(-1, -1),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: RotatedBox(
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
          ),
        ),
      ),
    );
  }
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
            const SizedBox(width: 12),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  InfoChip(
                    text: 'Kiblat',
                    icon: AppIcons.compass3Line,
                    onTap: onCompassTap,
                  ),
                  Flexible(
                    child: _LocationChip(
                      label: location,
                      onTap: onLocationTap,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LocationChip extends StatelessWidget {
  const _LocationChip({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final maxLabelWidth = MediaQuery.sizeOf(context).width >= _tabletBreakpoint
        ? 220.0
        : 120.0;

    const borderRadius = BorderRadius.all(
      Radius.circular(24),
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.16),
                borderRadius: borderRadius,
                border: Border.all(
                  color: Colors.white,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.12),
                    blurRadius: 2,
                    offset: const Offset(-1, -1),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppIcons.mapPin2Line,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      ColorPalette.kWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: maxLabelWidth,
                      ),
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          color: ColorPalette.kWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    AppIcons.arrowDropDownLine,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      ColorPalette.kWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
