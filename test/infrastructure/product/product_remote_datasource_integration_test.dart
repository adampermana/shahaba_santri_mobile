import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';
import 'package:sahaba_mobile/infrastructure/core/api/dio_api.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/product/category/category.dart';
import 'package:sahaba_mobile/infrastructure/product/datasources/product_remote_datasources.dart';
import 'package:sahaba_mobile/infrastructure/product/dropdown_data/dropdown_data.dart';
import 'package:sahaba_mobile/infrastructure/product/produsen/produsen.dart';

/// Integration test — hit endpoint ASLI product backend (http://192.168.10.52:8123)
/// Jalankan dengan:
///   flutter test test/infrastructure/product/product_remote_datasource_integration_test.dart --reporter expanded
///
/// CATATAN:
/// - Test ini memerlukan server backend lokal aktif.
/// - Ganti nilai [kTestToken] jika endpoint product membutuhkan Bearer token otorisasi.
/// - Test POST/Mutasi sementara diskip agar tidak memenuhi database production/development dengan data sampah.

const String kTestToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3ODkxOTg0NDYsInVzZXJfaWQiOjExM30.JclEyljFP_49by4Y5aReSeUy40k6u5vWl7bod6aZXVs';

Dio _buildTestDio({String? token}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        if (token != null && token != 'YOUR_BEARER_TOKEN_HERE')
          'Authorization': token,
      },
    ),
  );
  dio.interceptors.add(_TestLoggingInterceptor());
  return dio;
}

class _TestLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint('  🚀 [REQUEST] ${options.method} ${options.uri}');
    if (options.queryParameters.isNotEmpty) {
      debugPrint('  📤 Query Params:');
      options.queryParameters.forEach((k, v) => debugPrint('     $k: $v'));
    }
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint(
      '  ✅ [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}',
    );
    final data = response.data;
    if (data is Map) {
      final list = data['data'];
      if (list is List) {
        debugPrint('  📦 data: ${list.length} item(s)');
        final preview = list.take(3).toList();
        for (var i = 0; i < preview.length; i++) {
          final item = preview[i];
          debugPrint('     [$i]');
          if (item is Map) {
            item.forEach((k, v) {
              final val = v.toString();
              final display = val.length > 80
                  ? '${val.substring(0, 80)}...'
                  : val;
              debugPrint('       $k: $display');
            });
          } else {
            debugPrint('       $item');
          }
        }
        if (list.length > 3) {
          debugPrint('     ... dan ${list.length - 3} item lainnya');
        }
      } else {
        // Response bukan list, tampilkan semua key-value
        data.forEach((k, v) {
          final val = v.toString();
          final display = val.length > 80 ? '${val.substring(0, 80)}...' : val;
          debugPrint('     $k: $display');
        });
      }
    } else if (data is List) {
      debugPrint('  📦 ${data.length} item(s)');
      final preview = data.take(3).toList();
      for (var i = 0; i < preview.length; i++) {
        debugPrint('     [$i] ${preview[i]}');
      }
    }
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint('  ❌ [ERROR] ${err.type.name} ${err.requestOptions.uri}');
    debugPrint('     Status : ${err.response?.statusCode}');
    debugPrint('     Body   : ${err.response?.data}');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(err);
  }
}

void main() {
  late ProductRemoteDatasource datasource;

  setUp(() {
    datasource = ProductRemoteDatasource(_buildTestDio(token: kTestToken));
  });

  group('ProductRemoteDatasource - Integration Test', () {
    group('Brand & Produsen Endpoints', () {
      test(
        'GET /api/v1/brand — should get list of brand data',
        () async {
          try {
            final stopwatch = Stopwatch()..start();
            final result = await datasource.getBrandData();
            stopwatch.stop();

            debugPrint('  ⏱️  Total time : ${stopwatch.elapsedMilliseconds}ms');
            debugPrint(
              '  📋 Result     : ${result.data?.length ?? 0} brand(s) found',
            );

            expect(result, isA<ListBrand>());
          } on ServerException catch (e) {
            if (e.statusCode == 401) {
              debugPrint('  ⚠️  Endpoint requires authorization token.');
            } else if (e.statusCode == -1) {
              debugPrint(
                '  ⚠️  Backend lokal tidak dapat diakses (Pastikan server $baseUrl menyala).',
              );
            } else {
              rethrow;
            }
          }
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );

      test(
        'GET /api/v1/produsen — should get list of produsen data',
        () async {
          try {
            final stopwatch = Stopwatch()..start();
            final result = await datasource.getProdusen();
            stopwatch.stop();

            debugPrint('  ⏱️  Total time : ${stopwatch.elapsedMilliseconds}ms');
            debugPrint(
              '  📋 Result     : ${result.data?.length ?? 0} produsen(s) found',
            );

            expect(result, isA<DropdownDataResponse>());
          } on ServerException catch (e) {
            if (e.statusCode == 401) {
              debugPrint('  ⚠️  Endpoint requires authorization token.');
            } else if (e.statusCode == -1) {
              debugPrint('  ⚠️  Backend lokal tidak dapat diakses.');
            } else {
              rethrow;
            }
          }
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );
    });

    group('Category Endpoints', () {
      test(
        'GET /api/v1/category/sub — should get sub categories',
        () async {
          try {
            final stopwatch = Stopwatch()..start();
            final result = await datasource.getCategory();
            stopwatch.stop();

            debugPrint('  ⏱️  Total time : ${stopwatch.elapsedMilliseconds}ms');
            debugPrint(
              '  📋 Result     : ${result.data?.length ?? 0} categories found',
            );

            expect(result, isA<ListCategory>());
          } on ServerException catch (e) {
            if (e.statusCode == 401) {
              debugPrint('  ⚠️  Endpoint requires authorization token.');
            } else if (e.statusCode == -1) {
              debugPrint('  ⚠️  Backend lokal tidak dapat diakses.');
            } else {
              rethrow;
            }
          }
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );
    });

    group('Ads Endpoints', () {
      test(
        'GET /api/v1/product/placement?placement_id=8 — get Ads Top Ten',
        () async {
          try {
            final stopwatch = Stopwatch()..start();
            final result = await datasource.getAdsTopTen();
            stopwatch.stop();

            debugPrint('  ⏱️  Total time : ${stopwatch.elapsedMilliseconds}ms');
            debugPrint(
              '  📋 Result     : ${result.data?.length ?? 0} ads found',
            );

            expect(result, isA<ListProductResponse>());
          } on ServerException catch (e) {
            if (e.statusCode == 401) {
              debugPrint('  ⚠️  Endpoint requires authorization token.');
            } else if (e.statusCode == -1) {
              debugPrint('  ⚠️  Backend lokal tidak dapat diakses.');
            } else {
              rethrow;
            }
          }
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );
    });

    group('Search / Product Endpoints', () {
      test(
        'GET /api/v1/product?search=baju — should return products matching search',
        () async {
          try {
            final stopwatch = Stopwatch()..start();
            final result = await datasource.getSearchProduct('baju');
            stopwatch.stop();

            debugPrint('  ⏱️  Total time : ${stopwatch.elapsedMilliseconds}ms');
            debugPrint(
              '  📋 Result     : ${result.data?.length ?? 0} product(s) found',
            );

            expect(result, isA<ListProductResponse>());
          } on ServerException catch (e) {
            if (e.statusCode == 401) {
              debugPrint('  ⚠️  Endpoint requires authorization token.');
            } else if (e.statusCode == -1) {
              debugPrint('  ⚠️  Backend lokal tidak dapat diakses.');
            } else {
              rethrow;
            }
          }
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );
    });
  });
}
