import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/news/news_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/news/datasources/i_news_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/news/repository/i_news_repository.dart';

class NewsRepository implements INewsRepository {
  NewsRepository(this._remote);

  final INewsRemoteDatasource _remote;

  @override
  Future<Either<Failure, NewsResponse>> getNewsList() async {
    try {
      final response = await _remote.getNewsList();
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NewsData>> getNewsDetail(int id) async {
    try {
      final response = await _remote.getNewsDetail(id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }
}
