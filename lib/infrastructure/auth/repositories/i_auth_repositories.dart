import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_hive.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_katanara_hive.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/i_auth_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/injector.dart';

part 'auth_repositories.dart';

abstract class IAuthRepositories {
  /// Fetch persisted login data from local storage
  AuthDataHive? fetchDataLoginUser();
  AuthDataHive? fetchDataLoginGuest();
  AuthDataKatanaraHive? fetchDataLoginAi();

  // Future<bool> getCompleteProfile();

  Future<Either<ServerFailures, LoginResponse>> postLoginGuest({
    required String platform,
  });

  /// Login — FCM token & platform are fetched internally inside the repository
  // Future<Either<ServerFailures, LoginResponse>> postLoginUser({
  //   required String email,
  //   required String password,
  //   required String platform,
  // });

  // Future<Either<ServerFailures, MetaResponse>> postLogoutUser({
  //   required int userId,
  // });

  // Future<Either<ServerFailures, LoginSsoResponse>> postGoogleSSO({
  //   required String platform,
  // });

  // Future<Either<ServerFailures, LoginSsoResponse>> postAppleSSO({
  //   required String platform,
  // });

  /// Register — sends email, triggers OTP
  // Future<Either<ServerFailures, RegisterResponse>> postRegister({
  //   required String email,
  // });

  /// Verify OTP from register flow
  // Future<Either<ServerFailures, VerifyOtpResponse>> postVerifyOtp({
  //   required String email,
  //   required String otp,
  // });

  /// Complete profile after OTP verified
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
  // });

  // Future<Either<ServerFailures, CompleteProfileResponse>>
  // postCompleteSsoProfile({required String name, required String phoneNumber});

  // Future<Either<ServerFailures, CompleteProfileResponse>>
  // postCompleteAppleSsoProfile({
  //   required String name,
  //   required String phoneNumber,
  // });

  /// Restore account before deletion deadline
  Future<Either<ServerFailures, LoginResponse>> postRestoreAccount({
    required String jwt,
  });

  /// AI Login — Katanara AI auth
  Future<Either<ServerFailures, LoginResponAI>> postLoginAi(
    String email,
    String password,
  );
}
