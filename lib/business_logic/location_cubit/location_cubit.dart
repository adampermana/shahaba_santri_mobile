import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_state.dart';
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
    lokasi: 'Jakarta',
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
          final keywords = _locationSearchKeywords(placemark);

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
              await _saveCityWithCoordinates(
                city: city,
                latitude: position.latitude,
                longitude: position.longitude,
              );
              return;
            }
          }

          if (_isJakartaLocation(keywords)) {
            await _saveCityWithCoordinates(
              city: defaultCity,
              latitude: position.latitude,
              longitude: position.longitude,
            );
            return;
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

  Future<void> _saveCityWithCoordinates({
    required CityModel city,
    required double latitude,
    required double longitude,
  }) async {
    final saveCityResult = await _repository.saveSelectedCity(city);
    await saveCityResult.fold<Future<void>>(
      (f) async => emit(LocationError(f.message)),
      (_) async {
        final saveCoordinateResult = await _repository.saveSelectedCoordinates(
          latitude: latitude,
          longitude: longitude,
        );
        saveCoordinateResult.fold(
          (f) => emit(LocationError(f.message)),
          (_) => emit(LocationLoaded(city)),
        );
      },
    );
  }

  List<String> _locationSearchKeywords(Placemark placemark) {
    final keywords = <String>[];

    void addKeyword(String? value) {
      final keyword = value?.trim();
      if (keyword == null || keyword.isEmpty) return;

      for (final candidate in _locationKeywordCandidates(keyword)) {
        if (!keywords.contains(candidate)) {
          keywords.add(candidate);
        }
      }
    }

    addKeyword(placemark.subAdministrativeArea);
    addKeyword(placemark.locality);
    addKeyword(placemark.administrativeArea);

    return keywords;
  }

  List<String> _locationKeywordCandidates(String keyword) {
    final candidates = <String>[keyword];
    final normalized = keyword
        .replaceFirst(
          RegExp(
            r'^(Kota Administrasi|Kota|Kabupaten|Kab\.|Kecamatan|Provinsi)\s+',
            caseSensitive: false,
          ),
          '',
        )
        .trim();

    if (normalized.isNotEmpty && normalized != keyword) {
      candidates.add(normalized);
    }

    final lowerKeyword = keyword.toLowerCase();
    final lowerNormalized = normalized.toLowerCase();
    if (lowerKeyword.contains('daerah khusus ibukota jakarta') ||
        lowerKeyword.contains('dki jakarta') ||
        lowerNormalized.contains('jakarta')) {
      candidates.add('Jakarta');
    }

    return candidates;
  }

  bool _isJakartaLocation(List<String> keywords) {
    return keywords.any((keyword) => keyword.toLowerCase().contains('jakarta'));
  }
}
