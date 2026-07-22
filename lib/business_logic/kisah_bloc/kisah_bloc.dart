import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/infrastructure/kisah/repository/i_kisah_repository.dart';

part 'kisah_event.dart';
part 'kisah_state.dart';
part 'kisah_bloc.freezed.dart';

class KisahBloc extends Bloc<KisahEvent, KisahState> {
  KisahBloc(this._repository) : super(KisahState.initial()) {
    on<_FetchKisahList>(_onFetchKisahList);
    on<_FetchKisahDetail>(_onFetchKisahDetail);
  }

  final IKisahRepository _repository;

  Future<void> _onFetchKisahList(
    _FetchKisahList event,
    Emitter<KisahState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchKisahLoading: true,
        fetchKisahSuccess: false,
        fetchKisahErrorMessage: '',
        fetchKisahStatusCode: 0,
      ),
    );

    final result = await _repository.getKisahList();

    result.fold(
      (f) => emit(
        state.copyWith(
          fetchKisahLoading: false,
          fetchKisahSuccess: false,
          fetchKisahErrorMessage: f.message,
          kisahResponse: null,
        ),
      ),
      (r) => emit(
        state.copyWith(
          fetchKisahLoading: false,
          fetchKisahSuccess: true,
          kisahResponse: r,
        ),
      ),
    );
  }

  Future<void> _onFetchKisahDetail(
    _FetchKisahDetail event,
    Emitter<KisahState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchDetailLoading: true,
        fetchDetailSuccess: false,
        fetchDetailErrorMessage: '',
        kisahDetail: null,
      ),
    );

    final result = await _repository.getKisahDetail(event.id);

    result.fold(
      (f) => emit(
        state.copyWith(
          fetchDetailLoading: false,
          fetchDetailSuccess: false,
          fetchDetailErrorMessage: f.message,
          kisahDetail: null,
        ),
      ),
      (r) => emit(
        state.copyWith(
          fetchDetailLoading: false,
          fetchDetailSuccess: true,
          kisahDetail: r,
        ),
      ),
    );
  }
}
