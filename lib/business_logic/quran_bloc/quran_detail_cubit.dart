import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_state.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/infrastructure/quran/repository/i_quran_repository.dart';

class QuranDetailCubit extends Cubit<QuranDetailState> {
  QuranDetailCubit(this._repository) : super(QuranDetailInitial());

  final IQuranRepository _repository;

  Future<void> load(QuranDetailArgs args) async {
    emit(QuranDetailLoading());

    final result = switch (args.type) {
      QuranDetailType.surah when args.surah != null =>
        await _repository.getSurahDetail(args.surah!),
      QuranDetailType.juz when args.juz != null =>
        await _repository.getJuzDetail(args.juz!),
      _ => null,
    };

    if (result == null) {
      emit(QuranDetailError('Data Quran tidak valid'));
      return;
    }

    result.fold(
      (f) => emit(QuranDetailError(f.message)),
      (detail) => emit(QuranDetailLoaded(detail)),
    );
  }
}
