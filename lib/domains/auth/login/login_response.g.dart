// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : LoginMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{'data': instance.data, 'meta': instance.meta};

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  accessToken: json['access_token'] as String?,
  refreshToken: json['refresh_token'] as String?,
  user: json['user'] == null
      ? null
      : LoginUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
    };

_LoginUser _$LoginUserFromJson(Map<String, dynamic> json) => _LoginUser(
  id: json['id'] as String?,
  email: json['email'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  photoUrl: json['photo_url'] as String?,
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  emailVerifiedAt: json['email_verified_at'] as String?,
  lastLoginAt: json['last_login_at'] as String?,
);

Map<String, dynamic> _$LoginUserToJson(_LoginUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'photo_url': instance.photoUrl,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'email_verified_at': instance.emailVerifiedAt,
      'last_login_at': instance.lastLoginAt,
    };

_LoginMeta _$LoginMetaFromJson(Map<String, dynamic> json) => _LoginMeta(
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$LoginMetaToJson(_LoginMeta instance) =>
    <String, dynamic>{'message': instance.message, 'success': instance.success};
