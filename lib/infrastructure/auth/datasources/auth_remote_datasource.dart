part of 'i_auth_remote_datasource.dart';

class AuthRemoteDatasource implements IAuthRemoteDatasource {
  AuthRemoteDatasource(this._dio, this._dioAi);
  final Dio _dio;
  final Dio _dioAi;

  @override
  Future<LoginResponse> postLoginUser({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/login',
        data: {
          'identifier': identifier,
          'password': password,
        },
      );
      return LoginResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return LoginResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<RegisterResponse> postRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/register',
        data: {'name': name, 'email': email, 'password': password},
      );
      return RegisterResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          (e.response?.statusCode == 409 || e.response?.statusCode == 400)) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return RegisterResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<VerifyOtpResponse> postVerifyEmail({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/verify-email',
        data: {'email': email, 'code': code},
      );
      return VerifyOtpResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 400) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return VerifyOtpResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ResendOtpResponse> postResendEmailOtp({
    required String email,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/resend-email-otp',
        data: {'email': email},
      );
      return ResendOtpResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          (e.response?.statusCode == 400 || e.response?.statusCode == 409)) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return ResendOtpResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<LoginResponAI> postLoginAi({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioAi.post<Map<String, dynamic>>(
        '/api/ai/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return LoginResponAI.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<LoginResponse> postLoginGuest({
    required String deviceToken,
    required String platform,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/guest',
        data: {'device_token': deviceToken, 'platform': platform},
      );
      return LoginResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<LoginResponse> postRestoreAccount({required String jwt}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/account/restore',
        options: Options(headers: {'Authorization': jwt}),
      );
      return LoginResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }
}
