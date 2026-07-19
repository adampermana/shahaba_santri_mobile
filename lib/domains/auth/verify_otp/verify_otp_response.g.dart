// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    _VerifyOtpResponse(
      meta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : VerifyOtpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(_VerifyOtpResponse instance) =>
    <String, dynamic>{'meta': instance.meta, 'data': instance.data};

_VerifyOtpData _$VerifyOtpDataFromJson(Map<String, dynamic> json) =>
    _VerifyOtpData(
      email: json['email'] as String?,
      isVerified: json['is_verified'] as bool?,
      verifyToken: json['verify_token'] as String?,
    );

Map<String, dynamic> _$VerifyOtpDataToJson(_VerifyOtpData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'is_verified': instance.isVerified,
      'verify_token': instance.verifyToken,
    };
