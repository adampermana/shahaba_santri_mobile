// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produsen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListBrand _$ListBrandFromJson(Map<String, dynamic> json) => _ListBrand(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

_Brand _$BrandFromJson(Map<String, dynamic> json) => _Brand(
  id: (json['id'] as num).toInt(),
  image: json['image_path'] as String,
  name: json['name'] as String,
);
