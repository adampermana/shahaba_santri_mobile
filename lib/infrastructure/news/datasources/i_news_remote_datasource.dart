import 'package:sahaba_mobile/domains/news/news_response.dart';

abstract class INewsRemoteDatasource {
  Future<NewsResponse> getNewsList();
  Future<NewsData> getNewsDetail(int id);
}
