import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CityModel {
  CityModel({
    this.id,
    this.lokasi,
  });
  factory CityModel.fromHiveMap(Map<String, dynamic> map) => CityModel(
    id: map['id'] as String?,
    lokasi: map['lokasi'] as String?,
  );

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  String? id;
  String? lokasi;

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  Map<String, dynamic> toHiveMap() => {
    'id': id,
    'lokasi': lokasi,
  };
}
