import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';

part 'user_profile_response.freezed.dart';
part 'user_profile_response.g.dart';

@freezed
abstract class UserProfileResponse with _$UserProfileResponse {
  const factory UserProfileResponse({
    LoginUser? data,
    LoginMeta? meta,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}
