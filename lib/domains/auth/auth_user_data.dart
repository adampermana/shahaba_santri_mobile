import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_data.freezed.dart';
part 'auth_user_data.g.dart';

@freezed
abstract class AuthUserData with _$AuthUserData {
  const factory AuthUserData({
    String? id,
    String? email,
    String? name,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'email_verified') bool? emailVerified,
    String? status,
    @JsonKey(name: 'cooldown_otp') int? cooldownOtp,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _AuthUserData;

  factory AuthUserData.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDataFromJson(json);
}
