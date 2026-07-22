part of 'kisah_bloc.dart';

@freezed
class KisahEvent with _$KisahEvent {
  const factory KisahEvent.fetchKisahList() = _FetchKisahList;
  const factory KisahEvent.fetchKisahDetail(int id) = _FetchKisahDetail;
}
