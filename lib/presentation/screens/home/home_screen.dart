import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_account_bloc/auth_account_bloc.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_state.dart';
import 'package:sahaba_mobile/business_logic/news_bloc/news_bloc.dart';
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
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/search_quran_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/search_bar_widget.dart';

/// Font yang dipakai di project. Di Figma teks memakai Plus Jakarta Sans
/// (label/tombol) + Synonym (judul berita) + Inter (sapaan). Kalau mau ikut
/// Figma 100%, ganti nilai ini setelah font-nya didaftarkan di pubspec.yaml.
const String _fontFamily = 'Satoshi';

/// Token dari Figma (Home 1284:2789) yang belum tentu ada di ColorPalette.
/// Kalau sudah ada padanannya di ColorPalette, ganti dengan token itu.
class _HomeTokens {
  const _HomeTokens._();

  /// primitive/primary
  static const Color primary = Color(0xFF0F172A);

  /// semantic/background/tertiary
  static const Color bgTertiary = Color(0xFFE8E8E8);

  /// semantic/border/transparent
  static const Color borderTransparent = Color(0x14000000);

  /// semantic/content/tertiary
  static const Color contentTertiary = Color(0xFF5E5E5E);

  /// Gradient banner & prayer card
  static const Color tealDark = Color(0xFF09383B);
  static const Color tealLight = Color(0xFF1999A1);

  /// Effect style "below/high"
  static const List<BoxShadow> belowHigh = [
    BoxShadow(color: Color(0x14000000), offset: Offset(0, 2), blurRadius: 4),
    BoxShadow(color: Color(0x12000000), offset: Offset(0, 6), blurRadius: 6),
    BoxShadow(color: Color(0x0A000000), offset: Offset(0, 14), blurRadius: 9),
    BoxShadow(color: Color(0x03000000), offset: Offset(0, 26), blurRadius: 10),
  ];

  /// Effect style "Below / Medium"
  static const List<BoxShadow> belowMedium = [
    BoxShadow(color: Color(0x2B000000), offset: Offset(0, 8), blurRadius: 36),
  ];
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.isActive = true});

  final bool isActive;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _lastPrayerScheduleCityId;
  DateTime? _lastPrayerScheduleDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPrayerScheduleIfReady(context.read<LocationCubit>().state);
  }

  void _loadPrayerScheduleIfReady(LocationState state) {
    if (state is! LocationLoaded) return;

    final cityId = state.city.id;
    if (cityId == null) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (_lastPrayerScheduleCityId == cityId &&
        _lastPrayerScheduleDate == today) {
      return;
    }

    _lastPrayerScheduleCityId = cityId;
    _lastPrayerScheduleDate = today;
    unawaited(
      context.read<PrayerScheduleCubit>().loadSchedule(
        cityId,
        now,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) => _loadPrayerScheduleIfReady(state),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: ColorPalette.scaffoldBackground,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildBannerBackground(),
                  SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          _buildTopBar(context),
                          const SizedBox(height: 16),
                          _buildDynamicTopicBanner(context),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => context.push(
                              '$currentLocation/${RouterPath.jadwalSholatPath}',
                            ),
                            child: _buildJadwalSholat(context),
                          ),
                          const SizedBox(height: 16),
                          _buildMenuHarian(context, currentLocation),
                          const SizedBox(height: 24),
                          _buildKabarHariIni(context, currentLocation),
                          SizedBox(height: bottomInset + 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Banner background
  Widget _buildBannerBackground() {
    return Positioned.fill(
      bottom: 410,
      // height: 273,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, -0.60),
            end: Alignment(0.50, 2),
            colors: [Color(0xFF09383B), Color(0x001898A1)],
          ),
        ),
        child: Stack(
          // hardEdge = overflow-clip di Figma
          children: [
            // Vector 1 (1284:2800) - flip vertikal
            Positioned(
              // top: 101.26,
              top: 98.98,
              right: -10.04,
              // bottom: 10,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: SvgPicture.asset(
                  AppIcons.homeBannerVector1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Vector 2 (1284:2801) - flip vertikal + rotasi -17.3 derajat
            Positioned(
              top: 98.98,
              // left: -89.18,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: SvgPicture.asset(
                  AppIcons.homeBannerVector2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Top bar: search + notification
  Widget _buildTopBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchBarWidget(
            readOnly: true,
            onTap: () => _openSearch(context),
            hintText: 'Cari surah, ayat, atau tafsir apa hari ini?',
            useGlass: true,
          ),
        ),
        const SizedBox(width: 12),
        _buildNotificationButton(),
      ],
    );
  }

  Widget _buildNotificationButton() {
    return SizedBox(
      width: 36,
      height: 36,
      child: Material(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12.6),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.6),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.6),
              border: Border.all(
                color: const Color(0x52E8E8E8),
                width: 0.9,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.homeNotification,
                width: 22.5,
                height: 22.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Dynamic topic banner (sapaan + streak + tombol Tahsin AI)
  Widget _buildDynamicTopicBanner(BuildContext context) {
    return BlocBuilder<AuthAccountBloc, AuthAccountState>(
      builder: (context, authState) {
        final userName = authState.maybeWhen(
          authenticatedUser: (authData, _) {
            final name = authData.name?.trim() ?? '';
            if (name.isNotEmpty) {
              return name.split(' ').first;
            }
            return 'Sahabat';
          },
          authenticatedGuest: (_) => 'Sahabat',
          orElse: () => 'Sahabat',
        );

        return BlocBuilder<StreakCubit, StreakState>(
          builder: (context, streakState) {
            final streakCount = streakState is StreakLoaded
                ? streakState.currentStreak
                : 1;

            return BlocBuilder<LastReadCubit, LastReadState>(
              builder: (context, lastReadState) {
                final lastRead = lastReadState is LastReadLoaded
                    ? lastReadState.lastRead
                    : null;
                final verse = lastRead?.verse;
                final subtitleText = verse != null
                    ? 'Lanjut ngaji ${verse.surahName} '
                          'ayat ${verse.verseNumber}, yuk'
                    : 'Lanjut ngaji Al-Fatihah ayat 7, yuk';

                return Padding(
                  // Figma: konten banner mulai di x = 32 (16 page + 16)
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 22,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0x52E8E8E8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppIcons.homeStreakFlame,
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              ' $streakCount Hari Istiqomah Ngaji',
                              style: const TextStyle(
                                fontFamily: _fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 8,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Assalamu'alaikum, $userName!",
                        style: const TextStyle(
                          fontFamily: _fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          height: 28 / 20,
                          letterSpacing: 1.6,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        subtitleText,
                        style: const TextStyle(
                          fontFamily: _fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          height: 24 / 10,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          boxShadow: _HomeTokens.belowHigh,
                        ),
                        child: Material(
                          color: _HomeTokens.primary,
                          borderRadius: BorderRadius.circular(1000),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(1000),
                            onTap: () => _openLastRead(context),
                            child: Container(
                              height: 32,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Lanjut Tahsin AI',
                                    style: TextStyle(
                                      fontFamily: _fontFamily,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    AppIcons.arrowDropRightLine,
                                    width: 24,
                                    height: 24,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  // Menu Harian
  Widget _buildMenuHarian(BuildContext context, String currentLocation) {
    final streakState = context.watch<StreakCubit>().state;
    final streakCount = streakState is StreakLoaded
        ? streakState.currentStreak
        : 1;

    // Ukuran icon = ukuran frame asli di Figma (bukan ukuran wrapper 56).
    final menuItems = [
      _MenuItem(
        label: 'Al - Quran',
        icon: AppIcons.homeQuran, // Figma 1284:2835 (48 x 48)
        iconWidth: 48,
        iconHeight: 48,
        onTap: () => context.push(
          '${RouterPath.mainPath}/${RouterPath.quranPath}',
        ),
      ),
      _MenuItem(
        label: 'Studio Qur’an',
        icon: AppIcons.homeQiraah, // Figma 1284:2878 (BARU)
        iconWidth: 56,
        iconHeight: 52.12,
        iconDy: 4.06,
        onTap: () => context.push(
          '${RouterPath.mainPath}/${RouterPath.quranPath}',
        ),
      ),
      _MenuItem(
        label: 'Jadwal Salat',
        icon: AppIcons.homeSalat, // Figma 1284:2892 (42 x 42)
        iconWidth: 42,
        iconHeight: 42,
        badgeCount: streakCount,
        onTap: () => context.push(
          '$currentLocation/${RouterPath.jadwalSholatPath}',
        ),
      ),
      _MenuItem(
        label: 'Kalendar',
        icon: AppIcons.homeCalendar, // Figma 1284:2914 (40 x 40)
        iconWidth: 40,
        iconHeight: 40,
        onTap: () => context.push(
          '$currentLocation/${RouterPath.calendarPath}',
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Menu Harian',
          style: TextStyle(
            color: _HomeTokens.primary,
            fontFamily: _fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 28 / 16,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < menuItems.length; i++) ...[
              if (i > 0) const SizedBox(width: 16),
              Expanded(child: _buildMenuHarianItem(menuItems[i])),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildMenuHarianItem(_MenuItem item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Icon Wrapper: 56 x 56, radius 14, bg tertiary
                Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: _HomeTokens.bgTertiary,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: _HomeTokens.borderTransparent),
                  ),
                  child: Transform.translate(
                    offset: Offset(0, item.iconDy),
                    child: SvgPicture.asset(
                      item.icon,
                      width: item.iconWidth,
                      height: item.iconHeight,
                    ),
                  ),
                ),
                if (item.badgeCount != null)
                  Positioned(
                    top: 0,
                    left: -10,
                    child: Container(
                      height: 19,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: ColorPalette.badgeRed, // Figma: #DE1135
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppIcons.homeBadgeFire,
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${item.badgeCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: _fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorPalette.kBlack,
                fontFamily: _fontFamily,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Kabar Hari Ini
  Widget _buildKabarHariIni(BuildContext context, String currentLocation) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, newsState) {
        final newsList = (newsState.newsResponse?.data ?? []).take(3).toList();
        final isLoading = newsState.fetchNewsLoading;

        if (isLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (newsList.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kabar Hari Ini',
                  style: TextStyle(
                    color: ColorPalette.kBlack,
                    fontFamily: _fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 28 / 16,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.push(
                    '$currentLocation/${RouterPath.listAllNewsPath}',
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Cek semuanya',
                        style: TextStyle(
                          color: ColorPalette.mainGreen,
                          fontFamily: _fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 28 / 14,
                        ),
                      ),
                      SvgPicture.asset(
                        AppIcons.homeArrowGreen,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...List.generate(newsList.length, (index) {
              final item = newsList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorPalette.surfaceSecondary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: _HomeTokens.belowHigh,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        unawaited(
                          context.push(
                            '$currentLocation/${RouterPath.detailNewsPath}',
                            extra: item,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar: tinggi 160, radius 16 di semua sudut
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CacheImageOrSvg(
                                source: item.pictureUrl ?? '',
                                width: double.infinity,
                                height: 160,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: _HomeTokens.primary,
                                      fontFamily: _fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 28 / 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        color: _HomeTokens.contentTertiary,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        item.createdAt ?? '',
                                        style: const TextStyle(
                                          color: _HomeTokens.contentTertiary,
                                          fontFamily: _fontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 28 / 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }

  void _openSearch(BuildContext context) {
    final state = context.read<QuranBloc>().state;
    unawaited(
      context.push(
        '${RouterPath.mainPath}/${RouterPath.quranPath}/'
        '${RouterPath.searchQuranPath}',
        extra: SearchQuranArgs(
          surahs: state.surahs,
          juzList: state.juzList,
        ),
      ),
    );
  }

  void _openLastRead(BuildContext context) {
    final lastReadState = context.read<LastReadCubit>().state;
    final lastRead = lastReadState is LastReadLoaded
        ? lastReadState.lastRead
        : null;
    final quranState = context.read<QuranBloc>().state;

    if (lastRead == null) {
      unawaited(
        context.push(
          '${RouterPath.mainPath}/${RouterPath.quranPath}',
        ),
      );
      return;
    }

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

    final surah = findSurah(quranState.surahs, lastRead.verse.surahIndex);
    final juz = findJuz(quranState.juzList, lastRead.juzIndex);

    final args = lastRead.type == QuranDetailType.juz && juz != null
        ? QuranDetailArgs.juz(
            juz,
            allSurahs: quranState.surahs,
            allJuz: quranState.juzList,
            initialVerseKey: lastRead.verse.verseKey,
          )
        : surah != null
        ? QuranDetailArgs.surah(
            surah,
            allSurahs: quranState.surahs,
            allJuz: quranState.juzList,
            initialVerseNumber: lastRead.verse.verseNumber,
            initialVerseKey: lastRead.verse.verseKey,
          )
        : null;

    if (args != null) {
      unawaited(
        context.push(
          '${RouterPath.mainPath}/${RouterPath.quranPath}/'
          '${RouterPath.detailQuranPath}',
          extra: args,
        ),
      );
    } else {
      unawaited(
        context.push(
          '${RouterPath.mainPath}/${RouterPath.quranPath}',
        ),
      );
    }
  }

  // Prayer Time Card
  Widget _buildJadwalSholat(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 95),
        child: Stack(
          children: [
            const Positioned.fill(
              child: CacheImageOrSvg(
                source: 'assets/images/motif-prayer.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: BlocBuilder<PrayerScheduleCubit, PrayerScheduleState>(
                builder: (context, scheduleState) {
                  final loadedState = scheduleState is PrayerScheduleLoaded
                      ? scheduleState
                      : null;
                  final schedule =
                      loadedState?.todaySchedule ??
                      loadedState?.response.jadwal;
                  final nextPrayerLabel =
                      loadedState?.nextPrayer?.label ??
                      _nextPrayerLabelFromActive(
                        loadedState?.activePrayer?.label,
                      );

                  final nextPrayer = _resolvePrayerByLabel(
                    nextPrayerLabel,
                    schedule,
                  );
                  final countdownText = _getCountdownText(nextPrayer);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nextPrayer.label,
                              style: const TextStyle(
                                color: Color(0xFFDDDDDD),
                                fontFamily: _fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              nextPrayer.time,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: _fontFamily,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Text(
                          countdownText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: _fontFamily,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _nextPrayerLabelFromActive(String? activeLabel) {
    switch (activeLabel?.toLowerCase()) {
      case 'subuh':
        return 'Terbit';
      case 'terbit':
        return 'Dzuhur';
      case 'dzuhur':
        return 'Ashar';
      case 'ashar':
        return 'Maghrib';
      case 'maghrib':
        return 'Isya';
      default:
        return 'Subuh';
    }
  }

  _PrayerInfo _resolvePrayerByLabel(
    String label,
    PrayerScheduleModel? schedule,
  ) {
    final fallback = _fallbackPrayerInfo(label);
    final timeStr = schedule == null
        ? null
        : _getTimeFromSchedule(schedule, fallback.label.toLowerCase());

    return _parsePrayerTime(timeStr, fallback);
  }

  _PrayerInfo _fallbackPrayerInfo(String label) {
    switch (label.toLowerCase()) {
      case 'terbit':
        return const _PrayerInfo(label: 'Terbit', hour: 5, minute: 45);
      case 'dzuhur':
        return const _PrayerInfo(label: 'Dzuhur', hour: 11, minute: 53);
      case 'ashar':
        return const _PrayerInfo(label: 'Ashar', hour: 15, minute: 15);
      case 'maghrib':
        return const _PrayerInfo(label: 'Maghrib', hour: 17, minute: 55);
      case 'isya':
        return const _PrayerInfo(label: 'Isya', hour: 18, minute: 55);
      default:
        return const _PrayerInfo(label: 'Subuh', hour: 4, minute: 35);
    }
  }

  _PrayerInfo _parsePrayerTime(String? timeStr, _PrayerInfo fallback) {
    final match = RegExp(r'(\d{1,2})\s*:\s*(\d{1,2})').firstMatch(
      timeStr ?? '',
    );
    if (match == null) return fallback;

    return _PrayerInfo(
      label: fallback.label,
      hour: int.tryParse(match.group(1) ?? '') ?? fallback.hour,
      minute: int.tryParse(match.group(2) ?? '') ?? fallback.minute,
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

    // Figma: "2 jam 10 menit lagi"
    if (hours > 0 && minutes > 0) {
      return '$hours jam $minutes menit lagi';
    }

    if (hours > 0) return '$hours jam lagi';
    return '$minutes menit lagi';
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

  /// Figma: "15 : 15" (ada spasi di sekitar titik dua)
  String get time {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h : $m';
  }
}

class _MenuItem {
  const _MenuItem({
    required this.label,
    required this.icon,
    required this.iconWidth,
    required this.iconHeight,
    required this.onTap,
    this.iconDy = 0,
    this.badgeCount,
  });

  final String label;
  final String icon;
  final double iconWidth;
  final double iconHeight;
  final double iconDy;
  final VoidCallback onTap;
  final int? badgeCount;
}
