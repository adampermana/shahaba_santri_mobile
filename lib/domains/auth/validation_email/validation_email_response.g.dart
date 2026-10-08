// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ValidationEmailResponse _$ValidationEmailResponseFromJson(
  Map<String, dynamic> json,
) => _ValidationEmailResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ValidationEmailData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ValidationEmailResponseToJson(
  _ValidationEmailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_ValidationEmailData _$ValidationEmailDataFromJson(Map<String, dynamic> json) =>
    _ValidationEmailData(
      registered: json['registered'] as bool?,
      emailVerified: json['email_verified'] as bool?,
      isPin: json['is_pin'] as bool?,
    );

Map<String, dynamic> _$ValidationEmailDataToJson(
  _ValidationEmailData instance,
) => <String, dynamic>{
  'registered': instance.registered,
  'email_verified': instance.emailVerified,
  'is_pin': instance.isPin,
};
