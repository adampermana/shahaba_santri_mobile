part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.fetchNewsList() = _FetchNewsList;
  const factory NewsEvent.fetchNewsDetail(int id) = _FetchNewsDetail;
}
