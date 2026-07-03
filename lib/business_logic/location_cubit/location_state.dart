import 'package:sahaba_mobile/domains/city_model/city_model.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  LocationLoaded(this.city);

  final CityModel city;
}

class LocationError extends LocationState {
  LocationError(this.message);

  final String message;
}
