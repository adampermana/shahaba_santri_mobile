import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_product_limit.g.dart';

@JsonSerializable()
class FetchHistoryProductLimit {
  @JsonKey(name: "data")
  List<FetchHistoryDataProductLimit>? data;

  FetchHistoryProductLimit({this.data});

  factory FetchHistoryProductLimit.fromJson(Map<String, dynamic> json) =>
      _$FetchHistoryProductLimitFromJson(json);

  Map<String, dynamic> toJson() => _$FetchHistoryProductLimitToJson(this);
}

@JsonSerializable()
class FetchHistoryDataProductLimit {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "product_id")
  int? productId;
  @JsonKey(name: "product_name")
  String? productName;
  @JsonKey(name: "product_category_name")
  ProductCategoryName? productCategoryName;
  @JsonKey(name: "halal_status")
  HalalStatus? halalStatus;
  @JsonKey(name: "asset_url")
  String? assetUrl;
  @JsonKey(name: "event_time")
  DateTime? eventTime;
  @JsonKey(name: "expire_date")
  String? expireDate;
  @JsonKey(name: "lat")
  double? lat;
  @JsonKey(name: "long")
  double? long;

  FetchHistoryDataProductLimit({
    this.id,
    this.productId,
    this.productName,
    this.productCategoryName,
    this.halalStatus,
    this.assetUrl,
    this.eventTime,
    this.expireDate,
    this.lat,
    this.long,
  });

  factory FetchHistoryDataProductLimit.fromJson(Map<String, dynamic> json) =>
      _$FetchHistoryDataProductLimitFromJson(json);

  Map<String, dynamic> toJson() => _$FetchHistoryDataProductLimitToJson(this);
}

enum HalalStatus {
  @JsonValue("Halal")
  halal,
}

enum ProductCategoryName {
  @JsonValue("Kosmetik")
  kosmetik,
  @JsonValue("Makanan")
  makanan,
  @JsonValue("Minuman")
  minuman,
}
