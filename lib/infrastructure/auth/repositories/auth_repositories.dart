part of 'i_auth_repositories.dart';

class AuthRepositories implements IAuthRepositories {
  AuthRepositories(this._localDatasource, this._remoteDatasource);

  final IAuthLocalDatasource _localDatasource;
  final IAuthRemoteDatasource _remoteDatasource;

  // Fetch local data
  @override
  AuthDataHive? fetchDataLoginGuest() => _localDatasource.authGuestDataHive;

  // Fetch local data
  @override
  AuthDataHive? fetchDataLoginUser() => _localDatasource.authUserDataHive;

  // Login
  @override
  Future<Either<ServerFailures, LoginResponse>> postLoginGuest({
    required String platform,
  }) async {
    try {
      final firebaseMessaging = sl<FirebaseMessaging>();
      final fcmToken = await firebaseMessaging.getToken();
      final response = await _remoteDatasource.postLoginGuest(
        deviceToken: fcmToken!,
        platform: platform,
      );

      final token = response.data?.token;
      if (token != null) {
        await _localDatasource.saveAuthGuest(
          AuthDataHive(
            accessToken: token,
            id: response.data?.userId,
            name: 'Guest',
            phoneNumber: '',

            // ssoProvider: null,
            // completeProfile: response.data?.isProfileCompleted ?? false,
          ),
        );
        // await _localDatasource.markProfileCompleted();
      }

      return Right(response);
    } on ServerFailures catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }

  // Login
  // @override
  // Future<Either<ServerFailures, LoginResponse>> postLoginUser({
  //   required String email,
  //   required String password,
  //   required String platform,
  // }) async {
  //   try {
  //     final firebaseMessaging = sl<FirebaseMessaging>();
  //     final fcmToken = await firebaseMessaging.getToken();
  //     final response = await _remoteDatasource.postLoginUser(
  //       email: email,
  //       password: password,
  //       deviceToken: fcmToken!,
  //       platform: platform,
  //     );

  //     final token = response.data?.token;
  //     if (token != null && response.data?.isPendingDeletion == false) {
  //       await _localDatasource.saveAuthUser(
  //         AuthDataHive(
  //           accessToken: token,
  //           id: response.data?.userId,
  //           // name: response.data?.name,
  //           // ssoProvider: null,
  //           // completeProfile: response.data?.isProfileCompleted ?? false,
  //         ),
  //         // token: token,
  //         // userId: response.data?.userId,
  //       );
  //       // await _localDatasource.markProfileCompleted();
  //     }

  //     return Right(response);
  //   } on ServerFailures catch (e) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: e.statusCode,
  //         title: e.title,
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future<Either<ServerFailures, MetaResponse>> postLogoutUser({
  //   required int userId,
  // }) async {
  //   try {
  //     final response = await _remoteDatasource.postLogoutUser(idUser: userId);
  //     return Right(response);
  //   } on ServerException catch (e) {
  //     await _localDatasource.clearAuthUser();
  //     return Left(
  //       ServerFailures(
  //         title: e.title,
  //         message: e.message,
  //         statusCode: e.statusCode,
  //       ),
  //     );
  //   } finally {
  //     await _localDatasource.clearAuthUser();
  //   }
  // }

  // Post SSO Google
  // @override
  // Future<Either<ServerFailures, LoginSsoResponse>> postGoogleSSO({
  //   required String platform,
  // }) async {
  //   try {
  //     final fcmToken = await FirebaseMessagingService.instance().getFcmToken();
  //     if (fcmToken == null || fcmToken.isEmpty) {
  //       return const Left(
  //         ServerFailures(
  //           statusCode: notificationServiceErrorCode,
  //           title: 'Token notifikasi tidak tersedia',
  //           message:
  //               'Tidak dapat mendaftarkan perangkat untuk notifikasi. '
  //               'Silakan coba lagi.',
  //         ),
  //       );
  //     }

  //     final sso = await sl<GoogleSignIn>().authenticate();
  //     final idToken = sso.authentication.idToken;
  //     final response = await _remoteDatasource.postGoogleSSO(
  //       deviceToken: fcmToken,
  //       idToken: idToken!,
  //       platform: platform,
  //     );
  //     final token = response.data?.token;
  //     final isProfileCompleted = response.data?.isProfileCompleted ?? false;
  //     if (token != null && response.data?.isPendingDeletion == false) {
  //       await _localDatasource.saveAuthUser(
  //         token: token,
  //         userId: response.data?.userId,
  //         name: response.data?.name,
  //         ssoProvider: 'google',
  //         completeteProfile: isProfileCompleted,
  //       );
  //     }

  //     return Right(response);
  //   } on GoogleSignInException catch (e) {
  //     final message = switch (e.code) {
  //       GoogleSignInExceptionCode.canceled => 'Login dibatalkan.',
  //       GoogleSignInExceptionCode.interrupted =>
  //         'Login Google terputus. Silakan coba lagi.',
  //       GoogleSignInExceptionCode.clientConfigurationError =>
  //         'Konfigurasi aplikasi tidak valid. Hubungi pengembang.',
  //       GoogleSignInExceptionCode.providerConfigurationError =>
  //         'Layanan Google Sign-In tidak tersedia saat ini.',
  //       GoogleSignInExceptionCode.uiUnavailable =>
  //         'Tidak dapat menampilkan halaman login Google.',
  //       GoogleSignInExceptionCode.userMismatch =>
  //         'Akun Google tidak sesuai. Silakan gunakan akun yang benar.',
  //       _ => 'Login dengan Google gagal. Silakan coba lagi.',
  //     };
  //     log(
  //       '[GoogleSignIn] ERROR — code: ${e.code}, description: ${e.description}',
  //     );
  //     return Left(
  //       ServerFailures(
  //         statusCode: -1,
  //         title: e.description ?? 'Opps something went wrong',
  //         message: message,
  //       ),
  //     );
  //   } on ServerFailures catch (e) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: e.statusCode,
  //         title: e.title,
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }

  // // Post SSO Apple
  // @override
  // Future<Either<ServerFailures, LoginSsoResponse>> postAppleSSO({
  //   required String platform,
  // }) async {
  //   if (!Platform.isIOS) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: -1,
  //         title: 'Platform tidak didukung',
  //         message: 'Login dengan Apple hanya tersedia di iOS.',
  //       ),
  //     );
  //   }

  //   try {
  //     final firebaseMessaging = sl<FirebaseMessaging>();
  //     final fcmToken = await firebaseMessaging.getToken();
  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     final idToken = appleCredential.identityToken;
  //     final email = appleCredential.email;
  //     final name = appleCredential.givenName;

  //     if (idToken == null || idToken.isEmpty) {
  //       return Left(
  //         ServerFailures(
  //           statusCode: -1,
  //           title: 'Token Apple tidak valid',
  //           message: 'Login dengan Apple gagal. Silakan coba lagi.',
  //         ),
  //       );
  //     }

  //     // Apple hanya mengirimkan email dan name pada login pertama.
  //     // Login selanjutnya kedua field ini akan null — ini adalah perilaku
  //     // normal dari Apple. Backend yang menangani keduanya.
  //     final response = await _remoteDatasource.postAppleSSO(
  //       deviceToken: fcmToken!,
  //       idToken: idToken,
  //       platform: platform,
  //       email: email,
  //       name: name,
  //     );
  //     final token = response.data?.token;
  //     final isProfileCompleted = response.data?.isProfileCompleted ?? false;
  //     if (token != null && response.data?.isPendingDeletion == false) {
  //       await _localDatasource.saveAuthUser(
  //         token: token,
  //         userId: response.data?.userId,
  //         name: response.data?.name,
  //         ssoProvider: 'apple',
  //         completeteProfile: isProfileCompleted,
  //       );
  //     }

  //     return Right(response);
  //   } on SignInWithAppleAuthorizationException catch (e) {
  //     final message = switch (e.code) {
  //       AuthorizationErrorCode.canceled => 'Login dibatalkan.',
  //       AuthorizationErrorCode.failed =>
  //         'Login dengan Apple gagal. Silakan coba lagi.',
  //       AuthorizationErrorCode.invalidResponse =>
  //         'Respons Apple tidak valid. Silakan coba lagi.',
  //       AuthorizationErrorCode.notHandled =>
  //         'Login Apple tidak dapat diproses saat ini.',
  //       AuthorizationErrorCode.notInteractive =>
  //         'Login Apple tidak dapat ditampilkan saat ini.',
  //       AuthorizationErrorCode.credentialExport =>
  //         'Login dengan Apple gagal. Silakan coba lagi.',
  //       AuthorizationErrorCode.credentialImport =>
  //         'Login dengan Apple gagal. Silakan coba lagi.',
  //       AuthorizationErrorCode.matchedExcludedCredential =>
  //         'Login dengan Apple gagal. Silakan coba lagi.',
  //       AuthorizationErrorCode.unknown =>
  //         'Login dengan Apple gagal. Silakan coba lagi.',
  //     };
  //     log('[AppleSignIn] ERROR — code: ${e.code}, message: ${e.message}');
  //     return Left(
  //       ServerFailures(statusCode: -1, title: e.message, message: message),
  //     );
  //   } on ServerFailures catch (e) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: e.statusCode,
  //         title: e.title,
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }

  // Register — step 1: request OTP
  // @override
  // Future<Either<ServerFailures, RegisterResponse>> postRegister({
  //   required String email,
  // }) async {
  //   try {
  //     final response = await _remoteDatasource.postRegister(email: email);
  //     return Right(response);
  //   } on ServerFailures catch (e) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: e.statusCode,
  //         title: e.title,
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }

  // Register — step 2: verify OTP
  // @override
  // Future<Either<ServerFailures, VerifyOtpResponse>> postVerifyOtp({
  //   required String email,
  //   required String otp,
  // }) async {
  //   try {
  //     final response = await _remoteDatasource.postVerifyOtp(
  //       email: email,
  //       otp: otp,
  //     );
  //     return Right(response);
  //   } on ServerFailures catch (e) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: e.statusCode,
  //         title: e.title,
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }

  // Register — step 3: complete profile
  // @override
  // Future<Either<ServerFailures, CompleteProfileResponse>>
  // postCompleteRegisterProfile({
  //   required String confirmPassword,
  //   required String deviceToken,
  //   required String email,
  //   required String name,
  //   required String newPassword,
  //   required String phoneNumber,
  //   required String platform,
  //   required String verifyToken,
  // }) async {
  //   try {
  //     final response = await _remoteDatasource.postCompleteRegisterProfile(
  //       confirmPassword: confirmPassword,
  //       deviceToken: deviceToken,
  //       email: email,
  //       name: name,
  //       newPassword: newPassword,
  //       phoneNumber: phoneNumber,
  //       platform: platform,
  //       verifyToken: verifyToken,
  //     );

  //     final token = response.data?.token;
  //     if (token != null) {
  //       await _localDatasource.saveAuthUser(
  //         token: token,
  //         userId: response.data?.userId,
  //         completeteProfile: true,
  //       );
  //       await _localDatasource.markProfileCompleted();
  //     }

  //     return Right(response);
  //   } on ServerFailures catch (e) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: e.statusCode,
  //         title: e.title,
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future<Either<ServerFailures, CompleteProfileResponse>>
  // postCompleteSsoProfile({
  //   required String name,
  //   required String phoneNumber,
  // }) async {
  //   try {
  //     final response = await _remoteDatasource.postCompleteSsoProfile(
  //       name: name,
  //       phoneNumber: phoneNumber,
  //     );
  //     if (response.data?.id != null) {
  //       await _localDatasource.markProfileCompleted();
  //     }
  //     return Right(response);
  //   } on ServerFailures catch (e) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: e.statusCode,
  //         title: e.title,
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future<Either<ServerFailures, CompleteProfileResponse>>
  // postCompleteAppleSsoProfile({
  //   required String name,
  //   required String phoneNumber,
  // }) async {
  //   try {
  //     final response = await _remoteDatasource.postCompleteAppleSsoProfile(
  //       name: name,
  //       phoneNumber: phoneNumber,
  //     );
  //     if (response.data?.id != null) {
  //       await _localDatasource.markProfileCompleted();
  //     }
  //     return Right(response);
  //   } on ServerFailures catch (e) {
  //     return Left(
  //       ServerFailures(
  //         statusCode: e.statusCode,
  //         title: e.title,
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }

  @override
  Future<Either<ServerFailures, LoginResponse>> postRestoreAccount({
    required String jwt,
  }) async {
    try {
      final response = await _remoteDatasource.postRestoreAccount(jwt: jwt);
      final token = response.data?.token;
      if (token != null) {
        await _localDatasource.saveAuthUser(
          AuthDataHive(
            accessToken: token,
            id: response.data?.userId,
            // name: response.data?.name,
            // ssoProvider: null,
            // completeProfile: response.data?.isProfileCompleted ?? false,
          ),
        );
        // await _localDatasource.markProfileCompleted();
      }
      return Right(response);
    } on ServerFailures catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }
}
