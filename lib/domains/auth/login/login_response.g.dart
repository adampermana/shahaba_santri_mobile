// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  token: json['token'] as String?,
  tokenType: json['token_type'] as String?,
  expiresIn: (json['expires_in'] as num?)?.toInt(),
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };
