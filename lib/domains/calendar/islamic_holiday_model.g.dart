// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'islamic_holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IslamicHolidayModel _$IslamicHolidayModelFromJson(Map<String, dynamic> json) =>
    IslamicHolidayModel(
      date: json['date'] as String,
      day: json['day'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$IslamicHolidayModelToJson(
  IslamicHolidayModel instance,
) => <String, dynamic>{
  'date': instance.date,
  'day': instance.day,
  'name': instance.name,
  'type': instance.type,
};
