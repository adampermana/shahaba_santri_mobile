import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sahaba_mobile/domains/shared/meta_response.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({MetaResponse? meta, LoginData? data}) =
      _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({
    int? id,
    String? token,
    @JsonKey(name: 'user_id') int? userId,
    String? name,
    int? status,
    @JsonKey(name: 'is_pending_deletion') bool? isPendingDeletion,
    @JsonKey(name: 'remaining_days') int? remainingDays,
    String? title,
    String? description,
    @JsonKey(name: 'primary_action') String? primaryAction,
    @JsonKey(name: 'secondary_action') String? secondaryAction,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
