import 'package:freezed_annotation/freezed_annotation.dart';

part 'produsen.freezed.dart';
part 'produsen.g.dart';

@Freezed(toJson: false)
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
abstract class ListBrand with _$ListBrand {
  const factory ListBrand({@Default([]) List<Brand> data}) = _ListBrand;
  factory ListBrand.fromJson(Map<String, dynamic> json) =>
      _$ListBrandFromJson(json);
}

@Freezed(toJson: false)
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
abstract class Brand with _$Brand {
  const factory Brand({
    required int id,
    @JsonKey(name: 'image_path') required String image,
    @JsonKey(name: 'name') required String name,
  }) = _Brand;
  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
