import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/news/news_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class INewsRepository {
  Future<Either<Failure, NewsResponse>> getNewsList();
  Future<Either<Failure, NewsData>> getNewsDetail(int id);
}
