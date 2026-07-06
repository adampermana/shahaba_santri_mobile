import 'package:json_annotation/json_annotation.dart';

part 'surah_model.g.dart';

@JsonSerializable()
class SurahModel {
  SurahModel({
    this.place,
    this.type,
    this.count,
    this.title,
    @JsonKey(name: 'titleAr') this.titleAr,
    this.index,
    this.pages,
    this.juz,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);

  String? place;
  String? type;
  int? count;
  String? title;

  @JsonKey(name: 'titleAr')
  String? titleAr;

  String? index;
  String? pages;
  List<SurahJuz>? juz;

  Map<String, dynamic> toJson() => _$SurahModelToJson(this);
}

@JsonSerializable()
class SurahJuz {
  SurahJuz({this.index, this.verse});

  factory SurahJuz.fromJson(Map<String, dynamic> json) =>
      _$SurahJuzFromJson(json);

  String? index;
  SurahJuzVerse? verse;

  Map<String, dynamic> toJson() => _$SurahJuzToJson(this);
}

@JsonSerializable()
class SurahJuzVerse {
  SurahJuzVerse({this.start, this.end});

  factory SurahJuzVerse.fromJson(Map<String, dynamic> json) =>
      _$SurahJuzVerseFromJson(json);

  String? start;
  String? end;

  Map<String, dynamic> toJson() => _$SurahJuzVerseToJson(this);
}
