import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/i_auth_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

class MockDio extends Mock implements Dio {}

// ─── Helpers ────────────────────────────────────────────────────────────────

Response<Map<String, dynamic>> _resp(
  Map<String, dynamic> data, {
  String path = '/test',
  int statusCode = 200,
}) =>
    Response<Map<String, dynamic>>(
      data: data,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: path),
    );

DioException _dioError({
  DioExceptionType type = DioExceptionType.connectionTimeout,
  int? statusCode,
  Map<String, dynamic>? responseData,
  String path = '/test',
}) =>
    DioException(
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
  When<Future<Response<Map<String, dynamic>>>> _whenPost(
    MockDio dio,
    String path,
  ) =>
      when(
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
        _whenPost(mockDioAi, path)
            .thenAnswer((_) async => _resp(tSuccessJson, path: path));

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

    test('should throw ServerException on DioException connectionTimeout',
        () async {
      _whenPost(mockDioAi, path).thenThrow(_dioError(path: path));

      expect(
        () => datasource.postLoginAi(
          email: 'sah@mail.com',
          password: 'wrong',
        ),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException on 401 bad credentials', () async {
      _whenPost(mockDioAi, path).thenThrow(
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
      'should POST to _dio with device_token & platform and return LoginResponse',
      () async {
        _whenPost(mockDio, path)
            .thenAnswer((_) async => _resp(tGuestJson, path: path));

        final result = await datasource.postLoginGuest(
          deviceToken: 'device-fcm-token-test',
          platform: 'android',
        );

        expect(result, isA<LoginResponse>());
        expect(result.data?.token, 'guest-token-abc');
        expect(result.data?.name, 'Guest');

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
      _whenPost(mockDio, path).thenThrow(
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
      _whenPost(mockDio, path).thenThrow(
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
}
