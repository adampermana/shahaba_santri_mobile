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
    required String email,
    required String password,
  }) async {
    try {
      // Fcm token
      final firebaseMessaging = sl<FirebaseMessaging>();
      final fcmToken = await firebaseMessaging.getToken();
      final response = await _remoteDatasource.postLoginUser(
        email: email,
        password: password,
        fcmToken: fcmToken.toString(),
      );

      if (response.meta?.success == false) {
        return Left(
          ServerFailures(
            statusCode: 401,
            title: 'Login gagal',
            message: response.meta?.message ?? 'Email atau kata sandi salah',
          ),
        );
      }

      final accessToken = response.data?.accessToken;
      final refreshToken = response.data?.refreshToken;
      final user = response.data?.user;

      if (accessToken != null) {
        await _localDatasource.saveAuthUser(
          AuthDataHive(
            accessToken: accessToken,
            refreshToken: refreshToken,
            name: user?.name,
            email: user?.email,
            photoUrl: user?.photoUrl,
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, LoginResponse>> postRefreshToken({
    required String refreshToken,
  }) async {
    try {
      final response = await _remoteDatasource.postRefreshToken(
        refreshToken: refreshToken,
      );

      if (response.meta?.success == false) {
        return Left(
          ServerFailures(
            statusCode: 401,
            title: 'Sesi berakhir',
            message: response.meta?.message ?? 'Gagal memperbarui sesi',
          ),
        );
      }

      final newAccessToken = response.data?.accessToken;
      final newRefreshToken = response.data?.refreshToken;
      final user = response.data?.user;

      if (newAccessToken != null) {
        final current = _localDatasource.authUserDataHive;
        await _localDatasource.saveAuthUser(
          (current ?? AuthDataHive()).copyWith(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken ?? refreshToken,
            name: user?.name ?? current?.name,
            email: user?.email ?? current?.email,
            photoUrl: user?.photoUrl ?? current?.photoUrl,
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, UserProfileResponse>> getUserProfile() async {
    try {
      final response = await _remoteDatasource.getUserProfile();
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
            isPin: false,
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

      final token = response.data?.accessToken;
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

  @override
  Future<Either<ServerFailures, PinResponse>> postCreatePin({
    required String pin,
  }) async {
    try {
      final response = await _remoteDatasource.postCreatePin(pin: pin);

      if (response.success == false) {
        return Left(
          ServerFailures(
            statusCode: 400,
            title: 'Buat PIN gagal',
            message: response.message ?? 'Gagal membuat PIN',
          ),
        );
      }

      final current = _localDatasource.authUserDataHive;
      if (current != null) {
        await _localDatasource.saveAuthUser(current.copyWith(isPin: true));
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, RequestResetPinResponse>>
  postRequestResetPinOtp({required String email}) async {
    try {
      final response = await _remoteDatasource.postRequestResetPinOtp(
        email: email,
      );

      if (response.success == false) {
        return Left(
          ServerFailures(
            statusCode: 400,
            title: 'Request OTP gagal',
            message: response.message ?? 'Gagal mengirim kode reset PIN',
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, PinResponse>> postResetPin({
    required String email,
    required String code,
    required String pin,
  }) async {
    try {
      final response = await _remoteDatasource.postResetPin(
        email: email,
        code: code,
        pin: pin,
      );

      if (response.success == false) {
        return Left(
          ServerFailures(
            statusCode: 400,
            title: 'Reset PIN gagal',
            message: response.message ?? 'Gagal mereset PIN',
          ),
        );
      }

      final current = _localDatasource.authUserDataHive;
      if (current != null) {
        await _localDatasource.saveAuthUser(current.copyWith(isPin: true));
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, ForgotPasswordResponse>>
  postRequestForgotPasswordOtp({required String email}) async {
    try {
      final response = await _remoteDatasource.postRequestForgotPasswordOtp(
        email: email,
      );

      if (response.success == false) {
        return Left(
          ServerFailures(
            statusCode: 400,
            title: 'Request OTP gagal',
            message: response.message ?? 'Gagal mengirim kode reset kata sandi',
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, ResetPasswordResponse>> postResetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      final response = await _remoteDatasource.postResetPassword(
        email: email,
        code: code,
        newPassword: newPassword,
      );

      if (response.success == false) {
        return Left(
          ServerFailures(
            statusCode: 400,
            title: 'Reset kata sandi gagal',
            message: response.message ?? 'Gagal mereset kata sandi',
          ),
        );
      }

      final current = _localDatasource.authUserDataHive;
      if (current != null && response.data?.isPin != null) {
        await _localDatasource.saveAuthUser(
          current.copyWith(isPin: response.data?.isPin),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailures, LoginResponse>> postLoginPin({
    required String identifier,
    required String pin,
  }) async {
    try {
      final response = await _remoteDatasource.postLoginPin(
        identifier: identifier,
        pin: pin,
      );

      if (response.meta?.success == false) {
        return Left(
          ServerFailures(
            statusCode: 401,
            title: 'Login gagal',
            message: response.meta?.message ?? 'Identifier atau PIN salah',
          ),
        );
      }

      final accessToken = response.data?.accessToken;
      final refreshToken = response.data?.refreshToken;
      final user = response.data?.user;

      if (accessToken != null) {
        await _localDatasource.saveAuthUser(
          AuthDataHive(
            accessToken: accessToken,
            refreshToken: refreshToken,
            name: user?.name,
            email: user?.email,
            photoUrl: user?.photoUrl,
          ),
        );
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(e);
    }
  }
}
