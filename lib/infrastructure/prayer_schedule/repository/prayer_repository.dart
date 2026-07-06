import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
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

  String _dateKey(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
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
      final cacheKey = _dateKey(date);

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

      final monthly = await _remote.getMonthlyPrayerSchedule(
        cityId,
        date.year,
        date.month,
      );
      await _local.saveMonthlySchedules(
        cityId,
        date.year,
        date.month,
        monthly.jadwal,
      );
      final schedule = monthly.jadwal[cacheKey];
      return Right(PrayerScheduleResponse(jadwal: schedule));
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
  Either<Failure, PrayerScheduleModel?> getCachedSchedule(
    String cityId,
    DateTime date,
  ) {
    try {
      final cached = _local.getCachedSchedule(cityId, _dateKey(date));
      return Right(cached);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> fetchAndSaveYearSchedule(
    String cityId,
    int year,
  ) async {
    if (!await _isConnected()) {
      return const Left(
        ServerFailures(
          statusCode: -4,
          title: 'Tidak ada koneksi',
          message: 'Periksa koneksi internet Anda',
        ),
      );
    }

    final uncachedMonths = <int>[];
    for (var month = 1; month <= 12; month++) {
      final firstDay = DateTime(year, month, 1);
      if (_local.getCachedSchedule(cityId, _dateKey(firstDay)) == null) {
        uncachedMonths.add(month);
      }
    }

    if (uncachedMonths.isEmpty) return const Right(unit);

    await Future.wait(
      uncachedMonths.map((month) async {
        try {
          final result = await _remote.getMonthlyPrayerSchedule(
            cityId,
            year,
            month,
          );
          await _local.saveMonthlySchedules(
            cityId,
            year,
            month,
            result.jadwal,
          );
        } on Exception catch (e) {
          debugPrint('Failed to fetch schedule for $year-$month: $e');
        }
      }),
    );

    return const Right(unit);
  }

  @override
  Future<Either<Failure, CityModel>> getSelectedCity() async {
    try {
      final city = _local.getSelectedCity();
      if (city == null) {
        return Right(
          CityModel(
            id: '58a2fc6ed39fd083f55d4182bf88826d',
            lokasi: 'JAKARTA',
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

  @override
  Future<Either<Failure, Unit>> saveSelectedCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      if (!latitude.isFinite || !longitude.isFinite) {
        return const Left(
          CacheFailure(message: 'Koordinat lokasi tidak valid'),
        );
      }

      await _local.saveSelectedCoordinates(
        latitude: latitude,
        longitude: longitude,
      );
      return const Right(unit);
    } on Exception catch (e) {
      return Left(
        CacheFailure(message: e.toString()),
      );
    }
  }

  @override
  Either<Failure, PrayerCoordinate?> getSelectedCoordinates() {
    try {
      final latitude = _local.getSelectedLatitude();
      final longitude = _local.getSelectedLongitude();

      if (latitude == null || longitude == null) {
        return const Right(null);
      }

      return Right((latitude: latitude, longitude: longitude));
    } on Exception catch (e) {
      return Left(
        CacheFailure(message: e.toString()),
      );
    }
  }
}
