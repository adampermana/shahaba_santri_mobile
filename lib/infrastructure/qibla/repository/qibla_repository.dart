import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/i_prayer_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/qibla/repository/i_qibla_repository.dart';

class QiblaRepository implements IQiblaRepository {
  QiblaRepository(this._remote, this._connectivity);

  final IPrayerRemoteDatasource _remote;
  final Connectivity _connectivity;

  static const _kaabaLatitude = 21.4225;
  static const _kaabaLongitude = 39.8262;

  Future<bool> _isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
  }

  @override
  Future<Either<Failure, double>> getQiblaDirection(
    double latitude,
    double longitude,
  ) async {
    if (!latitude.isFinite || !longitude.isFinite) {
      return const Left(
        ServerFailures(
          statusCode: -1,
          title: 'Lokasi tidak valid',
          message: 'Gagal menghitung arah kiblat.',
        ),
      );
    }

    try {
      if (!await _isConnected()) {
        return Right(_calculateQiblaDirection(latitude, longitude));
      }

      final result = await _remote.getQibla(latitude, longitude);
      return Right(_normalizeAngle(result.bearing));
    } on ServerException {
      return Right(_calculateQiblaDirection(latitude, longitude));
    } on Exception {
      return Right(_calculateQiblaDirection(latitude, longitude));
    }
  }

  double _calculateQiblaDirection(double latitude, double longitude) {
    final latRad = _toRadians(latitude);
    final lngRad = _toRadians(longitude);
    final kaabaLatRad = _toRadians(_kaabaLatitude);
    final kaabaLngRad = _toRadians(_kaabaLongitude);

    final deltaLng = kaabaLngRad - lngRad;
    final y = sin(deltaLng) * cos(kaabaLatRad);
    final x =
        cos(latRad) * sin(kaabaLatRad) -
        sin(latRad) * cos(kaabaLatRad) * cos(deltaLng);

    return _normalizeAngle(atan2(y, x) * 180 / pi);
  }

  double _toRadians(double degrees) => degrees * pi / 180;

  double _normalizeAngle(double angle) => (angle % 360 + 360) % 360;
}
