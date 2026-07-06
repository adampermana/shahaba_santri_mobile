// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
  place: json['place'] as String?,
  type: json['type'] as String?,
  count: (json['count'] as num?)?.toInt(),
  title: json['title'] as String?,
  titleAr: json['titleAr'] as String?,
  index: json['index'] as String?,
  pages: json['pages'] as String?,
  juz: (json['juz'] as List<dynamic>?)
      ?.map((e) => SurahJuz.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'place': instance.place,
      'type': instance.type,
      'count': instance.count,
      'title': instance.title,
      'titleAr': instance.titleAr,
      'index': instance.index,
      'pages': instance.pages,
      'juz': instance.juz,
    };

SurahJuz _$SurahJuzFromJson(Map<String, dynamic> json) => SurahJuz(
  index: json['index'] as String?,
  verse: json['verse'] == null
      ? null
      : SurahJuzVerse.fromJson(json['verse'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SurahJuzToJson(SurahJuz instance) => <String, dynamic>{
  'index': instance.index,
  'verse': instance.verse,
};

SurahJuzVerse _$SurahJuzVerseFromJson(Map<String, dynamic> json) =>
    SurahJuzVerse(start: json['start'] as String?, end: json['end'] as String?);

Map<String, dynamic> _$SurahJuzVerseToJson(SurahJuzVerse instance) =>
    <String, dynamic>{'start': instance.start, 'end': instance.end};
