import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsResponse {
  NewsResponse({
    this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  List<NewsData>? data;

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsData {
  NewsData({
    this.id,
    this.authorId,
    this.title,
    this.headliner,
    this.pictureUrl,
    this.content,
    this.view,
    this.createdAt,
    this.updatedAt,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) =>
      _$NewsDataFromJson(json);

  int? id;
  int? authorId;
  String? title;
  String? headliner;
  String? pictureUrl;
  String? content;
  int? view;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() => _$NewsDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsDetailResponse {
  NewsDetailResponse({
    this.data,
  });

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailResponseFromJson(json);

  NewsData? data;

  Map<String, dynamic> toJson() => _$NewsDetailResponseToJson(this);
}

