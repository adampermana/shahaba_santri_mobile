// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_product_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMultipleResponse _$ProductMultipleResponseFromJson(
  Map<String, dynamic> json,
) => ProductMultipleResponse(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : PaginationMeta.fromJson(json['pagination'] as Map<String, dynamic>),
);

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    PaginationMeta(
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationMetaToJson(PaginationMeta instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
      'total': instance.total,
    };
