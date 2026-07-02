import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class IPrayerRepository {
  Future<Either<Failure, List<CityModel>>> searchCity(String keyword);
  Future<Either<Failure, List<CityModel>>> getAllCities();
  Future<Either<Failure, PrayerScheduleResponse>> getPrayerSchedule(
    String cityId,
    DateTime date,
  );
  Future<Either<Failure, CityModel>> getSelectedCity();
  Future<Either<Failure, Unit>> saveSelectedCity(CityModel city);
}
