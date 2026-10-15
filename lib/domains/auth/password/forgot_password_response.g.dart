// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
  Map<String, dynamic> json,
) => _ForgotPasswordResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ForgotPasswordData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForgotPasswordResponseToJson(
  _ForgotPasswordResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_ForgotPasswordData _$ForgotPasswordDataFromJson(Map<String, dynamic> json) =>
    _ForgotPasswordData(cooldownOtp: (json['cooldown_otp'] as num?)?.toInt());

Map<String, dynamic> _$ForgotPasswordDataToJson(_ForgotPasswordData instance) =>
    <String, dynamic>{'cooldown_otp': instance.cooldownOtp};
