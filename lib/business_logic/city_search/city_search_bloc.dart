import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/i_prayer_repository.dart';

part 'city_search_bloc.freezed.dart';
part 'city_search_event.dart';
part 'city_search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  CitySearchBloc(this._repository) : super(CitySearchState.initial()) {
    on<_GetAllCities>(_onGetAllCities);
    on<_SearchCity>(_onSearchCity);
    on<_ClearSearch>(_onClearSearch);
  }

  final IPrayerRepository _repository;
  String _lastKeyword = '';

  Future<void> _onGetAllCities(
    _GetAllCities event,
    Emitter<CitySearchState> emit,
  ) async {
    emit(
      state.copyWith(
        getAllCitiesLoading: true,
        getAllCitiesSuccess: false,
        getAllCitiesErrorMessage: '',
        searchCityLoading: false,
        searchCitySuccess: false,
        searchCityErrorMessage: '',
      ),
    );

    final result = await _repository.getAllCities();

    result.fold(
      (f) => emit(
        state.copyWith(
          getAllCitiesLoading: false,
          getAllCitiesSuccess: false,
          getAllCitiesErrorMessage: f.message,
          cities: [],
        ),
      ),
      (r) => emit(
        state.copyWith(
          getAllCitiesLoading: false,
          getAllCitiesSuccess: true,
          getAllCitiesErrorMessage: '',
          cities: r,
        ),
      ),
    );
  }

  Future<void> _onSearchCity(
    _SearchCity event,
    Emitter<CitySearchState> emit,
  ) async {
    final keyword = event.keyword.trim();
    if (keyword == _lastKeyword) return;
    _lastKeyword = keyword;

    if (keyword.isEmpty) {
      emit(
        state.copyWith(
          searchCityLoading: false,
          searchCitySuccess: false,
          searchCityErrorMessage: '',
          searchResults: [],
        ),
      );
      if (state.cities.isEmpty && !state.getAllCitiesLoading) {
        add(const CitySearchEvent.getAllCities());
      }
      return;
    }

    emit(
      state.copyWith(
        searchCityLoading: true,
        searchCitySuccess: false,
        searchCityErrorMessage: '',
      ),
    );

    final result = await _repository.searchCity(keyword);

    result.fold(
      (f) => emit(
        state.copyWith(
          searchCityLoading: false,
          searchCitySuccess: false,
          searchCityErrorMessage: f.message,
          searchResults: [],
        ),
      ),
      (r) => emit(
        state.copyWith(
          searchCityLoading: false,
          searchCitySuccess: true,
          searchCityErrorMessage: '',
          searchResults: r,
        ),
      ),
    );
  }

  Future<void> _onClearSearch(
    _ClearSearch event,
    Emitter<CitySearchState> emit,
  ) async {
    _lastKeyword = '';
    emit(
      state.copyWith(
        searchCityLoading: false,
        searchCitySuccess: false,
        searchCityErrorMessage: '',
        searchResults: [],
      ),
    );
    if (state.cities.isEmpty && !state.getAllCitiesLoading) {
      add(const CitySearchEvent.getAllCities());
    }
  }
}
