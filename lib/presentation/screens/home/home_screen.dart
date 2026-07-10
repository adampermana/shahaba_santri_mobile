import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_state.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_state.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_state.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
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
        ? (locationState.city.lokasi ?? 'Jakarta')
        : 'Jakarta';
    final monthName = IndoDateTimeX.bulan[today.month - 1];

    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackground,
      appBar: CustomAppBar.buildHomeAppBar(
        date: '${today.day} $monthName ${today.year}',
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
        height: 128,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: ColorPalette.kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: -30,
              bottom: 0,
              child: Image.asset(
                'assets/images/motif-short.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: ColorPalette.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            icon,
                            width: 28,
                            height: 28,
                            colorFilter: const ColorFilter.mode(
                              ColorPalette.kWhite,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        AppIcons.arrowDropRightLine,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          ColorPalette.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
              surah: _findSurah(quranState.surahs, verse?.surahIndex),
              juz: _findJuz(quranState.juzList, lastRead?.juzIndex),
            );
          },
        );
      },
    );
  }

  SurahModel? _findSurah(List<SurahModel> surahs, String? index) {
    if (index == null) return null;
    for (final surah in surahs) {
      if (surah.index == index) return surah;
    }
    return null;
  }

  JuzModel? _findJuz(List<JuzModel> juzList, String? index) {
    if (index == null) return null;
    for (final juz in juzList) {
      if (juz.index == index) return juz;
    }
    return null;
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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Background layer — motif behind content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/motif-long.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          // Foreground layer — content on top of motif
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hasHistory ? verse.surahName : 'Belum ada riwayat',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.headlineSmall?.copyWith(
                              color: ColorPalette.kBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            hasHistory
                                ? 'Ayat ${verse.verseNumber}'
                                : 'Tandai ayat terakhir dibaca',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodySmall?.copyWith(
                              color: ColorPalette.contentTertiary,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (hasHistory) ...[
                      const SizedBox(width: 16),
                      Text(
                        verse.surahNameAr,
                        textDirection: TextDirection.rtl,
                        style: textTheme.displaySmall?.copyWith(
                          color: ColorPalette.arabicText,
                          fontFamily: 'Markazi Text',
                          fontSize: 32,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: !hasHistory || !canOpen
                        ? null
                        : () => _openLastRead(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.primaryColor,
                      foregroundColor: ColorPalette.kWhite,
                      disabledBackgroundColor: const Color(
                        0xFFE0E0E0,
                      ),
                      disabledForegroundColor: const Color(
                        0xFF9E9E9E,
                      ),
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
          ),
        ],
      ),
    );
  }

  void _openLastRead(BuildContext context) {
    final quranState = context.read<QuranBloc>().state;
    final args = lastRead?.type == QuranDetailType.juz
        ? QuranDetailArgs.juz(
            juz!,
            allJuz: quranState.juzList,
            initialVerseKey: lastRead!.verse.verseKey,
          )
        : QuranDetailArgs.surah(
            surah!,
            allSurahs: quranState.surahs,
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
