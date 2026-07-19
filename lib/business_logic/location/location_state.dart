part of 'location_bloc.dart';

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState({
    required bool isLoading,
    required String titleError,
    required String messageError,
    required Position? position,
    required Alert? alert,
    required Map<String, double>? locations,
    required String? location,
    required double latitude,
    required double longitude,
  }) = _LocationState;

  factory LocationState.initial() => const LocationState(
    isLoading: false,
    titleError: '',
    messageError: '',
    position: null,
    alert: null,
    locations: null,
    location: null,
    latitude: 0,
    longitude: 0,
  );
}
