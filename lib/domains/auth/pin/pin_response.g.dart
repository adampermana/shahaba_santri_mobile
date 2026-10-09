// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PinResponse _$PinResponseFromJson(Map<String, dynamic> json) => _PinResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : PinData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PinResponseToJson(_PinResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_PinData _$PinDataFromJson(Map<String, dynamic> json) =>
    _PinData(isPin: json['is_pin'] as bool?);

Map<String, dynamic> _$PinDataToJson(_PinData instance) => <String, dynamic>{
  'is_pin': instance.isPin,
};
