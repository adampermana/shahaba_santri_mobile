import 'package:json_annotation/json_annotation.dart';

part 'kisah_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class KisahResponse {
  KisahResponse({
    this.data,
  });

  factory KisahResponse.fromJson(Map<String, dynamic> json) =>
      _$KisahResponseFromJson(json);

  List<KisahData>? data;

  Map<String, dynamic> toJson() => _$KisahResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class KisahData {
  KisahData({
    this.id,
    this.authorId,
    this.title,
    this.pictureUrl,
    this.content,
    this.view,
    this.createdAt,
    this.updatedAt,
  });

  factory KisahData.fromJson(Map<String, dynamic> json) =>
      _$KisahDataFromJson(json);

  int? id;
  int? authorId;
  String? title;
  String? pictureUrl;
  String? content;
  int? view;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() => _$KisahDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class KisahDetailResponse {
  KisahDetailResponse({
    this.data,
  });

  factory KisahDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$KisahDetailResponseFromJson(json);

  KisahData? data;

  Map<String, dynamic> toJson() => _$KisahDetailResponseToJson(this);
}
