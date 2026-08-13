import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/calendar_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/core/api/dio_api.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

/// Integration test — hit endpoint ASLI di https://api-hari-libur.vercel.app
/// Jalankan dengan:
///   flutter test test/infrastructure/calendar/calendar_remote_datasource_integration_test.dart --reporter expanded
///
/// CATATAN:
/// - Test ini memerlukan koneksi internet aktif.
/// - Dio dibuat langsung tanpa GetIt/Hive/interceptor agar portable di test env.
/// - API hari libur ini tidak membutuhkan token (public API).

Dio _buildTestDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: calendarBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
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
    debugPrint('    [REQUEST] ${options.method} ${options.uri}');
    debugPrint('    Query Params:');
    options.queryParameters.forEach((k, v) => debugPrint('     $k: $v'));
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint('');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint(
      '   [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}',
    );
    final data = response.data;
    if (data is Map) {
      debugPrint('     status : ${data['status']}');
      debugPrint('     code   : ${data['code']}');
      final list = data['data'];
      if (list is List) {
        debugPrint('     data   : ${list.length} item(s) returned');
        if (list.isNotEmpty) {
          debugPrint('     sample : ${list.first}');
        }
      }
    } else {
      final raw = data.toString();
      debugPrint(
        '     body   : ${raw.length > 200 ? '${raw.substring(0, 200)}...' : raw}',
      );
    }
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint('     [ERROR] ${err.type.name} ${err.requestOptions.uri}');
    debugPrint('     Status : ${err.response?.statusCode}');
    debugPrint('     Body   : ${err.response?.data}');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(err);
  }
}

void main() {
  late CalendarRemoteDatasource datasource;

  setUp(() {
    datasource = CalendarRemoteDatasource(_buildTestDio());
  });

  group('CalendarRemoteDatasource - Integration Test (Real API)', () {
    test(
      'GET /api?year=2025 — should return list of Islamic holidays',
      () async {
        const tYear = 2025;

        debugPrint('');
        debugPrint('  📅 Requesting holidays for year: $tYear');

        final stopwatch = Stopwatch()..start();
        final result = await datasource.getHolidays(tYear);
        stopwatch.stop();

        debugPrint('');
        debugPrint('    Total time : ${stopwatch.elapsedMilliseconds}ms');
        debugPrint(
          '   Result     : ${result.length} Islamic holiday(s) found',
        );
        debugPrint('');
        for (final h in result) {
          debugPrint('      ${h.date} — ${h.name}');
        }

        // assert
        expect(result, isA<List<IslamicHolidayModel>>());
        expect(result, isNotEmpty);
        // Semua item harus berupa Islamic event
        for (final h in result) {
          expect(
            h.isIslamicEvent,
            isTrue,
            reason: '"${h.name}" seharusnya merupakan Islamic event',
          );
        }
        // Semua item harus tahun yang sesuai
        for (final h in result) {
          expect(
            h.year,
            tYear,
            reason: '"${h.date}" harus berada di tahun $tYear',
          );
        }
      },
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'GET /api?year=2026 — should return list of Islamic holidays for next year',
      () async {
        const tYear = 2026;

        debugPrint('');
        debugPrint('  📅 Requesting holidays for year: $tYear');

        final stopwatch = Stopwatch()..start();
        final result = await datasource.getHolidays(tYear);
        stopwatch.stop();

        debugPrint('');
        debugPrint('    Total time : ${stopwatch.elapsedMilliseconds}ms');
        debugPrint(
          '   Result     : ${result.length} Islamic holiday(s) found',
        );
        debugPrint('');
        for (final h in result) {
          debugPrint('      ${h.date} — ${h.name}');
        }

        expect(result, isA<List<IslamicHolidayModel>>());
      },
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'GET /api — should throw ServerException when server returns error',
      () async {
        // Buat Dio dengan baseUrl valid tapi path yang salah → 404
        final badDio = Dio(
          BaseOptions(
            baseUrl: calendarBaseUrl,
            connectTimeout: const Duration(seconds: 15),
            sendTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
          ),
        );
        badDio.interceptors.add(_TestLoggingInterceptor());

        debugPrint('');
        debugPrint('  🧪 Testing error handling: hit URL yang tidak valid');

        Object? caughtError;

        try {
          await badDio.get<Map<String, dynamic>>(
            '/api/invalid-endpoint-404',
            queryParameters: {'year': 2025},
          );
        } on DioException catch (e) {
          caughtError = e;
          final exception = ServerException.withError(e);

          debugPrint('');
          debugPrint('     DioException caught & parsed to ServerException!');
          debugPrint('     statusCode: ${exception.statusCode}');
          debugPrint('     title     : "${exception.title}"');
          debugPrint('     message   : "${exception.message}"');
          debugPrint('     type      : ${e.type.name}');

          expect(exception, isA<ServerException>());
          expect(exception.message, isNotEmpty);
        }

        expect(
          caughtError,
          isA<DioException>(),
          reason: 'Harus throw DioException untuk path yang salah',
        );
      },
      timeout: const Timeout(Duration(seconds: 30)),
    );
  });
}
