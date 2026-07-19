import 'package:freezed_annotation/freezed_annotation.dart';

part 'dropdown_data.freezed.dart';
part 'dropdown_data.g.dart';

@Freezed(toJson: false)
abstract class DropdownDataResponse with _$DropdownDataResponse {
  @JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
  const factory DropdownDataResponse({@Default([]) List<DropdownItems> data}) =
      _DropdownDataResponse;

  factory DropdownDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DropdownDataResponseFromJson(json);
}

@Freezed(toJson: false)
abstract class DropdownItems with _$DropdownItems {
  @JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
  const factory DropdownItems({
    required int id,
    @JsonKey(name: 'name') required String title,
  }) = _DropdownItems;

  factory DropdownItems.fromJson(Map<String, dynamic> json) =>
      _$DropdownItemsFromJson(json);
}
