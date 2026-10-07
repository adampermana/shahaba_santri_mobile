import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_otp_response.freezed.dart';
part 'resend_otp_response.g.dart';

@freezed
abstract class ResendOtpResponse with _$ResendOtpResponse {
  const factory ResendOtpResponse({
    bool? success,
    String? message,
    ResendOtpData? data,
  }) = _ResendOtpResponse;

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpResponseFromJson(json);
}

@freezed
abstract class ResendOtpData with _$ResendOtpData {
  const factory ResendOtpData({
    @JsonKey(name: 'cooldown_otp') int? cooldownOtp,
  }) = _ResendOtpData;

  factory ResendOtpData.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpDataFromJson(json);
}
