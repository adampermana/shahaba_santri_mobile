part of 'city_search_bloc.dart';

@freezed
abstract class CitySearchState with _$CitySearchState {
  const factory CitySearchState({
    // Get All Cities
    @Default(false) bool getAllCitiesLoading,
    @Default(false) bool getAllCitiesSuccess,
    @Default('') String getAllCitiesErrorMessage,
    @Default(<CityModel>[]) List<CityModel> cities,

    // Search City
    @Default(false) bool searchCityLoading,
    @Default(false) bool searchCitySuccess,
    @Default('') String searchCityErrorMessage,
    @Default(<CityModel>[]) List<CityModel> searchResults,
  }) = _CitySearchState;

  factory CitySearchState.initial() => const CitySearchState();
}
