// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    _UserProfileResponse(
      data: json['data'] == null
          ? null
          : LoginUser.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : LoginMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseToJson(
  _UserProfileResponse instance,
) => <String, dynamic>{'data': instance.data, 'meta': instance.meta};
