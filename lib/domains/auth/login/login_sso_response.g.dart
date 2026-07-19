// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_sso_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginSsoResponse _$LoginSsoResponseFromJson(Map<String, dynamic> json) =>
    _LoginSsoResponse(
      meta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : LoginSsoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginSsoResponseToJson(_LoginSsoResponse instance) =>
    <String, dynamic>{'meta': instance.meta, 'data': instance.data};

_LoginSsoData _$LoginSsoDataFromJson(Map<String, dynamic> json) =>
    _LoginSsoData(
      id: (json['id'] as num?)?.toInt(),
      token: json['token'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isProfileCompleted: json['is_profile_completed'] as bool? ?? false,
      status: (json['status'] as num?)?.toInt(),
      isPendingDeletion: json['is_pending_deletion'] as bool? ?? false,
      remainingDays: (json['remaining_days'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      primaryAction: json['primary_action'] as String?,
      secondaryAction: json['secondary_action'] as String?,
    );

Map<String, dynamic> _$LoginSsoDataToJson(_LoginSsoData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'is_profile_completed': instance.isProfileCompleted,
      'status': instance.status,
      'is_pending_deletion': instance.isPendingDeletion,
      'remaining_days': instance.remainingDays,
      'title': instance.title,
      'description': instance.description,
      'primary_action': instance.primaryAction,
      'secondary_action': instance.secondaryAction,
    };
