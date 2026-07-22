import 'package:dio/dio.dart';
import 'package:sahaba_mobile/domains/news/news_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/news/datasources/i_news_remote_datasource.dart';

class NewsRemoteDatasource implements INewsRemoteDatasource {
  NewsRemoteDatasource(this._dio);

  final Dio _dio;

  @override
  Future<NewsResponse> getNewsList() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/api/v1/news');

      final data = response.data;
      if (data == null) {
        throw ServerException.withMessage(
          title: 'Error',
          message: 'Gagal memuat data berita',
        );
      }

      return NewsResponse.fromJson(data);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<NewsData> getNewsDetail(int id) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/api/v1/news/$id');

      final data = response.data;
      if (data == null) {
        throw ServerException.withMessage(
          title: 'Error',
          message: 'Gagal memuat detail berita',
        );
      }

      return NewsDetailResponse.fromJson(data).data!;
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }
}
