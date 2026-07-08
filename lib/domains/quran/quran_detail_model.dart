import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';

enum QuranDetailType { surah, juz }

class QuranDetailArgs {
  const QuranDetailArgs._({
    required this.type,
    this.surah,
    this.juz,
    this.allSurahs = const [],
    this.allJuz = const [],
    this.initialVerseNumber,
  });

  factory QuranDetailArgs.surah(
    SurahModel surah, {
    List<SurahModel> allSurahs = const [],
    int? initialVerseNumber,
  }) {
    return QuranDetailArgs._(
      type: QuranDetailType.surah,
      surah: surah,
      allSurahs: allSurahs,
      initialVerseNumber: initialVerseNumber,
    );
  }

  factory QuranDetailArgs.juz(
    JuzModel juz, {
    List<JuzModel> allJuz = const [],
  }) {
    return QuranDetailArgs._(
      type: QuranDetailType.juz,
      juz: juz,
      allJuz: allJuz,
    );
  }

  final QuranDetailType type;
  final SurahModel? surah;
  final JuzModel? juz;
  final List<SurahModel> allSurahs;
  final List<JuzModel> allJuz;
  final int? initialVerseNumber;
}

class QuranDetailModel {
  const QuranDetailModel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.verses,
    this.titleAr,
  });

  final QuranDetailType type;
  final String title;
  final String? titleAr;
  final String subtitle;
  final List<QuranVerseModel> verses;
}

class QuranVerseModel {
  const QuranVerseModel({
    required this.surahIndex,
    required this.surahName,
    required this.surahNameAr,
    required this.verseNumber,
    required this.verseKey,
    required this.arabic,
    required this.transliteration,
    required this.translation,
  });

  final String surahIndex;
  final String surahName;
  final String surahNameAr;
  final int verseNumber;
  final String verseKey;
  final String arabic;
  final String transliteration;
  final String translation;
}
