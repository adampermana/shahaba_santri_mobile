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
  FetchHistoryDataProductLimit({
    this.id,
    this.productId,
    this.productName,
    this.productCategoryName,
    this.halalStatus,
    this.assetUrl,
    this.eventTime,
    this.expireDate,
    this.registerDate,
    this.lat,
    this.long,
  });
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "product_id")
  int? productId;
  @JsonKey(name: "product_name")
  String? productName;
  @JsonKey(name: "product_category_name")
  String? productCategoryName;
  @JsonKey(name: 'halal_status')
  String? halalStatus;
  @JsonKey(name: "asset_url")
  String? assetUrl;
  @JsonKey(name: "event_time")
  DateTime? eventTime;
  @JsonKey(name: "expire_date")
  String? expireDate;
  @JsonKey(name: 'register_date')
  final String? registerDate;
  @JsonKey(name: "lat")
  double? lat;
  @JsonKey(name: "long")
  double? long;

  factory FetchHistoryDataProductLimit.fromJson(Map<String, dynamic> json) =>
      _$FetchHistoryDataProductLimitFromJson(json);

  Map<String, dynamic> toJson() => _$FetchHistoryDataProductLimitToJson(this);
}
