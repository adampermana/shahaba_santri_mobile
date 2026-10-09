// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_reset_pin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestResetPinResponse _$RequestResetPinResponseFromJson(
  Map<String, dynamic> json,
) => _RequestResetPinResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : RequestResetPinData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RequestResetPinResponseToJson(
  _RequestResetPinResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_RequestResetPinData _$RequestResetPinDataFromJson(Map<String, dynamic> json) =>
    _RequestResetPinData(cooldownOtp: (json['cooldown_otp'] as num?)?.toInt());

Map<String, dynamic> _$RequestResetPinDataToJson(
  _RequestResetPinData instance,
) => <String, dynamic>{'cooldown_otp': instance.cooldownOtp};
