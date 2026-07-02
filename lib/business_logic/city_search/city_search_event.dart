part of 'city_search_bloc.dart';

@freezed
class CitySearchEvent with _$CitySearchEvent {
  const factory CitySearchEvent.getAllCities() = _GetAllCities;
  const factory CitySearchEvent.searchCity(String keyword) = _SearchCity;
  const factory CitySearchEvent.clearSearch() = _ClearSearch;
}
