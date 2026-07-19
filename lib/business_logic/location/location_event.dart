part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.started() = _Started;
  const factory LocationEvent.getCurrentLocation({
    required bool isGetPosition,
  }) = _GetCurrentLocation;
  const factory LocationEvent.getPlaceMark({required Position position}) =
      _GetPlaceMark;
}
