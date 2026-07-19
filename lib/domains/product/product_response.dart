import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ListProductResponse {
  ListProductResponse({this.data});

  factory ListProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductResponseToJson(this);

  final List<ProductData>? data;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductData {
  ProductData({
    this.id,
    this.name,
    this.productName,
    this.type,
    this.campaignId,
    this.creativeId,
    this.image,
    this.images,
    this.description,
    this.category,
    this.categoryId,
    this.bpomNumber,
    this.lat,
    this.long,
    this.partner,
    this.partnerId,
    this.brandId,
    this.status,
    this.expireDate,
    this.registerDate,
    this.certificateNumber,
    this.productId,
    this.halalStatus,
    this.assetUrl,
    this.eventTime,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);

  final int? id;
  final String? name;

  @JsonKey(name: 'product_name')
  final String? productName;

  final String? type;

  @JsonKey(name: 'campaign_id')
  final int? campaignId;

  @JsonKey(name: 'creative_id')
  final int? creativeId;

  final String? image;
  final List<Images>? images;
  final String? description;

  @JsonKey(name: 'product_category_name')
  final String? category;

  @JsonKey(name: 'product_category_id')
  final int? categoryId;

  @JsonKey(name: 'nomor_bpom')
  final String? bpomNumber;

  final double? lat;
  final double? long;

  @JsonKey(name: 'partner_name')
  final String? partner;

  @JsonKey(name: 'partner_id')
  final int? partnerId;

  @JsonKey(name: 'brand_id')
  final int? brandId;

  @JsonKey(name: 'status_halal')
  final String? status;

  @JsonKey(name: 'expire_date')
  final String? expireDate;

  @JsonKey(name: 'register_date')
  final String? registerDate;

  @JsonKey(name: 'no_sertifikat')
  final String? certificateNumber;

  @JsonKey(name: 'product_id')
  final int? productId;

  @JsonKey(name: 'halal_status')
  final String? halalStatus;

  @JsonKey(name: 'asset_url')
  final String? assetUrl;

  @JsonKey(name: 'event_time')
  final String? eventTime;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Images {
  Images({required this.id, required this.image});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  final int id;
  final String image;
}
