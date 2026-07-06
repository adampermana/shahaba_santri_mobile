import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_state.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/i_prayer_repository.dart';
import 'package:sahaba_mobile/infrastructure/qibla/repository/i_qibla_repository.dart';

class QiblaCubit extends Cubit<QiblaState> {
  QiblaCubit(this._repository, this._prayerRepository) : super(QiblaInitial());

  final IQiblaRepository _repository;
  final IPrayerRepository _prayerRepository;

  StreamSubscription<CompassEvent>? _compassSub;

  static const _qiblaThreshold = 15.0;
  static const _defaultLatitude = -6.200000;
  static const _defaultLongitude = 106.816666;

  Future<void> loadQibla() async {
    await _cancelCompassSubscription();
    emit(QiblaLoading());

    final coordinateResult = _prayerRepository.getSelectedCoordinates();
    final coordinates = coordinateResult.fold<PrayerCoordinate>(
      (_) => (latitude: _defaultLatitude, longitude: _defaultLongitude),
      (coordinate) =>
          coordinate ??
          (latitude: _defaultLatitude, longitude: _defaultLongitude),
    );

    final result = await _repository.getQiblaDirection(
      coordinates.latitude,
      coordinates.longitude,
    );

    if (isClosed) return;

    result.fold(
      (f) => emit(QiblaError(f.message)),
      _startCompass,
    );
  }

  void _startCompass(double qiblaDirection) {
    final compass = FlutterCompass.events;
    if (compass == null) {
      emit(QiblaError('Sensor kompas tidak tersedia'));
      return;
    }

    final normalizedQiblaDirection = _normalizeAngle(qiblaDirection);
    _compassSub = compass.listen(
      (event) {
        final eventHeading = event.heading;
        if (eventHeading == null || isClosed) return;

        final heading = _normalizeAngle(eventHeading);
        emit(
          QiblaLoaded(
            heading: heading,
            qiblaDirection: normalizedQiblaDirection,
            isFacingQibla: _isFacingQibla(heading, normalizedQiblaDirection),
          ),
        );
      },
      onError: (_) {
        if (!isClosed) emit(QiblaError('Sensor kompas tidak tersedia'));
      },
    );
  }

  bool _isFacingQibla(double heading, double qiblaDirection) {
    final diff = _normalizeAngle(qiblaDirection - heading);
    final shortestAngle = diff > 180 ? 360 - diff : diff;
    return shortestAngle <= _qiblaThreshold;
  }

  double _normalizeAngle(double angle) => (angle % 360 + 360) % 360;

  Future<void> _cancelCompassSubscription() async {
    await _compassSub?.cancel();
    _compassSub = null;
  }

  @override
  Future<void> close() async {
    await _cancelCompassSubscription();
    return super.close();
  }
}
