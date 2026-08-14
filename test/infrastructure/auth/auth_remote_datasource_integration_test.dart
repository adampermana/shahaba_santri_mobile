import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/i_auth_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/core/api/dio_api.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

/// Integration test — hit endpoint ASLI
///   - postLoginAi  → https://api-katanara.solu.co.id/api/ai/auth/login
///   - postLoginGuest → http://158.140.181.43:8513/api/v1/auth/guest
///
/// Jalankan dengan:
///   flutter test test/infrastructure/auth/auth_remote_datasource_integration_test.dart --reporter expanded
///
/// CATATAN:
/// - Test ini memerlukan koneksi internet aktif.
/// - Akun AI sudah di-hardcode di sini (sah@mail.com / 12345678) sesuai arahan.
/// - Guest login menggunakan device_token dummy karena hanya butuh token FCM.

Dio _buildDio(String url) {
  final dio = Dio(
    BaseOptions(
      baseUrl: url,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  dio.interceptors.add(_TestLoggingInterceptor(label: url));
  return dio;
}

class _TestLoggingInterceptor extends Interceptor {
  _TestLoggingInterceptor({required this.label});
  final String label;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('');
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint('   [REQUEST] ${options.method} ${options.uri}');
    if (options.data is Map) {
      debugPrint('   Body:');
      // Sembunyikan nilai password di log
      (options.data as Map).forEach((k, v) {
        final display = k == 'password' ? '***' : v;
        debugPrint('     $k: $display');
      });
    }
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
      data.forEach((k, v) {
        final val = v.toString();
        // Sembunyikan nilai token di log (terlalu panjang & sensitif)
        final display = (k == 'token' || k == 'access_token')
            ? '${val.substring(0, val.length.clamp(0, 20))}...[HIDDEN]'
            : val.length > 100
            ? '${val.substring(0, 100)}...'
            : val;
        debugPrint('     $k: $display');
      });
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
  late AuthRemoteDatasource datasource;

  setUp(() {
    final dioProduct = _buildDio(baseUrl);
    final dioAi = _buildDio(baseAIUrl);
    datasource = AuthRemoteDatasource(dioProduct, dioAi);
  });

  group('AuthRemoteDatasource - Integration Test (Real API)', () {
    // ── postLoginAi ────────────────────────────────────────────────────────

    group('postLoginAi', () {
      test(
        'POST /api/ai/auth/login — login dengan akun valid (sah@mail.com)',
        () async {
          debugPrint('');
          debugPrint('   Attempting AI login as: sah@mail.com');

          final stopwatch = Stopwatch()..start();
          final result = await datasource.postLoginAi(
            email: 'sah@mail.com',
            password: '12345678',
          );
          stopwatch.stop();

          debugPrint('');
          debugPrint('     Total time : ${stopwatch.elapsedMilliseconds}ms');
          debugPrint('     Result:');
          debugPrint('     id    : ${result.id}');
          debugPrint('     email : ${result.email}');
          debugPrint('     name  : ${result.name}');
          debugPrint('     role  : ${result.role}');
          debugPrint('     tags  : ${result.tags}');
          debugPrint(
            '     token : ${result.token?.substring(0, 20)}...[HIDDEN]',
          );

          expect(result, isA<LoginResponAI>());
          expect(result.token, isNotNull);
          expect(result.token, isNotEmpty);
          expect(result.email, 'sah@mail.com');
          expect(result.id, isNotNull);
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );

      test(
        'POST /api/ai/auth/login — should throw ServerException on wrong credentials',
        () async {
          debugPrint('');
          debugPrint('   Testing with wrong credentials...');

          Object? caughtError;

          try {
            await datasource.postLoginAi(
              email: 'sah@mail.com',
              password: 'wrong_password_xyz',
            );
          } on ServerException catch (e) {
            caughtError = e;
            debugPrint('');
            debugPrint('     ServerException caught correctly!');
            debugPrint('     statusCode: ${e.statusCode}');
            debugPrint('     title     : "${e.title}"');
            debugPrint('     message   : "${e.message}"');

            expect(e, isA<ServerException>());
            expect(e.statusCode, isNot(200));
          }

          expect(
            caughtError,
            isA<ServerException>(),
            reason: 'Harus throw ServerException saat credentials salah',
          );
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );
    });

    // ── postLoginGuest ─────────────────────────────────────────────────────

    group('postLoginGuest', () {
      test(
        'POST /api/v1/auth/guest — should return LoginResponse with token',
        () async {
          debugPrint('');
          debugPrint('  👤 Attempting guest login...');

          final stopwatch = Stopwatch()..start();
          final result = await datasource.postLoginGuest(
            deviceToken: 'integration-test-device-token-dummy',
            platform: 'android',
          );
          stopwatch.stop();

          debugPrint('');
          debugPrint('     Total time : ${stopwatch.elapsedMilliseconds}ms');
          debugPrint('     Result:');
          debugPrint('     name            : ${result.data?.name}');
          debugPrint(
            '     token   : ${result.data?.token?.substring(0, 20)}...[HIDDEN]',
          );
          debugPrint(
            '     isPendingDeletion: ${result.data?.isPendingDeletion}',
          );

          expect(result, isA<LoginResponse>());
          expect(result.data, isNotNull);
          expect(result.data!.token, isNotNull);
          expect(result.data!.token, isNotEmpty);
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );

      test(
        'POST /api/v1/auth/guest — should handle missing deviceToken gracefully',
        () async {
          debugPrint('');
          debugPrint('   Testing guest login with empty device token...');

          // Server mungkin tetap return 200 atau error
          try {
            final result = await datasource.postLoginGuest(
              deviceToken: '',
              platform: 'android',
            );
            // Jika server tetap OK
            expect(result, isA<LoginResponse>());
            debugPrint('   Server still returned 200 with empty device_token');
          } on ServerException catch (e) {
            debugPrint(
              '   ServerException caught — server rejected empty token',
            );
            debugPrint('     statusCode: ${e.statusCode}');
            debugPrint('     message   : "${e.message}"');
            expect(e, isA<ServerException>());
          }
        },
        timeout: const Timeout(Duration(seconds: 30)),
      );
    });
  });
}
