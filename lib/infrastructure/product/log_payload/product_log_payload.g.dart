// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_log_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ProductLogPayloadToJson(_ProductLogPayload instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'user': instance.user,
      'image': parseToBase64(instance.image),
      'subdistrict': instance.kecamatan,
      'city': instance.disctrict,
      'lat': instance.lat,
      'long': instance.long,
      'province': instance.province,
      'event_type': instance.eventType,
      'partner_id': instance.partnerId,
      'brand_id': instance.brandId,
      'product_category_id': instance.categoryId,
      'product_id': instance.productId,
      'status_halal': instance.statusHalal,
    };
