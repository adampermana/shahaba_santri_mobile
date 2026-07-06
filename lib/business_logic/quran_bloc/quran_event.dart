part of 'quran_bloc.dart';

@freezed
class QuranEvent with _$QuranEvent {
  const factory QuranEvent.loadSurahs() = _LoadSurahs;
  const factory QuranEvent.loadJuz() = _LoadJuz;
  const factory QuranEvent.changeTab(int index) = _ChangeTab;
  const factory QuranEvent.search(String keyword) = _Search;
}
