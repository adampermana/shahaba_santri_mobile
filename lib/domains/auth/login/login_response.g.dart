// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      meta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{'meta': instance.meta, 'data': instance.data};

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  id: (json['id'] as num?)?.toInt(),
  token: json['token'] as String?,
  userId: (json['user_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  status: (json['status'] as num?)?.toInt(),
  isPendingDeletion: json['is_pending_deletion'] as bool?,
  remainingDays: (json['remaining_days'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  primaryAction: json['primary_action'] as String?,
  secondaryAction: json['secondary_action'] as String?,
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'user_id': instance.userId,
      'name': instance.name,
      'status': instance.status,
      'is_pending_deletion': instance.isPendingDeletion,
      'remaining_days': instance.remainingDays,
      'title': instance.title,
      'description': instance.description,
      'primary_action': instance.primaryAction,
      'secondary_action': instance.secondaryAction,
    };
