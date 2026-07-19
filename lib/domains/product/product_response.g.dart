// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProductResponse _$ListProductResponseFromJson(Map<String, dynamic> json) =>
    ListProductResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductResponseToJson(
  ListProductResponse instance,
) => <String, dynamic>{'data': instance.data};

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  productName: json['product_name'] as String?,
  type: json['type'] as String?,
  campaignId: (json['campaign_id'] as num?)?.toInt(),
  creativeId: (json['creative_id'] as num?)?.toInt(),
  image: json['image'] as String?,
  images: (json['images'] as List<dynamic>?)
      ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
      .toList(),
  description: json['description'] as String?,
  category: json['product_category_name'] as String?,
  categoryId: (json['product_category_id'] as num?)?.toInt(),
  bpomNumber: json['nomor_bpom'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  long: (json['long'] as num?)?.toDouble(),
  partner: json['partner_name'] as String?,
  partnerId: (json['partner_id'] as num?)?.toInt(),
  brandId: (json['brand_id'] as num?)?.toInt(),
  status: json['status_halal'] as String?,
  expireDate: json['expire_date'] as String?,
  registerDate: json['register_date'] as String?,
  certificateNumber: json['no_sertifikat'] as String?,
  productId: (json['product_id'] as num?)?.toInt(),
  halalStatus: json['halal_status'] as String?,
  assetUrl: json['asset_url'] as String?,
  eventTime: json['event_time'] as String?,
);

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product_name': instance.productName,
      'type': instance.type,
      'campaign_id': instance.campaignId,
      'creative_id': instance.creativeId,
      'image': instance.image,
      'images': instance.images,
      'description': instance.description,
      'product_category_name': instance.category,
      'product_category_id': instance.categoryId,
      'nomor_bpom': instance.bpomNumber,
      'lat': instance.lat,
      'long': instance.long,
      'partner_name': instance.partner,
      'partner_id': instance.partnerId,
      'brand_id': instance.brandId,
      'status_halal': instance.status,
      'expire_date': instance.expireDate,
      'register_date': instance.registerDate,
      'no_sertifikat': instance.certificateNumber,
      'product_id': instance.productId,
      'halal_status': instance.halalStatus,
      'asset_url': instance.assetUrl,
      'event_time': instance.eventTime,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) =>
    Images(id: (json['id'] as num).toInt(), image: json['image'] as String);

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
};
