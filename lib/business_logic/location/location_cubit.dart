import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sahaba_mobile/business_logic/location/location_state.dart';
import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/i_prayer_repository.dart';
import 'package:sahaba_mobile/infrastructure/services/location_permission_service.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this._repository, this._locationPermissionService)
    : super(LocationInitial());

  final IPrayerRepository _repository;
  final LocationPermissionService _locationPermissionService;

  static final CityModel defaultCity = CityModel(
    id: '58a2fc6ed39fd083f55d4182bf88826d',
    lokasi: 'KOTA JAKARTA',
  );

  Future<void> loadSavedCity() async {
    emit(LocationLoading());
    final result = await _repository.getSelectedCity();
    result.fold(
      (f) => emit(LocationError(f.message)),
      (r) => emit(LocationLoaded(r)),
    );
  }

  Future<void> selectCity(CityModel city) async {
    if (city.id == null || city.id!.trim().isEmpty) {
      emit(LocationError('ID kota tidak valid'));
      return;
    }

    emit(LocationLoading());
    final result = await _repository.saveSelectedCity(city);
    result.fold(
      (f) => emit(LocationError(f.message)),
      (_) => emit(LocationLoaded(city)),
    );
  }

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());
    try {
      final positionResult = await _locationPermissionService
          .getCurrentPosition();

      await positionResult.fold<Future<void>>(
        (f) async => emit(LocationError(f.message)),
        (position) async {
          final placemarks = await placemarkFromCoordinates(
            position.latitude,
            position.longitude,
          );

          if (placemarks.isEmpty) {
            emit(LocationError('Gagal mendapatkan nama kota'));
            return;
          }

          final placemark = placemarks.first;
          final keywords =
              {
                    placemark.subAdministrativeArea,
                    placemark.locality,
                    placemark.administrativeArea,
                  }
                  .whereType<String>()
                  .map((keyword) => keyword.trim())
                  .where((keyword) => keyword.isNotEmpty);

          String? lastErrorMessage;
          for (final keyword in keywords) {
            final result = await _repository.searchCity(keyword);
            final city = result.fold<CityModel?>(
              (f) {
                lastErrorMessage = f.message;
                return null;
              },
              (cities) => cities.isEmpty ? null : cities.first,
            );

            if (city != null) {
              final saveResult = await _repository.saveSelectedCity(city);
              saveResult.fold(
                (f) => emit(LocationError(f.message)),
                (_) => emit(LocationLoaded(city)),
              );
              return;
            }
          }

          emit(
            LocationError(
              lastErrorMessage ?? 'Kota terdekat tidak ditemukan',
            ),
          );
        },
      );
    } on Exception catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
