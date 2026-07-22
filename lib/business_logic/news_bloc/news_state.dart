part of 'news_bloc.dart';

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState({
    // Fetch list
    required bool fetchNewsLoading,
    required bool fetchNewsSuccess,
    required String fetchNewsErrorMessage,
    required int fetchNewsStatusCode,
    required NewsResponse? newsResponse,
    // Fetch detail
    required bool fetchDetailLoading,
    required bool fetchDetailSuccess,
    required String fetchDetailErrorMessage,
    required NewsData? newsDetail,
  }) = _NewsState;

  factory NewsState.initial() => const NewsState(
        fetchNewsLoading: false,
        fetchNewsSuccess: false,
        fetchNewsErrorMessage: '',
        fetchNewsStatusCode: 0,
        newsResponse: null,
        fetchDetailLoading: false,
        fetchDetailSuccess: false,
        fetchDetailErrorMessage: '',
        newsDetail: null,
      );
}
