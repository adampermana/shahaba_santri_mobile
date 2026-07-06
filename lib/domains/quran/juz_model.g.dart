// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JuzModel _$JuzModelFromJson(Map<String, dynamic> json) => JuzModel(
  index: json['index'] as String?,
  start: json['start'] == null
      ? null
      : JuzEndpoint.fromJson(json['start'] as Map<String, dynamic>),
  end: json['end'] == null
      ? null
      : JuzEndpoint.fromJson(json['end'] as Map<String, dynamic>),
);

Map<String, dynamic> _$JuzModelToJson(JuzModel instance) => <String, dynamic>{
  'index': instance.index,
  'start': instance.start,
  'end': instance.end,
};

JuzEndpoint _$JuzEndpointFromJson(Map<String, dynamic> json) => JuzEndpoint(
  index: json['index'] as String?,
  verse: json['verse'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$JuzEndpointToJson(JuzEndpoint instance) =>
    <String, dynamic>{
      'index': instance.index,
      'verse': instance.verse,
      'name': instance.name,
    };
