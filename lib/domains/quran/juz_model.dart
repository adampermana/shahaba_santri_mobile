import 'package:json_annotation/json_annotation.dart';

part 'juz_model.g.dart';

@JsonSerializable()
class JuzModel {
  JuzModel({this.index, this.start, this.end});

  factory JuzModel.fromJson(Map<String, dynamic> json) =>
      _$JuzModelFromJson(json);

  String? index;
  JuzEndpoint? start;
  JuzEndpoint? end;

  Map<String, dynamic> toJson() => _$JuzModelToJson(this);

  String get verseStartNumber {
    if (start?.verse == null) return '';
    final parts = start!.verse!.split('_');
    return parts.length > 1 ? parts[1] : '';
  }
}

@JsonSerializable()
class JuzEndpoint {
  JuzEndpoint({this.index, this.verse, this.name});

  factory JuzEndpoint.fromJson(Map<String, dynamic> json) =>
      _$JuzEndpointFromJson(json);

  String? index;
  String? verse;
  String? name;

  Map<String, dynamic> toJson() => _$JuzEndpointToJson(this);
}
