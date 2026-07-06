import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/quran/repository/i_quran_repository.dart';

part 'quran_event.dart';
part 'quran_state.dart';
part 'quran_bloc.freezed.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc(this._repository) : super(QuranState.initial()) {
    on<_LoadSurahs>(_onLoadSurahs);
    on<_LoadJuz>(_onLoadJuz);
    on<_ChangeTab>(_onChangeTab);
    on<_Search>(_onSearch);
  }

  final IQuranRepository _repository;

  Future<void> _onLoadSurahs(
    _LoadSurahs event,
    Emitter<QuranState> emit,
  ) async {
    emit(
      state.copyWith(
        surahsLoading: true,
        surahsSuccess: false,
        surahsError: '',
      ),
    );

    final result = await _repository.getAllSurahs();

    result.fold(
      (f) => emit(
        state.copyWith(
          surahsLoading: false,
          surahsSuccess: false,
          surahsError: f.message,
        ),
      ),
      (surahs) {
        final filtered = _filterSurahs(surahs, state.searchKeyword);
        emit(
          state.copyWith(
            surahsLoading: false,
            surahsSuccess: true,
            surahsError: '',
            surahs: surahs,
            filteredSurahs: filtered,
          ),
        );
      },
    );
  }

  Future<void> _onLoadJuz(
    _LoadJuz event,
    Emitter<QuranState> emit,
  ) async {
    emit(
      state.copyWith(juzLoading: true, juzSuccess: false, juzError: ''),
    );

    final result = await _repository.getAllJuz();

    result.fold(
      (f) => emit(
        state.copyWith(
          juzLoading: false,
          juzSuccess: false,
          juzError: f.message,
        ),
      ),
      (juzList) {
        final filtered = _filterJuz(juzList, state.searchKeyword);
        emit(
          state.copyWith(
            juzLoading: false,
            juzSuccess: true,
            juzError: '',
            juzList: juzList,
            filteredJuz: filtered,
          ),
        );
      },
    );
  }

  void _onChangeTab(_ChangeTab event, Emitter<QuranState> emit) {
    emit(state.copyWith(currentTab: event.index));
  }

  void _onSearch(_Search event, Emitter<QuranState> emit) {
    final keyword = event.keyword;
    emit(
      state.copyWith(
        searchKeyword: keyword,
        filteredSurahs: _filterSurahs(state.surahs, keyword),
        filteredJuz: _filterJuz(state.juzList, keyword),
      ),
    );
  }

  List<SurahModel> _filterSurahs(List<SurahModel> surahs, String keyword) {
    if (keyword.isEmpty) return surahs;
    final lower = keyword.toLowerCase();
    return surahs.where((s) {
      return (s.title?.toLowerCase().contains(lower) ?? false) ||
          (s.titleAr?.contains(keyword) ?? false) ||
          (s.index?.contains(keyword) ?? false);
    }).toList();
  }

  List<JuzModel> _filterJuz(List<JuzModel> juzList, String keyword) {
    if (keyword.isEmpty) return juzList;
    final lower = keyword.toLowerCase();
    return juzList.where((j) {
      return (j.start?.name?.toLowerCase().contains(lower) ?? false) ||
          ('juz ${j.index}'.contains(lower));
    }).toList();
  }
}
