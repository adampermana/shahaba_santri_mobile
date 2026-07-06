import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';

abstract class IPrayerLocalDatasource {
  Future<void> saveSelectedCity(CityModel city);
  CityModel? getSelectedCity();
  Future<void> saveSelectedCoordinates({
    required double latitude,
    required double longitude,
  });
  double? getSelectedLatitude();
  double? getSelectedLongitude();
  Future<void> savePrayerSchedule(
    String cityId,
    String date,
    PrayerScheduleModel schedule,
  );
  PrayerScheduleModel? getCachedSchedule(String cityId, String date);
  Future<void> saveMonthlySchedules(
    String cityId,
    int year,
    int month,
    Map<String, PrayerScheduleModel> schedules,
  );
}
