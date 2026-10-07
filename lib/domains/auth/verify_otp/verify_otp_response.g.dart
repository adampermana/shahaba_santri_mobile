// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    _VerifyOtpResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AuthUserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(_VerifyOtpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
