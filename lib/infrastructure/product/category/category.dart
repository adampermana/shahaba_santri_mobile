import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@Freezed(toJson: false)
abstract class ListCategory with _$ListCategory {
  const factory ListCategory({@Default([]) List<Category> data}) =
      _ListCategory;
  factory ListCategory.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryFromJson(json);
}

@Freezed(toJson: false)
abstract class Category with _$Category {
  const factory Category({
    required int id,
    @JsonKey(name: 'icon') required String image,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'children') @Default([]) List<Subcategory> subcategory,
  }) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@Freezed(toJson: false)
abstract class Subcategory with _$Subcategory {
  const factory Subcategory({
    required int id,
    @JsonKey(name: 'icon') required String image,
    @JsonKey(name: 'name') required String name,
  }) = _Subcategory;
  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
}
