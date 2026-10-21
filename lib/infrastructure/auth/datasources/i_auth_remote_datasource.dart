import 'package:dio/dio.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/password/forgot_password_response.dart';
import 'package:sahaba_mobile/domains/auth/password/reset_password_response.dart';
import 'package:sahaba_mobile/domains/auth/pin/pin_response.dart';
import 'package:sahaba_mobile/domains/auth/pin/request_reset_pin_response.dart';
import 'package:sahaba_mobile/domains/auth/profile/user_profile_response.dart';
import 'package:sahaba_mobile/domains/auth/register/register_response.dart';
import 'package:sahaba_mobile/domains/auth/resend_otp/resend_otp_response.dart';
import 'package:sahaba_mobile/domains/auth/validation_email/validation_email_response.dart';
import 'package:sahaba_mobile/domains/auth/verify_otp/verify_otp_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

part 'auth_remote_datasource.dart';

abstract class IAuthRemoteDatasource {
  Future<ValidationEmailResponse> getValidationEmail({
    required String email,
  });

  Future<LoginResponse> postLoginUser({
    required String email,
    required String password,
    required String fcmToken,
  });

  Future<LoginResponse> postRefreshToken({
    required String refreshToken,
  });

  Future<UserProfileResponse> getUserProfile();

  Future<RegisterResponse> postRegister({
    required String name,
    required String email,
    required String password,
  });

  Future<VerifyOtpResponse> postVerifyEmail({
    required String email,
    required String code,
  });

  Future<ResendOtpResponse> postResendEmailOtp({
    required String email,
  });

  Future<LoginResponAI> postLoginAi({
    required String email,
    required String password,
  });

  Future<LoginResponse> postLoginGuest({
    required String deviceToken,
    required String platform,
  });

  Future<LoginResponse> postRestoreAccount({required String jwt});

  Future<PinResponse> postCreatePin({
    required String pin,
  });

  Future<RequestResetPinResponse> postRequestResetPinOtp({
    required String email,
  });

  Future<PinResponse> postResetPin({
    required String email,
    required String code,
    required String pin,
  });

  Future<ForgotPasswordResponse> postRequestForgotPasswordOtp({
    required String email,
  });

  Future<ResetPasswordResponse> postResetPassword({
    required String email,
    required String code,
    required String newPassword,
  });

  Future<LoginResponse> postLoginPin({
    required String identifier,
    required String pin,
  });
}
