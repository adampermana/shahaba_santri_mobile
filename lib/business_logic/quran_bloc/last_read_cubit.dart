import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_state.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/infrastructure/quran/repository/i_quran_repository.dart';

class LastReadCubit extends Cubit<LastReadState> {
  LastReadCubit(this._repository) : super(LastReadInitial());

  final IQuranRepository _repository;

  Future<void> load() async {
    final result = await _repository.getLastRead();
    result.fold(
      (f) => emit(LastReadError(f.message)),
      (lastRead) => emit(LastReadLoaded(lastRead)),
    );
  }

  Future<void> save(QuranLastReadModel lastRead) async {
    final result = await _repository.saveLastRead(lastRead);
    result.fold(
      (f) => emit(LastReadError(f.message)),
      (_) => emit(LastReadLoaded(lastRead)),
    );
  }
}
