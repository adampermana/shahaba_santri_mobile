import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/i_prayer_local_datasource.dart';

class PrayerLocalDatasource implements IPrayerLocalDatasource {
  static const String selectedCityBox = 'selected_city';
  static const String _selectedCityKey = 'city_key';
  static const String _selectedLatitudeKey = 'latitude_key';
  static const String _selectedLongitudeKey = 'longitude_key';
  static const String prayerCacheBox = 'prayer_cache';

  String _scheduleKey(String cityId, String date) => '$cityId:$date';

  @override
  Future<void> saveSelectedCity(CityModel city) async {
    final box = Hive.box<String>(selectedCityBox);
    await box.put(
      _selectedCityKey,
      jsonEncode(
        {
          'id': city.id,
          'lokasi': city.lokasi,
        },
      ),
    );
  }

  @override
  CityModel? getSelectedCity() {
    final box = Hive.box<String>(selectedCityBox);
    final raw = box.get(_selectedCityKey);
    if (raw == null) return null;
    return CityModel.fromHiveMap(
      jsonDecode(raw) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> saveSelectedCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    final box = Hive.box<String>(selectedCityBox);
    await box.put(_selectedLatitudeKey, latitude.toString());
    await box.put(_selectedLongitudeKey, longitude.toString());
  }

  @override
  double? getSelectedLatitude() {
    final box = Hive.box<String>(selectedCityBox);
    return double.tryParse(box.get(_selectedLatitudeKey) ?? '');
  }

  @override
  double? getSelectedLongitude() {
    final box = Hive.box<String>(selectedCityBox);
    return double.tryParse(box.get(_selectedLongitudeKey) ?? '');
  }

  @override
  Future<void> savePrayerSchedule(
    String cityId,
    String date,
    PrayerScheduleModel schedule,
  ) async {
    final box = Hive.box<String>(prayerCacheBox);
    await box.put(_scheduleKey(cityId, date), jsonEncode(schedule.toHiveMap()));
  }

  @override
  PrayerScheduleModel? getCachedSchedule(String cityId, String date) {
    final box = Hive.box<String>(prayerCacheBox);
    final raw = box.get(_scheduleKey(cityId, date));
    if (raw == null) return null;
    return PrayerScheduleModel.fromHiveMap(
      jsonDecode(raw) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> saveMonthlySchedules(
    String cityId,
    int year,
    int month,
    Map<String, PrayerScheduleModel> schedules,
  ) async {
    final box = Hive.box<String>(prayerCacheBox);
    final mm = month.toString().padLeft(2, '0');
    final prefix = '$cityId:$year-$mm-';
    final keysToDelete = box.keys
        .where((key) => key.toString().startsWith(prefix))
        .toList();
    await box.deleteAll(keysToDelete);

    final entries = <String, String>{};
    for (final entry in schedules.entries) {
      entries[_scheduleKey(cityId, entry.key)] =
          jsonEncode(entry.value.toHiveMap());
    }
    await box.putAll(entries);
  }
}
