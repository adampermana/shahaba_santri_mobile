import 'package:json_annotation/json_annotation.dart';

part 'ads_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ListAdsResponse {
  ListAdsResponse({this.data, this.limit, this.total});

  factory ListAdsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAdsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListAdsResponseToJson(this);

  final List<AdResponseData>? data;
  final int? limit;
  final int? total;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AdResponseData {
  AdResponseData({
    this.id,
    this.name,
    this.campaignName,
    this.image,
    this.type,
    this.productId,
    this.campaignId,
    this.target,
    this.partnerName,
    this.categoryName,
    this.brandId,
    this.targets,
  });

  factory AdResponseData.fromJson(Map<String, dynamic> json) =>
      _$AdResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$AdResponseDataToJson(this);

  final int? id;

  @JsonKey(name: 'product_name')
  final String? name;

  @JsonKey(name: 'name')
  final String? campaignName;

  @JsonKey(name: 'image_url')
  final String? image;

  @JsonKey(name: 'redirect_type')
  final String? type;

  @JsonKey(name: 'product_id')
  final int? productId;

  @JsonKey(name: 'campaign_id')
  final int? campaignId;

  @JsonKey(name: 'redirect_target')
  final String? target;

  @JsonKey(name: 'partner_name')
  final String? partnerName;

  @JsonKey(name: 'category_name')
  final String? categoryName;

  @JsonKey(name: 'brand_id')
  final int? brandId;

  final List<TargetAds>? targets;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TargetAds {
  TargetAds({this.type, this.value});

  factory TargetAds.fromJson(Map<String, dynamic> json) =>
      _$TargetAdsFromJson(json);

  Map<String, dynamic> toJson() => _$TargetAdsToJson(this);

  @JsonKey(name: 'match_type')
  final String? type;

  @JsonKey(name: 'target_value')
  final String? value;
}
