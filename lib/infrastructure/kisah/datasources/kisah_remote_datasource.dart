import 'package:dio/dio.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/kisah/datasources/i_kisah_remote_datasource.dart';

class KisahRemoteDatasource implements IKisahRemoteDatasource {
  KisahRemoteDatasource(this._dio);

  final Dio _dio;

  @override
  Future<KisahResponse> getKisahList() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/api/v1/kisah');

      final data = response.data;
      if (data == null) {
        throw ServerException.withMessage(
          title: 'Error',
          message: 'Gagal memuat data kisah',
        );
      }

      return KisahResponse.fromJson(data);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<KisahData> getKisahDetail(int id) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/api/v1/kisah/$id');

      final data = response.data;
      if (data == null) {
        throw ServerException.withMessage(
          title: 'Error',
          message: 'Gagal memuat detail kisah',
        );
      }

      return KisahDetailResponse.fromJson(data).data!;
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }
}
