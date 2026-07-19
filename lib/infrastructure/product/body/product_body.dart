import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/infrastructure/core/converter.dart';

part 'product_body.freezed.dart';
part 'product_body.g.dart';

@Freezed(fromJson: false, toJson: true)
abstract class ProductBody with _$ProductBody {
  @JsonSerializable(
    createFactory: false,
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  factory ProductBody({
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'person') required String person,
    @JsonKey(name: 'image', toJson: parseToBase64) required String image,
    @JsonKey(name: 'kecamatan') required String kecamatan,
    @JsonKey(name: 'kelurahan') required String kelurahan,
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'long') required double long,
    @JsonKey(name: 'provinsi') required String provinsi,
  }) = _ProductBody;
}
