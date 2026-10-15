// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPasswordResponse _$ResetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ResetPasswordData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResetPasswordResponseToJson(
  _ResetPasswordResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_ResetPasswordData _$ResetPasswordDataFromJson(Map<String, dynamic> json) =>
    _ResetPasswordData(isPin: json['is_pin'] as bool?);

Map<String, dynamic> _$ResetPasswordDataToJson(_ResetPasswordData instance) =>
    <String, dynamic>{'is_pin': instance.isPin};
