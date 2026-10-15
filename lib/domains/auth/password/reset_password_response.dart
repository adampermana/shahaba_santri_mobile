import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_response.freezed.dart';
part 'reset_password_response.g.dart';

@freezed
abstract class ResetPasswordResponse with _$ResetPasswordResponse {
  const factory ResetPasswordResponse({
    bool? success,
    String? message,
    ResetPasswordData? data,
  }) = _ResetPasswordResponse;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}

@freezed
abstract class ResetPasswordData with _$ResetPasswordData {
  const factory ResetPasswordData({
    @JsonKey(name: 'is_pin') bool? isPin,
  }) = _ResetPasswordData;

  factory ResetPasswordData.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDataFromJson(json);
}
