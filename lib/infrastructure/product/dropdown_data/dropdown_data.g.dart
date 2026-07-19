// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DropdownDataResponse _$DropdownDataResponseFromJson(
  Map<String, dynamic> json,
) => _DropdownDataResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => DropdownItems.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

_DropdownItems _$DropdownItemsFromJson(Map<String, dynamic> json) =>
    _DropdownItems(
      id: (json['id'] as num).toInt(),
      title: json['name'] as String,
    );
