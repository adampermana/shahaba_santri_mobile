part of 'i_auth_remote_datasource.dart';

class AuthRemoteDatasource implements IAuthRemoteDatasource {
  AuthRemoteDatasource(this._dio, this._dioAi);
  final Dio _dio;
  final Dio _dioAi;

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
  Future<LoginResponse> postLoginUser({
    required String email,
    required String password,
    required String deviceToken,
    required String platform,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/login',
        data: {
          'email': email,
          'password': password,
          'device_token': deviceToken,
          'platform': platform,
        },
      );
      return LoginResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          final data = raw['data'];
          if (data is Map<String, dynamic> &&
              data['is_pending_deletion'] == true) {
            return LoginResponse.fromJson(raw);
          }
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<MetaResponse> postLogoutUser({required int idUser}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/logout/$idUser',
      );
      return MetaResponse.fromJson(response.data!);
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
  Future<LoginSsoResponse> postGoogleSSO({
    required String deviceToken,
    required String idToken,
    required String platform,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/google',
        data: {
          'device_token': deviceToken,
          'id_token': idToken,
          'platform': platform,
        },
      );
      debugPrint(
        '=== response data SSO: ${LoginSsoResponse.fromJson(response.data!)}',
      );
      return LoginSsoResponse.fromJson(response.data!);
    } on DioException catch (e) {
      // Jika server return 401 dengan is_pending_deletion=true,
      // body-nya tetap berisi token & data lengkap — parse dan return normal.
      if (e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          final data = raw['data'];
          if (data is Map<String, dynamic> &&
              data['is_pending_deletion'] == true) {
            return LoginSsoResponse.fromJson(raw);
          }
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<LoginSsoResponse> postAppleSSO({
    required String deviceToken,
    required String idToken,
    required String platform,
    String? email,
    String? name,
  }) async {
    try {
      final data = <String, dynamic>{
        'device_token': deviceToken,
        'id_token': idToken,
        'platform': platform,
      };

      // Apple hanya mengirimkan email & name saat login pertama.
      // Pada login berikutnya kedua field ini null — tidak dikirim ke server.
      if (email != null && email.isNotEmpty) data['email'] = email;
      if (name != null && name.isNotEmpty) data['name'] = name;

      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/apple',
        data: data,
      );
      return LoginSsoResponse.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401) {
        final raw = e.response?.data;
        if (raw is Map<String, dynamic>) {
          final data = raw['data'];
          if (data is Map<String, dynamic> &&
              data['is_pending_deletion'] == true) {
            return LoginSsoResponse.fromJson(raw);
          }
        }
      }
      throw ServerException.withError(e);
    }
  }

  @override
  Future<RegisterResponse> postRegister({required String email}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/register/request-otp',
        data: {'email': email},
      );
      return RegisterResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<VerifyOtpResponse> postVerifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/register/verify-otp',
        data: {'email': email, 'otp': otp},
      );
      return VerifyOtpResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<CompleteProfileResponse> postCompleteRegisterProfile({
    required String confirmPassword,
    required String deviceToken,
    required String email,
    required String name,
    required String newPassword,
    required String phoneNumber,
    required String platform,
    required String verifyToken,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/register/complete',
        data: {
          'confirm_password': confirmPassword,
          'device_token': deviceToken,
          'email': email,
          'name': name,
          'new_password': newPassword,
          'phone_number': phoneNumber,
          'platform': platform,
          'verify_token': verifyToken,
        },
      );
      return CompleteProfileResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<CompleteProfileResponse> postCompleteSsoProfile({
    required String name,
    required String phoneNumber,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/google/complete-profile',
        data: {'name': name, 'phone_number': phoneNumber},
      );
      return CompleteProfileResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<CompleteProfileResponse> postCompleteAppleSsoProfile({
    required String name,
    required String phoneNumber,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/apple/complete-profile',
        data: {'name': name, 'phone_number': phoneNumber},
      );
      return CompleteProfileResponse.fromJson(response.data!);
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
