import 'package:dio/dio.dart';
import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/domains/qibla/qibla_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/i_prayer_remote_datasource.dart';

class PrayerRemoteDatasource implements IPrayerRemoteDatasource {
  PrayerRemoteDatasource(this._dio);

  final Dio _dio;

  @override
  Future<List<CityModel>> searchCity(String keyword) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/v3/sholat/kabkota/cari/${Uri.encodeComponent(keyword)}',
      );

      final data = response.data;
      if (data == null || data['status'] != true) {
        throw ServerException.withMessage(
          title: 'Data tidak ditemukan',
          message: (data?['message'] as String?) ?? 'Data tidak ditemukan.',
          statusCode: response.statusCode ?? 0,
        );
      }

      final list = data['data'] as List<dynamic>? ?? [];
      return list
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<List<CityModel>> getAllCities() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/v3/sholat/kabkota/semua',
      );

      final data = response.data;
      if (data == null || data['status'] != true) {
        throw ServerException.withMessage(
          title: 'Data tidak ditemukan',
          message: (data?['message'] as String?) ?? 'Data tidak ditemukan.',
          statusCode: response.statusCode ?? 0,
        );
      }

      final list = data['data'] as List<dynamic>? ?? [];
      return list
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<MonthlyPrayerScheduleResponse> getMonthlyPrayerSchedule(
    String cityId,
    int year,
    int month,
  ) async {
    try {
      final mm = month.toString().padLeft(2, '0');
      final response = await _dio.get<Map<String, dynamic>>(
        '/v3/sholat/jadwal/$cityId/$year-$mm',
        queryParameters: {'tz': 'Asia/Jakarta'},
      );

      final data = response.data;
      if (data == null || data['status'] != true) {
        throw ServerException.withMessage(
          title: 'Data tidak ditemukan',
          message: (data?['message'] as String?) ?? 'Data tidak ditemukan.',
          statusCode: response.statusCode ?? 0,
        );
      }

      return MonthlyPrayerScheduleResponse.fromJson(
        data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<QiblaResponse> getQibla(double latitude, double longitude) async {
    try {
      final coordinate =
          '${latitude.toStringAsFixed(6)},${longitude.toStringAsFixed(6)}';
      final response = await _dio.get<Map<String, dynamic>>(
        '/v3/qibla/$coordinate',
      );

      final data = response.data;
      if (data == null || data['status'] != true) {
        throw ServerException.withMessage(
          title: 'Data tidak ditemukan',
          message:
              (data?['message'] as String?) ?? 'Gagal menghitung arah kiblat.',
          statusCode: response.statusCode ?? 0,
        );
      }

      final qiblaData = data['data'];
      if (qiblaData is! Map<String, dynamic>) {
        throw ServerException.withMessage(
          title: 'Data tidak valid',
          message: 'Gagal membaca arah kiblat.',
          statusCode: response.statusCode ?? 0,
        );
      }

      return QiblaResponse.fromJson(
        qiblaData,
      );
    } on DioException catch (e) {
      throw ServerException.withError(e);
    } on FormatException {
      throw ServerException.withMessage(
        title: 'Data tidak valid',
        message: 'Gagal membaca arah kiblat.',
      );
    }
  }
}
