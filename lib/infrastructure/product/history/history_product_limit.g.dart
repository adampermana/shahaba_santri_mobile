// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_product_limit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchHistoryProductLimit _$FetchHistoryProductLimitFromJson(
  Map<String, dynamic> json,
) => FetchHistoryProductLimit(
  data: (json['data'] as List<dynamic>?)
      ?.map(
        (e) => FetchHistoryDataProductLimit.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FetchHistoryProductLimitToJson(
  FetchHistoryProductLimit instance,
) => <String, dynamic>{'data': instance.data};

FetchHistoryDataProductLimit _$FetchHistoryDataProductLimitFromJson(
  Map<String, dynamic> json,
) => FetchHistoryDataProductLimit(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  productCategoryName: json['product_category_name'] as String?,
  halalStatus: json['halal_status'] as String?,
  assetUrl: json['asset_url'] as String?,
  eventTime: json['event_time'] == null
      ? null
      : DateTime.parse(json['event_time'] as String),
  expireDate: json['expire_date'] as String?,
  registerDate: json['register_date'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  long: (json['long'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FetchHistoryDataProductLimitToJson(
  FetchHistoryDataProductLimit instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'product_category_name': instance.productCategoryName,
  'halal_status': instance.halalStatus,
  'asset_url': instance.assetUrl,
  'event_time': instance.eventTime?.toIso8601String(),
  'expire_date': instance.expireDate,
  'register_date': instance.registerDate,
  'lat': instance.lat,
  'long': instance.long,
};
