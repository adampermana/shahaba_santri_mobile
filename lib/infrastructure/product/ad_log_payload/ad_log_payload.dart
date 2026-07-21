import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_log_payload.freezed.dart';
part 'ad_log_payload.g.dart';

@Freezed(fromJson: false, toJson: true)
abstract class AdLogPayload with _$AdLogPayload {
  @JsonSerializable(
    createFactory: false,
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  factory AdLogPayload({
    @JsonKey(name: 'product_id') required int? productId,
    @JsonKey(name: 'creative_id') required int? creativeId,
    @JsonKey(name: 'campaign_id') required int? campaignId,
    @JsonKey(name: 'subdistrict') required String kecamatan,
    @JsonKey(name: 'city') required String kelurahan,
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'long') required double long,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'user') required String user,
    @JsonKey(name: 'province') required String provinsi,
    @JsonKey(name: 'event_type') required String eventType,
  }) = _AdLogPayload;
}
