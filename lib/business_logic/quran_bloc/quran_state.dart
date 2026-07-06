part of 'quran_bloc.dart';

@freezed
abstract class QuranState with _$QuranState {
  const factory QuranState({
    @Default(0) int currentTab,
    // Surah
    @Default(false) bool surahsLoading,
    @Default(false) bool surahsSuccess,
    @Default('') String surahsError,
    @Default(<SurahModel>[]) List<SurahModel> surahs,
    // Juz
    @Default(false) bool juzLoading,
    @Default(false) bool juzSuccess,
    @Default('') String juzError,
    @Default(<JuzModel>[]) List<JuzModel> juzList,
    // Search
    @Default('') String searchKeyword,
    @Default(<SurahModel>[]) List<SurahModel> filteredSurahs,
    @Default(<JuzModel>[]) List<JuzModel> filteredJuz,
  }) = _QuranState;

  factory QuranState.initial() => const QuranState();
}
