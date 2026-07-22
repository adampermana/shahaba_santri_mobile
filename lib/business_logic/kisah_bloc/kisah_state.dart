part of 'kisah_bloc.dart';

@freezed
abstract class KisahState with _$KisahState {
  const factory KisahState({
    // Fetch list
    required bool fetchKisahLoading,
    required bool fetchKisahSuccess,
    required String fetchKisahErrorMessage,
    required int fetchKisahStatusCode,
    required KisahResponse? kisahResponse,
    // Fetch detail
    required bool fetchDetailLoading,
    required bool fetchDetailSuccess,
    required String fetchDetailErrorMessage,
    required KisahData? kisahDetail,
  }) = _KisahState;

  factory KisahState.initial() => const KisahState(
        fetchKisahLoading: false,
        fetchKisahSuccess: false,
        fetchKisahErrorMessage: '',
        fetchKisahStatusCode: 0,
        kisahResponse: null,
        fetchDetailLoading: false,
        fetchDetailSuccess: false,
        fetchDetailErrorMessage: '',
        kisahDetail: null,
      );
}
