import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_hive.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_katanara_hive.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/auth/pin/pin_response.dart';
import 'package:sahaba_mobile/domains/auth/pin/request_reset_pin_response.dart';
import 'package:sahaba_mobile/domains/auth/register/register_response.dart';
import 'package:sahaba_mobile/domains/auth/resend_otp/resend_otp_response.dart';
import 'package:sahaba_mobile/domains/auth/validation_email/validation_email_response.dart';
import 'package:sahaba_mobile/domains/auth/verify_otp/verify_otp_response.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/i_auth_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/services/firebase_messaging_service.dart';

part 'auth_repositories.dart';

abstract class IAuthRepositories {
  AuthDataHive? fetchDataLoginUser();
  AuthDataHive? fetchDataLoginGuest();
  AuthDataKatanaraHive? fetchDataLoginAi();

  Future<Either<ServerFailures, ValidationEmailResponse>> getValidationEmail({
    required String email,
  });

  Future<Either<ServerFailures, LoginResponse>> postLoginUser({
    required String identifier,
    required String password,
  });

  Future<Either<ServerFailures, RegisterResponse>> postRegister({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<ServerFailures, VerifyOtpResponse>> postVerifyEmail({
    required String email,
    required String code,
  });

  Future<Either<ServerFailures, ResendOtpResponse>> postResendEmailOtp({
    required String email,
  });

  Future<Either<ServerFailures, LoginResponse>> postLoginGuest({
    required String platform,
  });

  Future<Either<ServerFailures, LoginResponse>> postRestoreAccount({
    required String jwt,
  });

  Future<Either<ServerFailures, LoginResponAI>> postLoginAi(
    String email,
    String password,
  );

  Future<Either<ServerFailures, PinResponse>> postCreatePin({
    required String pin,
  });

  Future<Either<ServerFailures, RequestResetPinResponse>>
  postRequestResetPinOtp({required String email});

  Future<Either<ServerFailures, PinResponse>> postResetPin({
    required String email,
    required String code,
    required String pin,
  });

  Future<void> clearAuthData();
}
