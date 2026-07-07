import 'package:sahaba_mobile/domains/quran/chapter.dart';
import 'package:sahaba_mobile/domains/quran/juz.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/domains/quran/translations/id_indonesian_islamic_affairs_ministry.dart';
import 'package:sahaba_mobile/domains/quran/transliteration.dart';
import 'package:sahaba_mobile/domains/quran/types.dart';
import 'package:sahaba_mobile/domains/quran/verses/indopak.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/i_quran_local_datasource.dart';

class QuranLocalDatasource implements IQuranLocalDatasource {
  @override
  Future<List<SurahModel>> getAllSurahs() async {
    return chapters.map(_chapterToSurah).toList();
  }

  @override
  Future<List<JuzModel>> getAllJuz() async {
    final surahs = await getAllSurahs();
    return juzs.map((juz) => _juzToModel(juz, surahs)).toList();
  }

  @override
  Future<QuranDetailModel> getSurahDetail(SurahModel surah) async {
    final surahIndex = _requiredIndex(surah.index);
    final verses = _loadVersesForSurah(
      surah: surah,
      startVerse: 1,
      endVerse: surah.count ?? 0,
    );

    return QuranDetailModel(
      type: QuranDetailType.surah,
      title: surah.title ?? 'Surah $surahIndex',
      titleAr: surah.titleAr,
      subtitle: '${surah.type ?? '-'} • ${surah.count ?? 0} Ayat',
      verses: verses,
    );
  }

  @override
  Future<QuranDetailModel> getJuzDetail(JuzModel juz) async {
    final juzIndex = int.tryParse(juz.index ?? '') ?? 0;
    final juzVerses = versesIndopak.where((v) => v.juzNumber == juzIndex);

    return QuranDetailModel(
      type: QuranDetailType.juz,
      title: 'Juz $juzIndex',
      subtitle:
          '${juz.start?.name ?? '-'} ${_verseNumber(juz.start?.verse)}'
          ' - ${juz.end?.name ?? '-'} ${_verseNumber(juz.end?.verse)}',
      verses: juzVerses.map(_verseToDetail).toList(),
    );
  }

  SurahModel _chapterToSurah(Chapter chapter) {
    return SurahModel(
      place: chapter.revelationPlace.name,
      type: chapter.revelationPlace.name,
      count: chapter.versesCount,
      title: chapter.nameComplex,
      titleAr: chapter.nameArabic,
      index: _paddedIndex(chapter.id),
      pages: '${chapter.pages.first}-${chapter.pages.last}',
      juz: juzs
          .where((juz) => juz.verse.items.containsKey('${chapter.id}'))
          .map(
            (juz) => SurahJuz(
              index: '${juz.number}',
              verse: _surahJuzVerse(juz, chapter.id),
            ),
          )
          .toList(),
    );
  }

  JuzModel _juzToModel(Juz juz, List<SurahModel> surahs) {
    final verses = versesIndopak
        .where((v) => v.juzNumber == juz.number)
        .toList();
    final first = verses.first;
    final last = verses.last;

    return JuzModel(
      index: '${juz.number}',
      start: _juzEndpoint(first, surahs),
      end: _juzEndpoint(last, surahs),
    );
  }

  JuzEndpoint _juzEndpoint(Verse verse, List<SurahModel> surahs) {
    final surahIndex = _paddedIndex(verse.chapterID);
    final surah = surahs.firstWhere(
      (item) => item.index == surahIndex,
      orElse: () => SurahModel(index: surahIndex),
    );

    return JuzEndpoint(
      index: surahIndex,
      verse: 'verse_${_verseNumberFromKey(verse.verseKey)}',
      name: surah.title,
    );
  }

  SurahJuzVerse _surahJuzVerse(Juz juz, int chapterId) {
    final range = juz.verse.items['$chapterId'] ?? '';
    final parts = range.split('-');
    return SurahJuzVerse(
      start: parts.isEmpty ? null : 'verse_${parts.first}',
      end: parts.length < 2 ? null : 'verse_${parts.last}',
    );
  }

  List<QuranVerseModel> _loadVersesForSurah({
    required SurahModel surah,
    required int startVerse,
    required int endVerse,
  }) {
    final surahNumber = int.parse(_requiredIndex(surah.index));
    return versesIndopak
        .where(
          (verse) =>
              verse.chapterID == surahNumber &&
              _verseNumberFromKey(verse.verseKey) >= startVerse &&
              _verseNumberFromKey(verse.verseKey) <= endVerse,
        )
        .map(_verseToDetail)
        .toList();
  }

  QuranVerseModel _verseToDetail(Verse verse) {
    final chapter = chapters.firstWhere((item) => item.id == verse.chapterID);
    final translation = idIndonesianIslamicAffairsMinistry.firstWhere(
      (item) => item.verseKey == verse.verseKey,
      orElse: () => VerseTranslation(verseKey: verse.verseKey),
    );
    final transliteration = transliterations.firstWhere(
      (item) => item.id == verse.verseKey,
      orElse: () => Transliteration(id: verse.verseKey),
    );

    return QuranVerseModel(
      surahIndex: _paddedIndex(verse.chapterID),
      surahName: chapter.nameComplex,
      surahNameAr: chapter.nameArabic,
      verseNumber: _verseNumberFromKey(verse.verseKey),
      verseKey: verse.verseKey,
      arabic: _stripUnsupportedArabicMarks(verse.text),
      transliteration: _stripHtml(transliteration.text).toLowerCase(),
      translation: _stripHtml(translation.text),
    );
  }

  String _requiredIndex(String? index) {
    final value = index?.trim();
    if (value == null || value.isEmpty) {
      throw const FormatException('Index Quran tidak valid');
    }
    return value;
  }

  int _verseNumber(String? verseKey) {
    final parts = verseKey?.split('_') ?? const <String>[];
    if (parts.length != 2) return 1;
    return int.tryParse(parts[1]) ?? 1;
  }

  int _verseNumberFromKey(String verseKey) {
    final parts = verseKey.split(':');
    if (parts.length != 2) return 1;
    return int.tryParse(parts[1]) ?? 1;
  }

  String _paddedIndex(int index) => index.toString().padLeft(3, '0');

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
}
