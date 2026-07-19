// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListCategory _$ListCategoryFromJson(Map<String, dynamic> json) =>
    _ListCategory(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: (json['id'] as num).toInt(),
  image: json['icon'] as String,
  name: json['name'] as String,
  subcategory:
      (json['children'] as List<dynamic>?)
          ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

_Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => _Subcategory(
  id: (json['id'] as num).toInt(),
  image: json['icon'] as String,
  name: json['name'] as String,
);
