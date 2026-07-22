// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => NewsData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{'data': instance.data};

NewsData _$NewsDataFromJson(Map<String, dynamic> json) => NewsData(
  id: (json['id'] as num?)?.toInt(),
  authorId: (json['author_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  headliner: json['headliner'] as String?,
  pictureUrl: json['picture_url'] as String?,
  content: json['content'] as String?,
  view: (json['view'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$NewsDataToJson(NewsData instance) => <String, dynamic>{
  'id': instance.id,
  'author_id': instance.authorId,
  'title': instance.title,
  'headliner': instance.headliner,
  'picture_url': instance.pictureUrl,
  'content': instance.content,
  'view': instance.view,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

NewsDetailResponse _$NewsDetailResponseFromJson(Map<String, dynamic> json) =>
    NewsDetailResponse(
      data: json['data'] == null
          ? null
          : NewsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsDetailResponseToJson(NewsDetailResponse instance) =>
    <String, dynamic>{'data': instance.data};
