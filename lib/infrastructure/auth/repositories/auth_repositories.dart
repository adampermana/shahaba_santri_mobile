part of 'i_auth_repositories.dart';

class AuthRepositories implements IAuthRepositories {
  AuthRepositories(
    this._localDatasource,
    this._remoteDatasource,
  );

  final IAuthLocalDatasource _localDatasource;
  final IAuthRemoteDatasource _remoteDatasource;

  @override
  AuthDataHive? fetchDataLoginGuest() => _localDatasource.authGuestDataHive;

  @override
  AuthDataHive? fetchDataLoginUser() => _localDatasource.authUserDataHive;

  @override
  AuthDataKatanaraHive? fetchDataLoginAi() => _localDatasource.authAiDataHive;

  @override
  Future<Either<ServerFailures, ValidationEmailResponse>> getValidationEmail({
    required String email,
  }) async {
    try {
      final response = await _remoteDatasource.getValidationEmail(email: email);
      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, LoginResponse>> postLoginUser({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await _remoteDatasource.postLoginUser(
        identifier: identifier,
        password: password,
      );

      if (response.success == false) {
        return Left(
          ServerFailures(
            statusCode: 401,
            title: 'Login gagal',
            message: response.message ?? 'Identifier atau kata sandi salah',
          ),
        );
      }

      final token = response.token;
      if (token != null) {
        await _localDatasource.saveAuthUser(
          AuthDataHive(
            accessToken: token,
            tokenType: response.tokenType,
            expiresIn: response.expiresIn,
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, RegisterResponse>> postRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDatasource.postRegister(
        name: name,
        email: email,
        password: password,
      );

      if (response.success == false) {
        final isUnverified = response.emailVerified == false;
        return Left(
          ServerFailures(
            statusCode: isUnverified ? 409 : 400,
            title: isUnverified ? 'Verifikasi Email' : 'Daftar gagal',
            message: response.message ?? 'Pendaftaran gagal',
            requiresVerification: isUnverified,
            email: email,
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, VerifyOtpResponse>> postVerifyEmail({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _remoteDatasource.postVerifyEmail(
        email: email,
        code: code,
      );

      if (response.success == false) {
        return Left(
          ServerFailures(
            statusCode: 400,
            title: 'Verifikasi gagal',
            message: response.message ?? 'Kode verifikasi salah',
          ),
        );
      }

      final token = response.token;
      if (token != null) {
        await _localDatasource.saveAuthUser(
          AuthDataHive(
            accessToken: token,
            tokenType: response.tokenType,
            expiresIn: response.expiresIn,
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, ResendOtpResponse>> postResendEmailOtp({
    required String email,
  }) async {
    try {
      final response = await _remoteDatasource.postResendEmailOtp(email: email);

      if (response.success == false) {
        return Left(
          ServerFailures(
            statusCode: 400,
            title: 'Gagal kirim ulang',
            message: response.message ?? 'Gagal kirim ulang kode OTP',
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, LoginResponse>> postLoginGuest({
    required String platform,
  }) async {
    try {
      final fcmToken = await FirebaseMessagingService.instance().getFcmToken();
      final response = await _remoteDatasource.postLoginGuest(
        deviceToken: fcmToken ?? '',
        platform: platform,
      );

      final token = response.token;
      if (token != null) {
        await _localDatasource.saveAuthGuest(
          AuthDataHive(
            accessToken: token,
            name: 'Guest',
            phoneNumber: '',
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, LoginResponse>> postRestoreAccount({
    required String jwt,
  }) async {
    try {
      final response = await _remoteDatasource.postRestoreAccount(jwt: jwt);
      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, LoginResponAI>> postLoginAi(
    String email,
    String password,
  ) async {
    try {
      final response = await _remoteDatasource.postLoginAi(
        email: email,
        password: password,
      );
      final token = response.token;
      if (token != null) {
        await _localDatasource.saveAuthAi(
          AuthDataKatanaraHive(
            id: response.id,
            email: response.email,
            name: response.name,
            role: response.role,
            token: token,
            expiresAt: response.expiresAt,
            tags: response.tags,
          ),
        );
      }
      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<void> clearAuthData() async {
    await _localDatasource.clearAuthUser();
    await _localDatasource.clearAuthGuest();
    await _localDatasource.clearAuthAi();
  }
}
