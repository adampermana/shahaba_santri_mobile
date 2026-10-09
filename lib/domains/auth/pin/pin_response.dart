import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_response.freezed.dart';
part 'pin_response.g.dart';

@freezed
abstract class PinResponse with _$PinResponse {
  const factory PinResponse({
    bool? success,
    String? message,
    PinData? data,
  }) = _PinResponse;

  factory PinResponse.fromJson(Map<String, dynamic> json) =>
      _$PinResponseFromJson(json);
}

@freezed
abstract class PinData with _$PinData {
  const factory PinData({
    @JsonKey(name: 'is_pin') bool? isPin,
  }) = _PinData;

  factory PinData.fromJson(Map<String, dynamic> json) =>
      _$PinDataFromJson(json);
}
