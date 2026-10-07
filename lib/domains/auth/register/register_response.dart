import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/auth/auth_user_data.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    bool? success,
    String? message,
    AuthUserData? data,
    @JsonKey(name: 'email_verified') bool? emailVerified,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
