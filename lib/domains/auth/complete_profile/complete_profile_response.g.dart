// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompleteProfileResponse _$CompleteProfileResponseFromJson(
  Map<String, dynamic> json,
) => _CompleteProfileResponse(
  meta: json['meta'] == null
      ? null
      : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
  data: json['data'] == null
      ? null
      : LoginData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CompleteProfileResponseToJson(
  _CompleteProfileResponse instance,
) => <String, dynamic>{'meta': instance.meta, 'data': instance.data};
