import 'dart:convert';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sahaba_mobile/domains/quran/chapter.dart';
import 'package:sahaba_mobile/domains/quran/juz.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/domains/quran/translations/id_indonesian_islamic_affairs_ministry.dart';
import 'package:sahaba_mobile/domains/quran/transliteration.dart';
import 'package:sahaba_mobile/domains/quran/types.dart';
import 'package:sahaba_mobile/domains/quran/verses/uthmani_tajweed.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/i_quran_local_datasource.dart';

class QuranLocalDatasource implements IQuranLocalDatasource {
  static const lastReadBox = 'quran_last_read';
  static const _lastReadKey = 'last_read';

  // ponytail: maps built once on first access; O(1) replaces O(n) firstWhere
  late final Map<String, VerseTranslation> _translationByKey = {
    for (final t in idIndonesianIslamicAffairsMinistry) t.verseKey: t,
  };
  late final Map<String, Transliteration> _transliterationByKey = {
    for (final t in transliterations) t.id: t,
  };
  late final Map<int, Chapter> _chapterById = {
    for (final c in chapters) c.id: c,
  };

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
    final juzVerses = versesUthmaniTajweed.where(
      (v) => v.juzNumber == juzIndex,
    );

    return QuranDetailModel(
      type: QuranDetailType.juz,
      title: 'Juz $juzIndex',
      subtitle:
          '${juz.start?.name ?? '-'} ${_verseNumber(juz.start?.verse)}'
          ' - ${juz.end?.name ?? '-'} ${_verseNumber(juz.end?.verse)}',
      verses: juzVerses.map(_verseToDetail).toList(),
    );
  }

  @override
  Future<void> saveLastRead(QuranLastReadModel lastRead) async {
    await Hive.box<String>(lastReadBox).put(
      _lastReadKey,
      jsonEncode(lastRead.toJson()),
    );
  }

  @override
  Future<QuranLastReadModel?> getLastRead() async {
    final raw = Hive.box<String>(lastReadBox).get(_lastReadKey);
    if (raw == null) return null;
    return QuranLastReadModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
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
    final verses = versesUthmaniTajweed
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
    return versesUthmaniTajweed
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
    final chapter = _chapterById[verse.chapterID]!;
    final translation =
        _translationByKey[verse.verseKey] ??
        VerseTranslation(verseKey: verse.verseKey);
    final transliteration =
        _transliterationByKey[verse.verseKey] ??
        Transliteration(id: verse.verseKey);

    return QuranVerseModel(
      surahIndex: _paddedIndex(verse.chapterID),
      surahName: chapter.nameComplex,
      surahNameAr: chapter.nameArabic,
      verseNumber: _verseNumberFromKey(verse.verseKey),
      verseKey: verse.verseKey,
      arabic: _stripHtml(_stripUnsupportedArabicMarks(verse.text)),
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
        .replaceAll(RegExp(r'\s*[\u0660-\u0669]+\s*$'), '') // Hapus nomor ayat Arab di akhir string
        .trim();
  }
}
