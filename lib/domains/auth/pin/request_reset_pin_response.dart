import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_reset_pin_response.freezed.dart';
part 'request_reset_pin_response.g.dart';

@freezed
abstract class RequestResetPinResponse with _$RequestResetPinResponse {
  const factory RequestResetPinResponse({
    bool? success,
    String? message,
    RequestResetPinData? data,
  }) = _RequestResetPinResponse;

  factory RequestResetPinResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestResetPinResponseFromJson(json);
}

@freezed
abstract class RequestResetPinData with _$RequestResetPinData {
  const factory RequestResetPinData({
    @JsonKey(name: 'cooldown_otp') int? cooldownOtp,
  }) = _RequestResetPinData;

  factory RequestResetPinData.fromJson(Map<String, dynamic> json) =>
      _$RequestResetPinDataFromJson(json);
}
