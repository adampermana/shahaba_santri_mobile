// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerScheduleModel _$PrayerScheduleModelFromJson(Map<String, dynamic> json) =>
    PrayerScheduleModel(
      tanggal: json['tanggal'] as String?,
      imsak: json['imsak'] as String?,
      subuh: json['subuh'] as String?,
      terbit: json['terbit'] as String?,
      dhuha: json['dhuha'] as String?,
      dzuhur: json['dzuhur'] as String?,
      ashar: json['ashar'] as String?,
      maghrib: json['maghrib'] as String?,
      isya: json['isya'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$PrayerScheduleModelToJson(
  PrayerScheduleModel instance,
) => <String, dynamic>{
  'tanggal': instance.tanggal,
  'imsak': instance.imsak,
  'subuh': instance.subuh,
  'terbit': instance.terbit,
  'dhuha': instance.dhuha,
  'dzuhur': instance.dzuhur,
  'ashar': instance.ashar,
  'maghrib': instance.maghrib,
  'isya': instance.isya,
  'date': instance.date,
};

PrayerScheduleResponse _$PrayerScheduleResponseFromJson(
  Map<String, dynamic> json,
) => PrayerScheduleResponse(
  id: json['id'] as String?,
  lokasi: json['lokasi'] as String?,
  daerah: json['daerah'] as String?,
  jadwal: json['jadwal'] == null
      ? null
      : PrayerScheduleModel.fromJson(json['jadwal'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PrayerScheduleResponseToJson(
  PrayerScheduleResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'lokasi': instance.lokasi,
  'daerah': instance.daerah,
  'jadwal': instance.jadwal,
};
