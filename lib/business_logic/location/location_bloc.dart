import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import 'package:sahaba_mobile/infrastructure/failures/alert.dart';
import 'package:sahaba_mobile/infrastructure/services/location_permission_service.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(this._locationInfoService) : super(LocationState.initial()) {
    on<_Started>(_onStarted);
    on<_GetCurrentLocation>(
      _onGetCurrentLocation,
    );
    on<_GetPlaceMark>(_onGetPlaceMark);
  }

  final LocationPermissionService _locationInfoService;

  Future<void> _onStarted(_Started event, Emitter<LocationState> emit) async {
    add(const LocationEvent.getCurrentLocation(isGetPosition: true));
  }

  Future<void> _onGetCurrentLocation(
    _GetCurrentLocation event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, alert: null));
    final result = await _locationInfoService.getCurrentPosition();

    await result.fold(
      (l) async {
        emit(
          state.copyWith(
            isLoading: false,
            alert: Alert.fromFailures(l),
            titleError: l.title,
            messageError: l.message,
            position: null,
            locations: null,
            latitude: 0,
            longitude: 0,
          ),
        );
      },
      (r) async {
        emit(
          state.copyWith(
            isLoading: false,
            position: r,
            locations: {'latitude': r.latitude, 'longitude': r.longitude},
            latitude: r.latitude,
            longitude: r.longitude,
            alert: null,
            titleError: '',
            messageError: '',
          ),
        );
        add(LocationEvent.getPlaceMark(position: r));
      },
    );
  }

  Future<void> _onGetPlaceMark(
    _GetPlaceMark event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(location: null));
    final location = await _locationInfoService.getLocationPlaceMark(
      event.position.latitude,
      event.position.longitude,
    );
    emit(state.copyWith(location: location));
  }
}
