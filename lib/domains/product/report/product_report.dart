import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/infrastructure/core/converter.dart';

part 'product_report.freezed.dart';
part 'product_report.g.dart';

@Freezed(fromJson: false, toJson: true)
abstract class ProductReport with _$ProductReport {
  factory ProductReport({
    @JsonKey(name: 'brand_id') required int brandId,
    @JsonKey(name: 'image', toJson: parseToBase64) required String image,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'partner_id') required int partner,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'person') required String person,
    @JsonKey(name: 'kecamatan') required String kecamatan,
    @JsonKey(name: 'kelurahan') required String kelurahan,
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'long') required double long,
    @JsonKey(name: 'provinsi') required String provinsi,
  }) = _ProductReport;
}
