import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/meta_response.dart';

part 'login_sso_response.freezed.dart';
part 'login_sso_response.g.dart';

@freezed
abstract class LoginSsoResponse with _$LoginSsoResponse {
  const factory LoginSsoResponse({MetaResponse? meta, LoginSsoData? data}) =
      _LoginSsoResponse;

  factory LoginSsoResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginSsoResponseFromJson(json);
}

@freezed
abstract class LoginSsoData with _$LoginSsoData {
  const factory LoginSsoData({
    int? id,
    String? token,
    @JsonKey(name: 'user_id') int? userId,
    String? name,
    String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'is_profile_completed')
    @Default(false)
    bool isProfileCompleted,
    int? status,
    @JsonKey(name: 'is_pending_deletion')
    @Default(false)
    bool isPendingDeletion,
    @JsonKey(name: 'remaining_days') int? remainingDays,
    String? title,
    String? description,
    @JsonKey(name: 'primary_action') String? primaryAction,
    @JsonKey(name: 'secondary_action') String? secondaryAction,
  }) = _LoginSsoData;

  factory LoginSsoData.fromJson(Map<String, dynamic> json) =>
      _$LoginSsoDataFromJson(json);
}
