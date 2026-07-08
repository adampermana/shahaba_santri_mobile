import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/domains/quran/chapter.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/domains/quran/translations/id_indonesian_islamic_affairs_ministry.dart';
import 'package:sahaba_mobile/domains/quran/transliteration.dart';
import 'package:sahaba_mobile/domains/quran/verses/indopak.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/juz_card.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/quran_search_bar.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/surah_card.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class SearchQuranArgs {
  const SearchQuranArgs({required this.surahs, required this.juzList});

  final List<SurahModel> surahs;
  final List<JuzModel> juzList;
}

class SearchQuranScreen extends StatefulWidget {
  const SearchQuranScreen({required this.args, super.key});

  final SearchQuranArgs args;

  @override
  State<SearchQuranScreen> createState() => _SearchQuranScreenState();
}

class _SearchQuranScreenState extends State<SearchQuranScreen> {
  final _controller = TextEditingController();
  var _query = '';
  var _verseResults = <QuranVerseModel>[];
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() => _query = value.trim());
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 180), () {
      if (!mounted) return;
      setState(() => _verseResults = _searchVerses(_query));
    });
  }

  @override
  Widget build(BuildContext context) {
    final surahs = _filterSurahs(widget.args.surahs, _query);
    final juzList = _filterJuz(widget.args.juzList, _query);
    final hasQuery = _query.isNotEmpty;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorPalette.kWhite,
      appBar: _buildAppBar(context, textTheme),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: QuranSearchBar(
              controller: _controller,
              // autofocus: true,
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: hasQuery
                ? _SearchResultList(
                    query: _query,
                    surahs: surahs,
                    juzList: juzList,
                    allSurahs: widget.args.surahs,
                    allJuz: widget.args.juzList,
                    verses: _verseResults,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    TextTheme textTheme,
  ) {
    return CustomAppBar.buildAppBarSimple(
      backgroundColor: ColorPalette.scaffoldBackgroundAppBar,
      elevation: 0,
      leadingWidth: 0,
      leading: const SizedBox.shrink(),
      titleWidget: Text(
        'Pencarian',
        style: textTheme.titleLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorPalette.contentSecondary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            AppIcons.closeLine,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              ColorPalette.kBlack,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchResultList extends StatelessWidget {
  const _SearchResultList({
    required this.query,
    required this.surahs,
    required this.juzList,
    required this.allSurahs,
    required this.allJuz,
    required this.verses,
  });

  final String query;
  final List<SurahModel> surahs;
  final List<JuzModel> juzList;
  final List<SurahModel> allSurahs;
  final List<JuzModel> allJuz;
  final List<QuranVerseModel> verses;

  @override
  Widget build(BuildContext context) {
    final groupedVerses = _groupVerses(verses);
    final hasResult =
        surahs.isNotEmpty || juzList.isNotEmpty || verses.isNotEmpty;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
      children: [
        if (!hasResult)
          _resultTitle(context)
        else ...[
          _resultTitle(context),
          const SizedBox(height: 28),
          if (surahs.isNotEmpty) ...[
            _sectionTitle(context, 'Surah'),
            const SizedBox(height: 12),
            ...surahs.map(
              (surah) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SurahCard(
                  surah: surah,
                  onTap: () => _openSurah(context, surah),
                ),
              ),
            ),
          ],
          if (juzList.isNotEmpty) ...[
            if (surahs.isNotEmpty) const _SectionDivider(),
            _sectionTitle(context, 'Juz'),
            const SizedBox(height: 12),
            ...juzList.map(
              (juz) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: JuzCard(
                  juz: juz,
                  onTap: () => _openJuz(context, juz),
                ),
              ),
            ),
          ],
          if (groupedVerses.isNotEmpty) ...[
            if (surahs.isNotEmpty || juzList.isNotEmpty)
              const _SectionDivider(),
            _sectionTitle(context, 'Ayat'),
            const SizedBox(height: 12),
            ...groupedVerses.map(
              (group) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _VerseResultCard(
                  query: query,
                  group: group,
                  allSurahs: allSurahs,
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }

  Widget _resultTitle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text.rich(
      TextSpan(
        text: 'Hasil pencarian ',
        children: [
          TextSpan(
            text: query,
            style: const TextStyle(
              color: ColorPalette.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      style: textTheme.labelMedium?.copyWith(
        color: ColorPalette.kBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.6,
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: ColorPalette.contentTertiary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.6,
      ),
    );
  }

  void _openSurah(BuildContext context, SurahModel surah) {
    unawaited(
      context.push(
        '${RouterPath.mainPath}/${RouterPath.quranPath}/'
        '${RouterPath.detailQuranPath}',
        extra: QuranDetailArgs.surah(surah, allSurahs: allSurahs),
      ),
    );
  }

  void _openJuz(BuildContext context, JuzModel juz) {
    unawaited(
      context.push(
        '${RouterPath.mainPath}/${RouterPath.quranPath}/'
        '${RouterPath.detailQuranPath}',
        extra: QuranDetailArgs.juz(juz, allJuz: allJuz),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 36),
      child: Divider(height: 1, color: ColorPalette.borderTransparent),
    );
  }
}

class _VerseResultCard extends StatefulWidget {
  const _VerseResultCard({
    required this.query,
    required this.group,
    required this.allSurahs,
  });

  final String query;
  final _VerseGroup group;
  final List<SurahModel> allSurahs;

  @override
  State<_VerseResultCard> createState() => _VerseResultCardState();
}

class _VerseResultCardState extends State<_VerseResultCard> {
  var _expanded = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final firstVerse = widget.group.verses.first;
    final surahIndex =
        int.tryParse(firstVerse.surahIndex) ?? firstVerse.surahIndex;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorPalette.kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 2),
          BoxShadow(color: Color(0x12000000), blurRadius: 4),
          BoxShadow(color: Color(0x0A000000), blurRadius: 5),
          BoxShadow(color: Color(0x03000000), blurRadius: 6),
          BoxShadow(
            color: Color(0x00000000),
            blurRadius: 6,
            offset: Offset(1, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => setState(() => _expanded = !_expanded),
            child: Row(
              children: [
                Text(
                  '$surahIndex',
                  style: const TextStyle(
                    color: ColorPalette.primaryColor,
                    fontSize: 40,
                    fontFamily: 'Synonym Variable',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstVerse.surahName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${widget.group.verses.length} ayat ditemukan',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelSmall?.copyWith(
                          color: ColorPalette.contentTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
                RotatedBox(
                  quarterTurns: _expanded ? 2 : 0,
                  child: SvgPicture.asset(
                    AppIcons.arrowDropDownLine,
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
          if (_expanded) ...[
            const SizedBox(height: 16),
            ...widget.group.verses.map(
              (verse) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _VerseResultItem(
                  query: widget.query,
                  verse: verse,
                  onTap: () => _openVerse(context, verse),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _openVerse(BuildContext context, QuranVerseModel verse) {
    final surah = _surahForVerse(verse);
    if (surah == null) return;

    unawaited(
      context.push(
        '${RouterPath.mainPath}/${RouterPath.quranPath}/'
        '${RouterPath.detailQuranPath}',
        extra: QuranDetailArgs.surah(
          surah,
          allSurahs: widget.allSurahs,
          initialVerseNumber: verse.verseNumber,
        ),
      ),
    );
  }

  SurahModel? _surahForVerse(QuranVerseModel verse) {
    final verseSurahIndex = int.tryParse(verse.surahIndex);
    for (final surah in widget.allSurahs) {
      if (int.tryParse(surah.index ?? '') == verseSurahIndex) return surah;
    }
    return null;
  }
}

class _VerseResultItem extends StatelessWidget {
  const _VerseResultItem({
    required this.query,
    required this.verse,
    required this.onTap,
  });

  final String query;
  final QuranVerseModel verse;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${verse.verseNumber}.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorPalette.contentSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text.rich(
              _highlight(verse.translation, query),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorPalette.contentSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

typedef _VerseGroup = ({String surahIndex, List<QuranVerseModel> verses});

List<_VerseGroup> _groupVerses(List<QuranVerseModel> verses) {
  final groups = <_VerseGroup>[];
  for (final verse in verses) {
    if (groups.isEmpty || groups.last.surahIndex != verse.surahIndex) {
      groups.add((surahIndex: verse.surahIndex, verses: [verse]));
    } else {
      groups.last.verses.add(verse);
    }
  }
  return groups;
}

List<SurahModel> _filterSurahs(List<SurahModel> surahs, String query) {
  if (query.isEmpty) return const [];
  final lower = query.toLowerCase();
  return surahs
      .where((surah) {
        final index = '${int.tryParse(surah.index ?? '') ?? surah.index}';
        return index == query ||
            (surah.title?.toLowerCase().contains(lower) ?? false) ||
            (surah.titleAr?.contains(query) ?? false);
      })
      .take(3)
      .toList();
}

List<JuzModel> _filterJuz(List<JuzModel> juzList, String query) {
  if (query.isEmpty) return const [];
  final lower = query.toLowerCase();
  return juzList
      .where((juz) {
        return juz.index == query ||
            'juz ${juz.index}'.contains(lower) ||
            (juz.start?.name?.toLowerCase().contains(lower) ?? false);
      })
      .take(3)
      .toList();
}

List<QuranVerseModel> _searchVerses(String query) {
  if (query.isEmpty) return const [];
  final lower = query.toLowerCase();
  final translationByKey = {
    for (final translation in idIndonesianIslamicAffairsMinistry)
      translation.verseKey: translation,
  };
  final transliterationByKey = {
    for (final transliteration in transliterations)
      transliteration.id: transliteration,
  };
  final chapterById = {for (final chapter in chapters) chapter.id: chapter};

  return versesIndopak
      .where((verse) {
        final translation = translationByKey[verse.verseKey]?.text ?? '';
        final transliteration =
            transliterationByKey[verse.verseKey]?.text ?? '';
        return translation.toLowerCase().contains(lower) ||
            transliteration.toLowerCase().contains(lower) ||
            verse.verseKey == query;
      })
      .map((verse) {
        final chapter = chapterById[verse.chapterID]!;
        return QuranVerseModel(
          surahIndex: verse.chapterID.toString().padLeft(3, '0'),
          surahName: chapter.nameComplex,
          surahNameAr: chapter.nameArabic,
          verseNumber: _verseNumberFromKey(verse.verseKey),
          verseKey: verse.verseKey,
          arabic: _stripUnsupportedArabicMarks(verse.text),
          transliteration: _stripHtml(
            transliterationByKey[verse.verseKey]?.text ?? '',
          ),
          translation: _stripHtml(translationByKey[verse.verseKey]?.text ?? ''),
        );
      })
      .take(30)
      .toList();
}

TextSpan _highlight(String text, String query) {
  if (query.isEmpty) return TextSpan(text: text);
  final lowerText = text.toLowerCase();
  final lowerQuery = query.toLowerCase();
  final spans = <TextSpan>[];
  var start = 0;

  while (true) {
    final index = lowerText.indexOf(lowerQuery, start);
    if (index < 0) break;
    if (index > start) spans.add(TextSpan(text: text.substring(start, index)));
    spans.add(
      TextSpan(
        text: text.substring(index, index + query.length),
        style: const TextStyle(
          color: ColorPalette.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    start = index + query.length;
  }

  if (start < text.length) spans.add(TextSpan(text: text.substring(start)));
  return TextSpan(children: spans);
}

int _verseNumberFromKey(String verseKey) {
  final parts = verseKey.split(':');
  if (parts.length != 2) return 1;
  return int.tryParse(parts[1]) ?? 1;
}

String _stripUnsupportedArabicMarks(String text) {
  return text.replaceAll(RegExp('[-]'), '');
}

String _stripHtml(String text) {
  return text
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&#34;', '"')
      .replaceAll('&#39;', "'")
      .replaceAll('&amp;', '&')
      .replaceAll(RegExp('<sup foot_note=[^>]*>.*?</sup>'), '')
      .replaceAll(RegExp('<[^>]*>'), '')
      .trim();
}
