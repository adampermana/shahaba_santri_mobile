import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sahaba_mobile/domains/shared/meta_response.dart';

part 'verify_otp_response.freezed.dart';
part 'verify_otp_response.g.dart';

@freezed
abstract class VerifyOtpResponse with _$VerifyOtpResponse {
  const factory VerifyOtpResponse({MetaResponse? meta, VerifyOtpData? data}) =
      _VerifyOtpResponse;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);
}

@freezed
abstract class VerifyOtpData with _$VerifyOtpData {
  const factory VerifyOtpData({
    String? email,
    @JsonKey(name: 'is_verified') bool? isVerified,
    @JsonKey(name: 'verify_token') String? verifyToken,
  }) = _VerifyOtpData;

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpDataFromJson(json);
}
