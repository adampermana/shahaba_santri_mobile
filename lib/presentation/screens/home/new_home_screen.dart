import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_state.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_state.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_cubit.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_state.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  static const double _maxCarouselHeight = 200;
  static const double _minCarouselHeight = 110;
  static const double _cardOverlap =
      30; // overlap card ke carousel saat masih expanded
  static const double _contentTopGap =
      40; // jarak tambahan di atas konten, biar nggak terlalu nempel

  // static const double _bottomSafeSpace = 110;

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    final bottomInset = MediaQuery.of(context).padding.bottom;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _CarouselHeaderDelegate(
            maxHeight: _maxCarouselHeight,
            minHeight: _minCarouselHeight,
            builder: _buildCarousel,
          ),
        ),
        SliverToBoxAdapter(
          child: Transform.translate(
            offset: const Offset(0, -_cardOverlap + _contentTopGap),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildJadwalSholat(context),
                  _featureSection(
                    context,
                    onQiblatTap: () => context.push(
                      '$currentLocation/${RouterPath.qiblaPath}',
                    ),
                    onJadwalSolatTap: () => context.push(
                      '$currentLocation/${RouterPath.jadwalSholatPath}',
                    ),
                    onKalendarTap: () => context.push(
                      '$currentLocation/${RouterPath.calendarPath}',
                    ),
                    onProdukHalalTap: () => context.push(
                      '$currentLocation/${RouterPath.productHalalPath}',
                    ),
                    // onKisahTap: () => context.push(
                    //   '$currentLocation/${RouterPath.calendarPath}',
                    // ),
                  ),
                  _buildContinueReading(context),
                  _buildBeritaIslam(context),
                  SizedBox(height: bottomInset),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarousel(
    BuildContext context,
    double height,
    double shrinkProgress,
  ) {
    // TODO: Replace with actual carousel data source
    const hasContent = true;
    const title = 'Pasang Iklan Sekarang';
    const currentIndex = 0;
    const totalItems = 5;

    final fadeOpacity = (1 - (shrinkProgress / 0.6)).clamp(0.0, 1.0);

    return Container(
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        image: DecorationImage(
          image: AssetImage(
            hasContent
                ? 'assets/images/empty-carousel.png'
                : 'assets/images/empty-carousel.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.1),
                  Colors.black.withValues(alpha: 0.6),
                ],
                stops: const [0.0, 0.7],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Opacity(
                    opacity: fadeOpacity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(totalItems, (index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 6),
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: index == currentIndex
                                    ? Colors.white
                                    : Colors.white.withValues(alpha: 0.4),
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                // SubmitButtonStylesWidget(
                //   style: SubmitButtonStyle.elevatedGlass,
                //   width: 150,
                //   height: 32,
                //   radius: 24,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 12,
                //     vertical: 6,
                //   ),
                //   textButton: 'Tanya Sahaba',
                //   textStyle: const TextStyle(
                //     color: ColorPalette.kWhite,
                //     fontSize: 12,
                //     fontFamily: 'Synonym Variable',
                //     fontWeight: FontWeight.w600,
                //     height: -0.4,
                //   ),
                //   icon: const CacheImageOrSvg(
                //     source: 'assets/images/icon-images/icon-ai.png',
                //     width: 32,
                //     height: 32,
                //   ),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJadwalSholat(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/motif-batik-jadwal.png'),
          fit: BoxFit.fitWidth,
          isAntiAlias: true,
        ),
        boxShadow: const [
          BoxShadow(color: Color.fromARGB(19, 255, 255, 255), blurRadius: 4),
          BoxShadow(color: Color.fromARGB(17, 255, 255, 255), blurRadius: 6),
        ],
      ),
      child: BlocBuilder<PrayerScheduleCubit, PrayerScheduleState>(
        builder: (context, scheduleState) {
          final schedule = scheduleState is PrayerScheduleLoaded
              ? scheduleState.response.jadwal
              : null;

          final nextPrayer = _resolveNextPrayer(schedule);
          final countdownText = _getCountdownText(nextPrayer);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nextPrayer.label,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      nextPrayer.time,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontFamily: 'Synonym Variable',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white.withValues(alpha: 0.32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      countdownText,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontFamily: 'Synonym Variable',
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _PrayerInfo _resolveNextPrayer(PrayerScheduleModel? schedule) {
    final now = DateTime.now();

    final prayers = [
      const _PrayerInfo(label: 'Subuh', hour: 4, minute: 35),
      const _PrayerInfo(label: 'Terbit', hour: 5, minute: 45),
      const _PrayerInfo(label: 'Dzuhur', hour: 11, minute: 53),
      const _PrayerInfo(label: 'Ashar', hour: 15, minute: 15),
      const _PrayerInfo(label: 'Maghrib', hour: 17, minute: 55),
      const _PrayerInfo(label: 'Isya', hour: 18, minute: 55),
    ];

    for (final prayer in prayers) {
      final scheduledTime = _getScheduledTime(prayer, schedule, now);
      if (scheduledTime.isAfter(now)) {
        return _PrayerInfo(
          label: prayer.label,
          hour: scheduledTime.hour,
          minute: scheduledTime.minute,
        );
      }
    }

    final tomorrow = now.add(const Duration(days: 1));
    final subuhTomorrow = _getScheduledTime(prayers.first, schedule, tomorrow);
    return _PrayerInfo(
      label: prayers.first.label,
      hour: subuhTomorrow.hour,
      minute: subuhTomorrow.minute,
    );
  }

  DateTime _getScheduledTime(
    _PrayerInfo prayer,
    PrayerScheduleModel? schedule,
    DateTime date,
  ) {
    if (schedule != null) {
      final timeStr = _getTimeFromSchedule(
        schedule,
        prayer.label.toLowerCase(),
      );
      if (timeStr != null) {
        final parts = timeStr.split(':');
        if (parts.length == 2) {
          final hour = int.tryParse(parts[0].trim()) ?? prayer.hour;
          final minute = int.tryParse(parts[1].trim()) ?? prayer.minute;
          return DateTime(
            date.year,
            date.month,
            date.day,
            hour,
            minute,
          );
        }
      }
    }
    return DateTime(
      date.year,
      date.month,
      date.day,
      prayer.hour,
      prayer.minute,
    );
  }

  String? _getTimeFromSchedule(
    PrayerScheduleModel schedule,
    String prayerName,
  ) {
    switch (prayerName) {
      case 'subuh':
        return schedule.subuh;
      case 'terbit':
        return schedule.terbit;
      case 'dzuhur':
        return schedule.dzuhur;
      case 'ashar':
        return schedule.ashar;
      case 'maghrib':
        return schedule.maghrib;
      case 'isya':
        return schedule.isya;
      default:
        return null;
    }
  }

  String _getCountdownText(_PrayerInfo nextPrayer) {
    final now = DateTime.now();
    final scheduledTime = DateTime(
      now.year,
      now.month,
      now.day,
      nextPrayer.hour,
      nextPrayer.minute,
    );

    var targetTime = scheduledTime;
    if (scheduledTime.isBefore(now) || scheduledTime.isAtSameMomentAs(now)) {
      targetTime = scheduledTime.add(const Duration(days: 1));
    }

    final remaining = targetTime.difference(now);
    if (remaining.inSeconds <= 0) return 'Sekarang';

    final totalMinutes = (remaining.inSeconds / 60).ceil();
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return 'Dalam $hours Jam $minutes Menit';
    }

    if (hours > 0) return 'Dalam $hours Jam';
    return 'Dalam $minutes Menit';
  }
}

class _PrayerInfo {
  const _PrayerInfo({
    required this.label,
    required this.hour,
    required this.minute,
  });

  final String label;
  final int hour;
  final int minute;

  String get time {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}

Widget _buildContinueReading(BuildContext context) {
  SurahModel? findSurah(List<SurahModel> surahs, String? index) {
    if (index == null) return null;
    for (final surah in surahs) {
      if (surah.index == index) return surah;
    }
    return null;
  }

  JuzModel? findJuz(List<JuzModel> juzList, String? index) {
    if (index == null) return null;
    for (final juz in juzList) {
      if (juz.index == index) return juz;
    }
    return null;
  }

  return BlocBuilder<LastReadCubit, LastReadState>(
    builder: (context, lastReadState) {
      final lastRead = lastReadState is LastReadLoaded
          ? lastReadState.lastRead
          : null;
      final verse = lastRead?.verse;
      return BlocBuilder<QuranBloc, QuranState>(
        builder: (context, quranState) {
          return _ContinueReadingContent(
            lastRead: lastRead,
            surah: findSurah(quranState.surahs, verse?.surahIndex),
            juz: findJuz(quranState.juzList, lastRead?.juzIndex),
          );
        },
      );
    },
  );
}

Widget _featureSection(
  BuildContext context, {
  VoidCallback? onQiblatTap,
  VoidCallback? onJadwalSolatTap,
  VoidCallback? onKalendarTap,
  VoidCallback? onProdukHalalTap,
  VoidCallback? onKisahTap,
}) {
  final textTheme = Theme.of(context).textTheme;

  final items = [
    {
      'label': 'Kiblat',
      'icon': 'assets/images/icon-images/icon-kabah.png',
      'iconRatio': 0.78,
      'onTap': onQiblatTap,
    },
    {
      'label': 'Jadwal Solat',
      'icon': 'assets/images/icon-images/icon-jadwal-sholat.png',
      'iconRatio': 0.85,
      'onTap': onJadwalSolatTap,
      'badgeType': 'fire',
    },
    {
      'label': 'Kalendar',
      'icon': 'assets/images/icon-images/icon-kalendar.png',
      'iconRatio': 0.75,
      'onTap': onKalendarTap,
    },
    {
      'label': 'Produk Halal',
      'icon': 'assets/images/icon-images/produk-halal.png',
      'iconRatio': 0.9,
      'onTap': onProdukHalalTap,
      'badgeType': 'ai',
    },
    // {
    //   'label': 'Kisah',
    //   'icon': 'assets/images/icon-images/icon-kisah.png',
    //   'iconRatio': 0.9,
    //   'onTap': onKisahTap,
    // },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Fitur kami',
        style: textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.75,
        ),
      ),
      const SizedBox(height: 8),
      LayoutBuilder(
        builder: (context, constraints) {
          final itemCount = items.length;
          final rawItemWidth = constraints.maxWidth / itemCount;
          final boxSize = (rawItemWidth * 0.72).clamp(44.0, 64.0);
          final badgeSize = (boxSize * 0.4).clamp(18.0, 26.0);
          final labelFontSize = (boxSize * 0.21).clamp(10.5, 13.0);

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              final label = item['label']! as String;
              final iconPath = item['icon']! as String;
              final iconRatio = item['iconRatio']! as double;
              final onTap = item['onTap'] as VoidCallback?;
              final badgeType = item['badgeType'] as String?;
              final iconSize = boxSize * iconRatio;

              return Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(14),
                    splashColor: Colors.white.withValues(alpha: 0.06),
                    highlightColor: Colors.white.withValues(alpha: 0.04),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: boxSize + 10,
                            height: boxSize + 6,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/motif-menu.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: RadialGradient(
                                      radius: 0.72,
                                      colors: [
                                        Colors.white.withValues(alpha: 0.32),
                                        Colors.white.withValues(alpha: 0.08),
                                        Colors.transparent,
                                      ],
                                      stops: const [0, 0.48, 1],
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      iconPath,
                                      width: iconSize,
                                      height: iconSize,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                if (badgeType == 'fire')
                                  Builder(
                                    builder: (context) {
                                      final streakState = context
                                          .watch<StreakCubit>()
                                          .state;
                                      final streakCount =
                                          streakState is StreakLoaded
                                          ? streakState.currentStreak
                                          : 0;
                                      return Positioned(
                                        top: -2,
                                        right: 0,
                                        child: Container(
                                          height: badgeSize,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFDE1135),
                                            borderRadius: BorderRadius.circular(
                                              28,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons
                                                    .local_fire_department_rounded,
                                                color: Colors.white,
                                                size: badgeSize * 0.58,
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                '$streakCount',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: badgeSize * 0.58,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                if (badgeType == 'ai')
                                  Positioned(
                                    top: -2,
                                    right: 0,
                                    child: Container(
                                      width: badgeSize,
                                      height: badgeSize,
                                      padding: EdgeInsets.all(
                                        badgeSize * 0.17,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF670075),
                                        borderRadius: BorderRadius.circular(
                                          28,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: const CacheImageOrSvg(
                                        source:
                                            'assets/images/halal_indonesia.png',
                                        fit: BoxFit.contain,
                                      ),
                                      // Image.asset(
                                      //   'assets/images/icon-images/icon-ai.png',
                                      //   fit: BoxFit.contain,
                                      // ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall?.copyWith(
                              color: const Color(0xFFDDDDDD),
                              fontSize: labelFontSize,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    ],
  );
}

Widget _buildBeritaIslam(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Berita Islami',
            style: textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.75,
            ),
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Text(
          //         'Lihat semua',
          //         style: textTheme.bodySmall?.copyWith(
          //           color: const Color(0xFFB39164),
          //           fontSize: 12,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       const Icon(
          //         Icons.keyboard_arrow_right_outlined,
          //         color: Color(0xFFB39164),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      const SizedBox(height: 16),
      _buildNewsCard(
        context: context,
        imagePath:
            'https://akcdn.detik.net.id/visual/2015/03/31/8c04ef5b-2678-4230-bd4e-b10f20d8e252_169.jpg?w=1200',
        title:
            'Doa Khutbah Jumat oleh Ustadz Ahmad Fauzi: Memohon Rahmat dan Kekuatan',
        date: '14 Jul 2026',
        showViewCount: false,
      ),
      const SizedBox(height: 16),
      _buildNewsCard(
        context: context,
        imagePath:
            'https://serikatnews.com/wp-content/uploads/2022/06/15330053455b5fce219e239.jpg',
        title:
            "Pesan Khutbah Jum'at H. Agus Salim Tahun 1928: Persatuan Lahir dan Batin",
        date: '14 Jul 2026',
        showViewCount: true,
        viewCount: 40,
      ),
    ],
  );
}

Widget _buildNewsCard({
  required BuildContext context,
  required String imagePath,
  required String title,
  required String date,
  required bool showViewCount,
  int viewCount = 0,
}) {
  final textTheme = Theme.of(context).textTheme;

  return InkWell(
    onTap: () {
      unawaited(
        context.push(
          '${RouterPath.mainPath}/${RouterPath.detailNewsPath}',
        ),
      );
    },
    borderRadius: BorderRadius.circular(16),
    splashColor: Colors.white.withValues(alpha: 0.06),
    highlightColor: Colors.white.withValues(alpha: 0.04),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CacheImageOrSvg(source: imagePath),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              color: Color(0xFFDDDDDD),
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              date,
              style: textTheme.bodySmall?.copyWith(
                color: const Color(0xFFDDDDDD),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

/// Delegate untuk carousel yang mengecil (shrink) mengikuti scroll,
/// lalu pinned di [minHeight] setelah full collapse.
class _CarouselHeaderDelegate extends SliverPersistentHeaderDelegate {
  _CarouselHeaderDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final Widget Function(
    BuildContext context,
    double height,
    double shrinkProgress,
  )
  builder;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final currentHeight = (maxHeight - shrinkOffset).clamp(
      minHeight,
      maxHeight,
    );
    final progress = ((maxHeight - currentHeight) / (maxHeight - minHeight))
        .clamp(0.0, 1.0);
    return builder(context, currentHeight, progress);
  }

  @override
  bool shouldRebuild(covariant _CarouselHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}

class _ContinueReadingContent extends StatelessWidget {
  const _ContinueReadingContent({
    required this.lastRead,
    required this.surah,
    required this.juz,
  });

  final QuranLastReadModel? lastRead;
  final SurahModel? surah;
  final JuzModel? juz;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final verse = lastRead?.verse;
    final hasHistory = verse != null;
    final canOpen = lastRead?.type == QuranDetailType.juz
        ? juz != null
        : surah != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lanjutkan baca',
          style: textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: hasHistory
                ? const LinearGradient(
                    begin: Alignment(-0.2, -0.4),
                    end: Alignment(1.1, 1.4),
                    colors: [
                      Color(0xFFB39164),
                      Color(0xFF4A2E15),
                    ],
                  )
                : null,
            color: hasHistory ? null : const Color(0xFF2C3446),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 6,
                offset: Offset(0, 6),
              ),
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 9,
                offset: Offset(0, 14),
              ),
            ],
          ),
          child: hasHistory
              ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -24,
                      top: -20,
                      child: Opacity(
                        opacity: 0.55,
                        child: Image.asset(
                          'assets/images/motif-batik-surah1.png',
                          width: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -30,
                      bottom: -30,
                      child: Opacity(
                        opacity: 0.55,
                        child: Image.asset(
                          'assets/images/motif-batik-surah2.png',
                          width: 170,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      verse.surahName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.headlineSmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Ayat ${verse.verseNumber}',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: Colors.white.withValues(
                                          alpha: 0.85,
                                        ),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: 0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                verse.surahNameAr,
                                textDirection: TextDirection.rtl,
                                style: textTheme.displaySmall?.copyWith(
                                  color: Colors.white,
                                  fontFamily: 'Markazi Text',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: canOpen
                                  ? () => _openLastRead(context)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B8354),
                                foregroundColor: Colors.white,
                                disabledBackgroundColor: Colors.white
                                    .withValues(alpha: 0.25),
                                disabledForegroundColor: Colors.white
                                    .withValues(alpha: 0.6),
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                              child: Text(
                                'Lanjutkan',
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              // ==========================
              // EMPTY STATE
              // ==========================
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 42,
                  ),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.62),
                          fontSize: 16,
                          height: 1.55,
                        ),
                        children: const [
                          TextSpan(
                            text:
                                'Belum ada riwayat. Tap ayat '
                                'Qur’an lalu pilih\n',
                            style: TextStyle(
                              color: Color(
                                0xFFA6A6A6,
                              ) /* semantic-content-inverse-tertiary */,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                            ),
                          ),

                          TextSpan(
                            text: '“Tandai Terakhir Baca”',
                            style: TextStyle(
                              color: Colors
                                  .white /* semantic-content-inverse-primary */,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 1.67,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  void _openLastRead(BuildContext context) {
    final quranState = context.read<QuranBloc>().state;
    final args = lastRead?.type == QuranDetailType.juz
        ? QuranDetailArgs.juz(
            juz!,
            allSurahs: quranState.surahs,
            allJuz: quranState.juzList,
            initialVerseKey: lastRead!.verse.verseKey,
          )
        : QuranDetailArgs.surah(
            surah!,
            allSurahs: quranState.surahs,
            allJuz: quranState.juzList,
            initialVerseNumber: lastRead!.verse.verseNumber,
            initialVerseKey: lastRead!.verse.verseKey,
          );

    unawaited(
      context.push(
        '${RouterPath.mainPath}/${RouterPath.quranPath}/'
        '${RouterPath.detailQuranPath}',
        extra: args,
      ),
    );
  }
}
