import 'package:dio/dio.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/auth/register/register_response.dart';
import 'package:sahaba_mobile/domains/auth/resend_otp/resend_otp_response.dart';
import 'package:sahaba_mobile/domains/auth/verify_otp/verify_otp_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

part 'auth_remote_datasource.dart';

abstract class IAuthRemoteDatasource {
  Future<LoginResponse> postLoginUser({
    required String identifier,
    required String password,
  });

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
}
