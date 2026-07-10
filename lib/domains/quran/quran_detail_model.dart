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
    this.initialVerseKey,
  });

  factory QuranDetailArgs.surah(
    SurahModel surah, {
    List<SurahModel> allSurahs = const [],
    List<JuzModel> allJuz = const [],
    int? initialVerseNumber,
    String? initialVerseKey,
  }) {
    return QuranDetailArgs._(
      type: QuranDetailType.surah,
      surah: surah,
      allSurahs: allSurahs,
      allJuz: allJuz,
      initialVerseNumber: initialVerseNumber,
      initialVerseKey: initialVerseKey,
    );
  }

  factory QuranDetailArgs.juz(
    JuzModel juz, {
    List<SurahModel> allSurahs = const [],
    List<JuzModel> allJuz = const [],
    String? initialVerseKey,
  }) {
    return QuranDetailArgs._(
      type: QuranDetailType.juz,
      juz: juz,
      allSurahs: allSurahs,
      allJuz: allJuz,
      initialVerseKey: initialVerseKey,
    );
  }

  final QuranDetailType type;
  final SurahModel? surah;
  final JuzModel? juz;
  final List<SurahModel> allSurahs;
  final List<JuzModel> allJuz;
  final int? initialVerseNumber;
  final String? initialVerseKey;
}

class QuranLastReadModel {
  const QuranLastReadModel({
    required this.verse,
    required this.type,
    this.juzIndex,
  });

  factory QuranLastReadModel.fromJson(Map<String, dynamic> json) {
    final verseJson = json['verse'];
    return QuranLastReadModel(
      verse: QuranVerseModel.fromJson(
        verseJson is Map<String, dynamic> ? verseJson : json,
      ),
      type: json['type'] is String
          ? QuranDetailType.values.byName(json['type'] as String)
          : QuranDetailType.surah,
      juzIndex: json['juzIndex'] as String?,
    );
  }

  final QuranVerseModel verse;
  final QuranDetailType type;
  final String? juzIndex;

  Map<String, dynamic> toJson() => {
    'verse': verse.toJson(),
    'type': type.name,
    'juzIndex': juzIndex,
  };
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

  factory QuranVerseModel.fromJson(Map<String, dynamic> json) {
    return QuranVerseModel(
      surahIndex: json['surahIndex'] as String,
      surahName: json['surahName'] as String,
      surahNameAr: json['surahNameAr'] as String,
      verseNumber: json['verseNumber'] as int,
      verseKey: json['verseKey'] as String,
      arabic: json['arabic'] as String,
      transliteration: json['transliteration'] as String,
      translation: json['translation'] as String,
    );
  }

  final String surahIndex;
  final String surahName;
  final String surahNameAr;
  final int verseNumber;
  final String verseKey;
  final String arabic;
  final String transliteration;
  final String translation;

  Map<String, dynamic> toJson() => {
    'surahIndex': surahIndex,
    'surahName': surahName,
    'surahNameAr': surahNameAr,
    'verseNumber': verseNumber,
    'verseKey': verseKey,
    'arabic': arabic,
    'transliteration': transliteration,
    'translation': translation,
  };
}
