part of 'i_auth_remote_datasource.dart';

class AuthRemoteDatasource implements IAuthRemoteDatasource {
  AuthRemoteDatasource(this._dio, this._dioAi);
  final Dio _dio;
  final Dio _dioAi;

  @override
  Future<ValidationEmailResponse> getValidationEmail({
    required String email,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/public/auth/verif-email',
        queryParameters: {'email': email},
      );
      return ValidationEmailResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

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

  @override
  Future<PinResponse> postCreatePin({
    required String pin,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/pin',
        data: {'pin': pin},
      );
      return PinResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          (e.response?.statusCode == 400 ||
              e.response?.statusCode == 409 ||
              e.response?.statusCode == 503)) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return PinResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<RequestResetPinResponse> postRequestResetPinOtp({
    required String email,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/pin/reset/request',
        data: {'email': email},
      );
      return RequestResetPinResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          (e.response?.statusCode == 400 ||
              e.response?.statusCode == 409 ||
              e.response?.statusCode == 503)) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return RequestResetPinResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<PinResponse> postResetPin({
    required String email,
    required String code,
    required String pin,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/pin/reset',
        data: {
          'email': email,
          'code': code,
          'pin': pin,
        },
      );
      return PinResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          (e.response?.statusCode == 400 ||
              e.response?.statusCode == 409 ||
              e.response?.statusCode == 503)) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return PinResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ForgotPasswordResponse> postRequestForgotPasswordOtp({
    required String email,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/forgot-password',
        data: {'email': email},
      );
      return ForgotPasswordResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          (e.response?.statusCode == 400 ||
              e.response?.statusCode == 409 ||
              e.response?.statusCode == 503)) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return ForgotPasswordResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ResetPasswordResponse> postResetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/reset-password',
        data: {
          'code': code,
          'email': email,
          'new_password': newPassword,
        },
      );
      return ResetPasswordResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          (e.response?.statusCode == 400 ||
              e.response?.statusCode == 409 ||
              e.response?.statusCode == 503)) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return ResetPasswordResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<LoginResponse> postLoginPin({
    required String identifier,
    required String pin,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/public/auth/login/pin',
        data: {
          'identifier': identifier,
          'pin': pin,
        },
      );
      return LoginResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          (e.response?.statusCode == 401 ||
              e.response?.statusCode == 400)) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          return LoginResponse.fromJson(raw);
        }
      }
      throw ServerException.withError(e);
    }
  }
}
