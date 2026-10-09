import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/auth/register/register_response.dart';
import 'package:sahaba_mobile/domains/auth/resend_otp/resend_otp_response.dart';
import 'package:sahaba_mobile/domains/auth/verify_otp/verify_otp_response.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/i_auth_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

class MockDio extends Mock implements Dio {}

// ─── Helpers ────────────────────────────────────────────────────────────────

Response<Map<String, dynamic>> _resp(
  Map<String, dynamic> data, {
  String path = '/test',
  int statusCode = 200,
}) => Response<Map<String, dynamic>>(
  data: data,
  statusCode: statusCode,
  requestOptions: RequestOptions(path: path),
);

DioException _dioError({
  DioExceptionType type = DioExceptionType.connectionTimeout,
  int? statusCode,
  Map<String, dynamic>? responseData,
  String path = '/test',
}) => DioException(
  type: type,
  response: statusCode != null
      ? Response(
          statusCode: statusCode,
          data: responseData,
          requestOptions: RequestOptions(path: path),
        )
      : null,
  requestOptions: RequestOptions(path: path),
);

// ─── Tests ───────────────────────────────────────────────────────────────────

void main() {
  late MockDio mockDio;
  late MockDio mockDioAi;
  late AuthRemoteDatasource datasource;

  setUp(() {
    mockDio = MockDio();
    mockDioAi = MockDio();
    datasource = AuthRemoteDatasource(mockDio, mockDioAi);
  });

  // Convenience wrappers
  When<Future<Response<Map<String, dynamic>>>> whenPost(
    MockDio dio,
    String path,
  ) => when(
    () => dio.post<Map<String, dynamic>>(
      path,
      data: any(named: 'data'),
      queryParameters: any(named: 'queryParameters'),
      options: any(named: 'options'),
      cancelToken: any(named: 'cancelToken'),
      onSendProgress: any(named: 'onSendProgress'),
      onReceiveProgress: any(named: 'onReceiveProgress'),
    ),
  );

  // ── postLoginAi ──────────────────────────────────────────────────────────

  group('postLoginAi', () {
    const path = '/api/ai/auth/login';

    final tSuccessJson = {
      'id': 22,
      'email': 'sah@mail.com',
      'name': 'SAH',
      'role': 'member',
      'token': 'eyJhbGci.test.token',
      'expires_at': 1786690862,
      'tags': ['SAH'],
    };

    test(
      'should POST to _dioAi with email & password and return LoginResponAI',
      () async {
        whenPost(
          mockDioAi,
          path,
        ).thenAnswer((_) async => _resp(tSuccessJson, path: path));

        final result = await datasource.postLoginAi(
          email: 'sah@mail.com',
          password: '12345678',
        );

        expect(result, isA<LoginResponAI>());
        expect(result.email, 'sah@mail.com');
        expect(result.token, isNotNull);
        expect(result.token, isNotEmpty);

        verify(
          () => mockDioAi.post<Map<String, dynamic>>(
            path,
            data: {'email': 'sah@mail.com', 'password': '12345678'},
          ),
        ).called(1);

        // pastikan _dio biasa TIDAK dipanggil
        verifyNever(() => mockDio.post<Map<String, dynamic>>(any()));
      },
    );

    test(
      'should throw ServerException on DioException connectionTimeout',
      () async {
        whenPost(mockDioAi, path).thenThrow(_dioError(path: path));

        expect(
          () => datasource.postLoginAi(
            email: 'sah@mail.com',
            password: 'wrong',
          ),
          throwsA(isA<ServerException>()),
        );
      },
    );

    test('should throw ServerException on 401 bad credentials', () async {
      whenPost(mockDioAi, path).thenThrow(
        _dioError(
          type: DioExceptionType.badResponse,
          statusCode: 401,
          responseData: {'message': 'Invalid credentials'},
          path: path,
        ),
      );

      expect(
        () => datasource.postLoginAi(
          email: 'sah@mail.com',
          password: 'wrong_pass',
        ),
        throwsA(isA<ServerException>()),
      );
    });
  });

  // ── postLoginGuest ───────────────────────────────────────────────────────

  group('postLoginGuest', () {
    const path = '/api/v1/auth/guest';

    final tGuestJson = {
      'meta': {'code': 200, 'message': 'Success'},
      'data': {
        'id': null,
        'token': 'guest-token-abc',
        'user_id': null,
        'name': 'Guest',
        'status': 1,
        'is_pending_deletion': false,
      },
    };

    test(
      'should POST to _dio with device_token & platform & return LoginResponse',
      () async {
        whenPost(
          mockDio,
          path,
        ).thenAnswer((_) async => _resp(tGuestJson, path: path));

        final result = await datasource.postLoginGuest(
          deviceToken: 'device-fcm-token-test',
          platform: 'android',
        );

        expect(result, isA<LoginResponse>());
        expect(result.token, 'guest-token-abc');

        verify(
          () => mockDio.post<Map<String, dynamic>>(
            path,
            data: {
              'device_token': 'device-fcm-token-test',
              'platform': 'android',
            },
          ),
        ).called(1);

        // pastikan _dioAi TIDAK dipanggil
        verifyNever(() => mockDioAi.post<Map<String, dynamic>>(any()));
      },
    );

    test('should throw ServerException on DioException', () async {
      whenPost(mockDio, path).thenThrow(
        _dioError(
          type: DioExceptionType.connectionError,
          path: path,
        ),
      );

      expect(
        () => datasource.postLoginGuest(
          deviceToken: 'device-fcm-token-test',
          platform: 'android',
        ),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException on 500 server error', () async {
      whenPost(mockDio, path).thenThrow(
        _dioError(
          type: DioExceptionType.badResponse,
          statusCode: 500,
          responseData: {'message': 'Internal Server Error'},
          path: path,
        ),
      );

      expect(
        () => datasource.postLoginGuest(
          deviceToken: 'device-fcm-token-test',
          platform: 'android',
        ),
        throwsA(isA<ServerException>()),
      );
    });
  });

  // ── postLoginUser ────────────────────────────────────────────────────────

  group('postLoginUser', () {
    const path = '/api/v1/public/auth/login';

    final tSuccessJson = {
      'success': true,
      'message': 'Login successful',
      'data': {
        'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test',
        'token_type': 'Bearer',
        'expires_in': 24,
      },
    };

    test(
      'should POST to /api/v1/public/auth/login and return LoginResponse',
      () async {
        whenPost(
          mockDio,
          path,
        ).thenAnswer((_) async => _resp(tSuccessJson, path: path));

        final result = await datasource.postLoginUser(
          identifier: 'yivahey454@aminavin.com',
          password: 'secret123',
        );

        expect(result, isA<LoginResponse>());
        expect(result.token, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test');
        expect(result.message, 'Login successful');

        verify(
          () => mockDio.post<Map<String, dynamic>>(
            path,
            data: {
              'identifier': 'yivahey454@aminavin.com',
              'password': 'secret123',
            },
          ),
        ).called(1);
      },
    );

    test('should throw ServerException on 401 invalid credentials', () async {
      whenPost(mockDio, path).thenThrow(
        _dioError(
          type: DioExceptionType.badResponse,
          statusCode: 401,
          responseData: {
            'success': false,
            'message': 'invalid identifier or password',
          },
          path: path,
        ),
      );

      expect(
        () => datasource.postLoginUser(
          identifier: 'yivahey454@aminavin.com',
          password: 'wrongpassword',
        ),
        throwsA(
          isA<ServerException>().having(
            (e) => e.message,
            'message',
            'invalid identifier or password',
          ),
        ),
      );
    });
  });

  // ── postRegister ─────────────────────────────────────────────────────────

  group('postRegister', () {
    const path = '/api/v1/public/auth/register';

    final tSuccessJson = {
      'success': true,
      'message':
          'Account pending email verification; check your email for the code',
      'data': {
        'id': '39761b09-ce31-4f0d-879b-6a79e06e0ad7',
        'email': 'daliras653@aminavin.com',
        'name': '',
        'photo_url': '',
        'email_verified': false,
        'status': 'pending',
        'cooldown_otp': 60,
        'created_at': '2026-10-06T11:20:35.522162397+07:00',
        'updated_at': '2026-10-06T11:20:35.522162397+07:00',
      },
    };

    test(
      'should POST to /api/v1/public/auth/register and return RegisterResponse',
      () async {
        whenPost(
          mockDio,
          path,
        ).thenAnswer((_) async => _resp(tSuccessJson, path: path));

        final result = await datasource.postRegister(
          name: 'Daliras',
          email: 'daliras653@aminavin.com',
          password: 'secret123',
        );

        expect(result, isA<RegisterResponse>());
        expect(result.data?.email, 'daliras653@aminavin.com');
        expect(result.data?.cooldownOtp, 60);

        verify(
          () => mockDio.post<Map<String, dynamic>>(
            path,
            data: {
              'name': 'Daliras',
              'email': 'daliras653@aminavin.com',
              'password': 'secret123',
            },
          ),
        ).called(1);
      },
    );

    test(
      'should throw ServerException with requiresVerification on 409 conflict',
      () async {
        whenPost(mockDio, path).thenThrow(
          _dioError(
            type: DioExceptionType.badResponse,
            statusCode: 409,
            responseData: {
              'success': false,
              'message':
                  'create pending registration: email already registered; '
                  'verify the pending account or use the existing login',
              'email_verified': false,
            },
            path: path,
          ),
        );

        expect(
          () => datasource.postRegister(
            name: 'Daliras',
            email: 'daliras653@aminavin.com',
            password: 'secret123',
          ),
          throwsA(
            isA<ServerException>().having(
              (e) => e.requiresVerification,
              'requiresVerification',
              true,
            ),
          ),
        );
      },
    );
  });

  // ── postVerifyEmail ──────────────────────────────────────────────────────

  group('postVerifyEmail', () {
    const path = '/api/v1/public/auth/verify-email';

    final tSuccessJson = {
      'success': true,
      'message': 'Email verified; you can now log in',
      'data': {
        'id': '37c4119d-5607-40e3-9e01-d4c8ab9fea52',
        'email': 'wowasi5376@abowned.com',
        'name': '',
        'photo_url': '',
        'email_verified': true,
        'status': 'active',
        'created_at': '2026-10-06T13:40:19.786832+07:00',
        'updated_at': '2026-10-06T13:45:54.770991204+07:00',
      },
    };

    test(
      'should POST to /api/v1/public/auth/verify-email and return response',
      () async {
        whenPost(
          mockDio,
          path,
        ).thenAnswer((_) async => _resp(tSuccessJson, path: path));

        final result = await datasource.postVerifyEmail(
          code: '000044',
          email: 'wowasi5376@abowned.com',
        );

        expect(result, isA<VerifyOtpResponse>());
        expect(result.data?.emailVerified, isTrue);
        expect(result.message, 'Email verified; you can now log in');

        verify(
          () => mockDio.post<Map<String, dynamic>>(
            path,
            data: {
              'code': '000044',
              'email': 'wowasi5376@abowned.com',
            },
          ),
        ).called(1);
      },
    );
  });

  // ── postResendEmailOtp ───────────────────────────────────────────────────

  group('postResendEmailOtp', () {
    const path = '/api/v1/public/auth/resend-email-otp';

    final tSuccessJson = {
      'success': true,
      'message': 'Verification code sent',
      'data': {
        'cooldown_otp': 60,
      },
    };

    test(
      'should POST to /api/v1/public/auth/resend-email-otp and return response',
      () async {
        whenPost(
          mockDio,
          path,
        ).thenAnswer((_) async => _resp(tSuccessJson, path: path));

        final result = await datasource.postResendEmailOtp(
          email: 'wowasi5376@abowned.com',
        );

        expect(result, isA<ResendOtpResponse>());
        expect(result.data?.cooldownOtp, 60);

        verify(
          () => mockDio.post<Map<String, dynamic>>(
            path,
            data: {
              'email': 'wowasi5376@abowned.com',
            },
          ),
        ).called(1);
      },
    );
  });
}
