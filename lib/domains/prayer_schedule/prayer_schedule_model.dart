import 'package:json_annotation/json_annotation.dart';

part 'prayer_schedule_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PrayerScheduleModel {
  PrayerScheduleModel({
    this.tanggal,
    this.imsak,
    this.subuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.date,
  });
  factory PrayerScheduleModel.fromHiveMap(Map<String, dynamic> map) =>
      PrayerScheduleModel(
        tanggal: map['tanggal'] as String?,
        imsak: map['imsak'] as String?,
        subuh: map['subuh'] as String?,
        terbit: map['terbit'] as String?,
        dhuha: map['dhuha'] as String?,
        dzuhur: map['dzuhur'] as String?,
        ashar: map['ashar'] as String?,
        maghrib: map['maghrib'] as String?,
        isya: map['isya'] as String?,
        date: map['date'] as String?,
      );

  factory PrayerScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerScheduleModelFromJson(json);

  String? tanggal;
  String? imsak;
  String? subuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashar;
  String? maghrib;
  String? isya;
  String? date;

  Map<String, dynamic> toJson() => _$PrayerScheduleModelToJson(this);

  Map<String, dynamic> toHiveMap() => {
    'tanggal': tanggal,
    'imsak': imsak,
    'subuh': subuh,
    'terbit': terbit,
    'dhuha': dhuha,
    'dzuhur': dzuhur,
    'ashar': ashar,
    'maghrib': maghrib,
    'isya': isya,
    'date': date,
  };

  String? getTimeByPrayerName(String name) {
    switch (name.toLowerCase()) {
      case 'imsak':
        return imsak;
      case 'subuh':
        return subuh;
      case 'terbit':
        return terbit;
      case 'dhuha':
        return dhuha;
      case 'dzuhur':
        return dzuhur;
      case 'ashar':
        return ashar;
      case 'maghrib':
        return maghrib;
      case 'isya':
        return isya;
      default:
        return null;
    }
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PrayerScheduleResponse {
  PrayerScheduleResponse({
    this.id,
    this.lokasi,
    this.daerah,
    this.jadwal,
  });

  factory PrayerScheduleResponse.fromJson(Map<String, dynamic> json) {
    final rawJadwal = json['jadwal'];

    PrayerScheduleModel? parsedJadwal;
    if (rawJadwal is Map<String, dynamic>) {
      if (rawJadwal.isNotEmpty) {
        final firstEntry = rawJadwal.entries.first;
        final scheduleData = firstEntry.value;
        if (scheduleData is Map<String, dynamic>) {
          parsedJadwal = PrayerScheduleModel.fromJson(scheduleData)
            ..date ??= firstEntry.key;
        }
      }
    }

    return PrayerScheduleResponse(
      id: json['id']?.toString(),
      lokasi: json['kabko'] as String? ?? json['lokasi'] as String?,
      daerah: json['prov'] as String? ?? json['daerah'] as String?,
      jadwal: parsedJadwal,
    );
  }

  String? id;
  String? lokasi;
  String? daerah;
  PrayerScheduleModel? jadwal;

  Map<String, dynamic> toJson() => _$PrayerScheduleResponseToJson(this);
}
