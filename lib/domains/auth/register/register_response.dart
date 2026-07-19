import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sahaba_mobile/domains/shared/meta_response.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({MetaResponse? meta, RegisterData? data}) =
      _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
abstract class RegisterData with _$RegisterData {
  const factory RegisterData({
    String? email,
    @JsonKey(name: 'expired_in') int? expiredIn,
    @JsonKey(name: 'resend_in') int? resendIn,
  }) = _RegisterData;

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
}
