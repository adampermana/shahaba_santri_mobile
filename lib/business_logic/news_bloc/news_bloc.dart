import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/news/news_response.dart';
import 'package:sahaba_mobile/infrastructure/news/repository/i_news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this._repository) : super(NewsState.initial()) {
    on<_FetchNewsList>(_onFetchNewsList);
    on<_FetchNewsDetail>(_onFetchNewsDetail);
  }

  final INewsRepository _repository;

  Future<void> _onFetchNewsList(
    _FetchNewsList event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchNewsLoading: true,
        fetchNewsSuccess: false,
        fetchNewsErrorMessage: '',
        fetchNewsStatusCode: 0,
      ),
    );

    final result = await _repository.getNewsList();

    result.fold(
      (f) => emit(
        state.copyWith(
          fetchNewsLoading: false,
          fetchNewsSuccess: false,
          fetchNewsErrorMessage: f.message,
          newsResponse: null,
        ),
      ),
      (r) => emit(
        state.copyWith(
          fetchNewsLoading: false,
          fetchNewsSuccess: true,
          newsResponse: r,
        ),
      ),
    );
  }

  Future<void> _onFetchNewsDetail(
    _FetchNewsDetail event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchDetailLoading: true,
        fetchDetailSuccess: false,
        fetchDetailErrorMessage: '',
        newsDetail: null,
      ),
    );

    final result = await _repository.getNewsDetail(event.id);

    result.fold(
      (f) => emit(
        state.copyWith(
          fetchDetailLoading: false,
          fetchDetailSuccess: false,
          fetchDetailErrorMessage: f.message,
          newsDetail: null,
        ),
      ),
      (r) => emit(
        state.copyWith(
          fetchDetailLoading: false,
          fetchDetailSuccess: true,
          newsDetail: r,
        ),
      ),
    );
  }
}
