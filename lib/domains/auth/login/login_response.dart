import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    LoginData? data,
    LoginMeta? meta,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    LoginUser? user,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
abstract class LoginUser with _$LoginUser {
  const factory LoginUser({
    String? id,
    String? email,
    String? name,
    String? phone,
    @JsonKey(name: 'photo_url') String? photoUrl,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'last_login_at') String? lastLoginAt,
  }) = _LoginUser;

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);
}

@freezed
abstract class LoginMeta with _$LoginMeta {
  const factory LoginMeta({
    String? message,
    bool? success,
  }) = _LoginMeta;

  factory LoginMeta.fromJson(Map<String, dynamic> json) =>
      _$LoginMetaFromJson(json);
}
