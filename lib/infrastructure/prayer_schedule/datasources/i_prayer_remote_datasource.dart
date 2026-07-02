import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';

abstract class IPrayerRemoteDatasource {
  Future<List<CityModel>> searchCity(String keyword);
  Future<List<CityModel>> getAllCities();
  Future<PrayerScheduleResponse> getPrayerSchedule(
    String cityId,
    int year,
    int month,
    int day,
  );
}
