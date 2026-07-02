import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/i_prayer_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/i_prayer_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/i_prayer_repository.dart';

class PrayerRepository implements IPrayerRepository {
  PrayerRepository(
    this._remote,
    this._local,
    this._connectivity,
  );

  final IPrayerRemoteDatasource _remote;
  final IPrayerLocalDatasource _local;
  final Connectivity _connectivity;

  Future<bool> _isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
  }

  @override
  Future<Either<Failure, List<CityModel>>> searchCity(
    String keyword,
  ) async {
    try {
      if (!await _isConnected()) {
        return const Left(
          ServerFailures(
            statusCode: -4,
            title: 'Tidak ada koneksi',
            message: 'Periksa koneksi internet Anda',
          ),
        );
      }
      final result = await _remote.searchCity(keyword);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CityModel>>> getAllCities() async {
    try {
      if (!await _isConnected()) {
        return const Left(
          ServerFailures(
            statusCode: -4,
            title: 'Tidak ada koneksi',
            message: 'Periksa koneksi internet Anda',
          ),
        );
      }
      final result = await _remote.getAllCities();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PrayerScheduleResponse>> getPrayerSchedule(
    String cityId,
    DateTime date,
  ) async {
    try {
      final cacheKey =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      if (!await _isConnected()) {
        final cached = _local.getCachedSchedule(cityId, cacheKey);
        if (cached != null) {
          return Right(
            PrayerScheduleResponse(jadwal: cached),
          );
        }
        return const Left(
          CacheFailure(message: 'Tidak ada data tersimpan'),
        );
      }

      final result = await _remote.getPrayerSchedule(
        cityId,
        date.year,
        date.month,
        date.day,
      );
      if (result.jadwal != null) {
        await _local.savePrayerSchedule(cityId, cacheKey, result.jadwal!);
      }
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CityModel>> getSelectedCity() async {
    try {
      final city = _local.getSelectedCity();
      if (city == null) {
        return Right(
          CityModel(
            id: '58a2fc6ed39fd083f55d4182bf88826d',
            lokasi: 'KOTA JAKARTA',
          ),
        );
      }
      return Right(city);
    } on Exception catch (e) {
      return Left(
        CacheFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> saveSelectedCity(CityModel city) async {
    try {
      if (city.id == null || city.id!.trim().isEmpty) {
        return const Left(
          CacheFailure(message: 'ID kota tidak valid'),
        );
      }
      await _local.saveSelectedCity(city);
      return const Right(unit);
    } on Exception catch (e) {
      return Left(
        CacheFailure(message: e.toString()),
      );
    }
  }
}
