// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResendOtpResponse _$ResendOtpResponseFromJson(Map<String, dynamic> json) =>
    _ResendOtpResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ResendOtpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResendOtpResponseToJson(_ResendOtpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_ResendOtpData _$ResendOtpDataFromJson(Map<String, dynamic> json) =>
    _ResendOtpData(cooldownOtp: (json['cooldown_otp'] as num?)?.toInt());

Map<String, dynamic> _$ResendOtpDataToJson(_ResendOtpData instance) =>
    <String, dynamic>{'cooldown_otp': instance.cooldownOtp};
