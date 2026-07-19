// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAdsResponse _$ListAdsResponseFromJson(Map<String, dynamic> json) =>
    ListAdsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AdResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: (json['limit'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ListAdsResponseToJson(ListAdsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'limit': instance.limit,
      'total': instance.total,
    };

AdResponseData _$AdResponseDataFromJson(Map<String, dynamic> json) =>
    AdResponseData(
      id: (json['id'] as num?)?.toInt(),
      name: json['product_name'] as String?,
      campaignName: json['name'] as String?,
      image: json['image_url'] as String?,
      type: json['redirect_type'] as String?,
      productId: (json['product_id'] as num?)?.toInt(),
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      target: json['redirect_target'] as String?,
      partnerName: json['partner_name'] as String?,
      categoryName: json['category_name'] as String?,
      brandId: (json['brand_id'] as num?)?.toInt(),
      targets: (json['targets'] as List<dynamic>?)
          ?.map((e) => TargetAds.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdResponseDataToJson(AdResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.name,
      'name': instance.campaignName,
      'image_url': instance.image,
      'redirect_type': instance.type,
      'product_id': instance.productId,
      'campaign_id': instance.campaignId,
      'redirect_target': instance.target,
      'partner_name': instance.partnerName,
      'category_name': instance.categoryName,
      'brand_id': instance.brandId,
      'targets': instance.targets,
    };

TargetAds _$TargetAdsFromJson(Map<String, dynamic> json) => TargetAds(
  type: json['match_type'] as String?,
  value: json['target_value'] as String?,
);

Map<String, dynamic> _$TargetAdsToJson(TargetAds instance) => <String, dynamic>{
  'match_type': instance.type,
  'target_value': instance.value,
};
