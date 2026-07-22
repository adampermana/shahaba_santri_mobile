// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_respon_ai.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponAI _$LoginResponAIFromJson(Map<String, dynamic> json) =>
    LoginResponAI(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      token: json['token'] as String?,
      expiresAt: (json['expires_at'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LoginResponAIToJson(LoginResponAI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'token': instance.token,
      'expires_at': instance.expiresAt,
      'tags': instance.tags,
    };
