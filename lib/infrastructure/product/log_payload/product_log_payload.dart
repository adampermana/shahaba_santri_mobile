import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_log_payload.freezed.dart';
part 'product_log_payload.g.dart';

@Freezed(fromJson: false, toJson: true)
abstract class ProductLogPayload with _$ProductLogPayload {
  @JsonSerializable(
    createFactory: false,
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  factory ProductLogPayload({
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'user') required String user,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'subdistrict') required String kecamatan,
    @JsonKey(name: 'city') required String disctrict,
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'long') required double long,
    @JsonKey(name: 'province') required String province,
    @JsonKey(name: 'event_type') required String eventType,
    @JsonKey(name: 'partner_id') required int partnerId,
    @JsonKey(name: 'brand_id') required int brandId,
    @JsonKey(name: 'product_category_id') required int categoryId,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'status_halal') required String statusHalal,
  }) = _ProductLogPayload;
}
