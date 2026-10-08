import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_email_response.freezed.dart';
part 'validation_email_response.g.dart';

@freezed
abstract class ValidationEmailResponse with _$ValidationEmailResponse {
  const factory ValidationEmailResponse({
    bool? success,
    String? message,
    ValidationEmailData? data,
  }) = _ValidationEmailResponse;

  factory ValidationEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidationEmailResponseFromJson(json);
}

@freezed
abstract class ValidationEmailData with _$ValidationEmailData {
  const factory ValidationEmailData({
    bool? registered,
    @JsonKey(name: 'email_verified') bool? emailVerified,
    @JsonKey(name: 'is_pin') bool? isPin,
  }) = _ValidationEmailData;

  factory ValidationEmailData.fromJson(Map<String, dynamic> json) =>
      _$ValidationEmailDataFromJson(json);
}
