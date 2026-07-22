// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kisah_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KisahResponse _$KisahResponseFromJson(Map<String, dynamic> json) =>
    KisahResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => KisahData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KisahResponseToJson(KisahResponse instance) =>
    <String, dynamic>{'data': instance.data};

KisahData _$KisahDataFromJson(Map<String, dynamic> json) => KisahData(
  id: (json['id'] as num?)?.toInt(),
  authorId: (json['author_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  pictureUrl: json['picture_url'] as String?,
  content: json['content'] as String?,
  view: (json['view'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$KisahDataToJson(KisahData instance) => <String, dynamic>{
  'id': instance.id,
  'author_id': instance.authorId,
  'title': instance.title,
  'picture_url': instance.pictureUrl,
  'content': instance.content,
  'view': instance.view,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

KisahDetailResponse _$KisahDetailResponseFromJson(Map<String, dynamic> json) =>
    KisahDetailResponse(
      data: json['data'] == null
          ? null
          : KisahData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KisahDetailResponseToJson(
  KisahDetailResponse instance,
) => <String, dynamic>{'data': instance.data};
