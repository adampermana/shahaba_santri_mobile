import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_state.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
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
                    onProdukHalalTap: () {},
                    //  => context.push(
                    //   '$currentLocation/${RouterPath.calendarPath}',
                    // ),
                    onKisahTap: () => context.push(
                      '$currentLocation/${RouterPath.calendarPath}',
                    ),
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
    const title = 'Hubungan Agama dan Sains';
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
                ? 'assets/images/caraousel.png'
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
                SubmitButtonStylesWidget(
                  style: SubmitButtonStyle.elevated,
                  width: 126,
                  height: 32,
                  textButton: 'Tanya Sahaba',
                  primaryColor: const Color(0xFFDE1135),
                  onPressed: () {},
                ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ashar',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '15:15',
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                  'Dalam  2 Jam 10 Menit',
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
      ),
    );
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
      {
        'label': 'Kisah',
        'icon': 'assets/images/icon-images/icon-kisah.png',
        'iconRatio': 0.9,
        'onTap': onKisahTap,
      },
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
                                    Positioned(
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
                                              '1',
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
                                        child: Image.asset(
                                          'assets/images/icon-images/icon-ai.png',
                                          fit: BoxFit.contain,
                                        ),
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
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Lihat semua',
                    style: textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFB39164),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Color(0xFFB39164),
                  ),
                ],
              ),
            ),
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
              'https://cdns.dream.co.id/resources/news/2018/05/02/83351/664xauto-di-dalam-kabah-ada-emas-minyak-benarkah-180502r.jpg',
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment(-0.2, -0.4),
              end: Alignment(1.1, 1.4),
              colors: [Color(0xFFB39164), Color(0xFF4A2E15)],
            ),
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
          child: Stack(
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
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hasHistory
                                  ? verse.surahName
                                  : 'Belum ada riwayat',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                height: 1.4,
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
                                color: Colors.white.withValues(alpha: 0.85),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 0.6,
                                height: 1.33,
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
                            color: Colors.white,
                            fontFamily: 'Markazi Text',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            height: 1.75,
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
                        backgroundColor: const Color(0xFF1B8354),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Colors.white.withValues(
                          alpha: 0.25,
                        ),
                        disabledForegroundColor: Colors.white.withValues(
                          alpha: 0.6,
                        ),
                        elevation: 1,
                        shadowColor: Colors.black.withValues(alpha: 0.05),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      child: Text(
                        'Lanjutkan',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 0.6,
                          height: 1.33,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
