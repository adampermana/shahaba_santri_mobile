import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/domains/ai_chat/ai_chat_response.dart';
import 'package:sahaba_mobile/infrastructure/ai_chat/datasources/i_ai_chat_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/core/api/dio_api.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

/// Integration test — hit endpoint ASLI di https://api-katanara.solu.co.id
/// Jalankan dengan:
///   flutter test test/infrastructure/ai_chat/ai_chat_remote_datasource_integration_test.dart --reporter expanded
///
/// CATATAN:
/// - Test ini memerlukan koneksi internet aktif.

/// ← Isi dengan Bearer token Katanara AI yang valid
const String kTestToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjIsImVtYWlsIjoic2FoQG1haWwuY29tIiwibmFtZSI6IlNBSCIsInJvbGUiOiJtZW1iZXIiLCJleHAiOjE3ODY2OTA4NjIsImlhdCI6MTc4NjYwNDQ2Mn0.nENCw3Gyv--tjnPuYtiuhKP_j6M9LYhzpxJn6v6hZS8';

Dio _buildTestDio({String? token}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseAIUrl,
      connectTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        if (token != null && token != 'YOUR_KATANARA_BEARER_TOKEN_HERE')
          'Authorization': 'Bearer $token',
      },
    ),
  );
  // Tambahkan logging interceptor agar request/response terlihat di terminal
  dio.interceptors.add(_TestLoggingInterceptor());
  return dio;
}

class _TestLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('');
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    log('   [REQUEST] ${options.method} ${options.uri}');
    log('   Headers:');
    options.headers.forEach((k, v) => log('     $k: $v'));
    log('   Body:');
    if (options.data is Map) {
      (options.data as Map).forEach((k, v) => log('     $k: $v'));
    } else {
      log('     ${options.data}');
    }
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log('');
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    log(
      '   [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}',
    );
    log('   Body:');
    if (response.data is Map) {
      (response.data as Map).forEach((k, v) {
        final display = v.toString().length > 120
            ? '${v.toString().substring(0, 120)}...'
            : v;
        log('     $k: $display');
      });
    } else {
      log('     ${response.data}');
    }
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('');
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    log('    [ERROR] ${err.type.name} ${err.requestOptions.uri}');
    log('     Status : ${err.response?.statusCode}');
    log('     Body   : ${err.response?.data}');
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    handler.next(err);
  }
}

void main() {
  group('AiChatRemoteDatasource - Integration Test (Real API)', () {
    test(
      'POST /api/ai/chat — should return valid AiChatResponse from server',
      () async {
        final dio = _buildTestDio(token: kTestToken);
        final datasource = AiChatRemoteDatasource(dio);

        const tMessage = 'Apa itu sholat tahajud?';

        if (kTestToken == 'YOUR_KATANARA_BEARER_TOKEN_HERE') {
          log('');
          log(
            '⚠️  kTestToken belum diisi! Isi dulu di integration test file.',
          );
          log('   Skipping test...');
          return;
        }

        final stopwatch = Stopwatch()..start();

        final result = await datasource.postAiChat(message: tMessage);
        stopwatch.stop();

        log('');
        log('  ⏱️  Total time: ${stopwatch.elapsedMilliseconds}ms');

        expect(result, isA<AiChatResponse>());
        expect(result.answer, isNotNull);
        expect(result.answer, isNotEmpty);
      },
      timeout: const Timeout(Duration(minutes: 2)),
    );

    test(
      'POST /api/ai/chat — should return 401 when no token provided',
      () async {
        // Sengaja tidak kirim token untuk verifikasi behavior 401
        final dio = _buildTestDio();

        final stopwatch = Stopwatch()..start();
        Object? caughtError;

        try {
          await dio.post<Map<String, dynamic>>(
            '/api/ai/chat',
            data: {
              'history': [
                {'content': 'test', 'role': 'user'},
              ],
              'question': 'test',
              'stream': false,
              'tags': ['SAH'],
              'top_k': 5,
            },
          );
        } on DioException catch (e) {
          stopwatch.stop();
          caughtError = e;
          final exception = ServerException.withError(e);

          log('');
          log('  ⏱️  Total time: ${stopwatch.elapsedMilliseconds}ms');
          log('  📋 Exception parsed:');
          log('     statusCode: ${exception.statusCode}');
          log('     title     : "${exception.title}"');
          log('     message   : "${exception.message}"');

          expect(exception.statusCode, 401);
          expect(exception.message, isNotEmpty);
        }

        expect(
          caughtError,
          isA<DioException>(),
          reason: 'Harus throw DioException 401',
        );
      },
      timeout: const Timeout(Duration(seconds: 120)),
    );
  });
}
