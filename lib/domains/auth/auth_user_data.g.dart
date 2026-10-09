// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserData _$AuthUserDataFromJson(Map<String, dynamic> json) =>
    _AuthUserData(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photo_url'] as String?,
      emailVerified: json['email_verified'] as bool?,
      isPin: json['is_pin'] as bool?,
      status: json['status'] as String?,
      cooldownOtp: (json['cooldown_otp'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AuthUserDataToJson(_AuthUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'email_verified': instance.emailVerified,
      'is_pin': instance.isPin,
      'status': instance.status,
      'cooldown_otp': instance.cooldownOtp,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
