import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sahaba_mobile/domains/auth/complete_profile/complete_profile_response.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/auth/login/login_sso_response.dart';
import 'package:sahaba_mobile/domains/auth/register/register_response.dart';
import 'package:sahaba_mobile/domains/auth/verify_otp/verify_otp_response.dart';
import 'package:sahaba_mobile/domains/shared/meta_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

part 'auth_remote_datasource.dart';

abstract class IAuthRemoteDatasource {
  Future<LoginResponse> postLoginUser({
    required String email,
    required String password,
    required String deviceToken,
    required String platform,
  });
  Future<LoginResponAI> postLoginAi({
    required String email,
    required String password,
  });

  Future<MetaResponse> postLogoutUser({required int idUser});

  Future<LoginResponse> postLoginGuest({
    required String deviceToken,
    required String platform,
  });

  Future<LoginSsoResponse> postGoogleSSO({
    required String deviceToken,
    required String idToken,
    required String platform,
  });

  Future<LoginSsoResponse> postAppleSSO({
    required String deviceToken,
    required String idToken,
    required String platform,
    String? email,
    String? name,
  });

  Future<RegisterResponse> postRegister({required String email});

  Future<VerifyOtpResponse> postVerifyOtp({
    required String email,
    required String otp,
  });

  Future<CompleteProfileResponse> postCompleteRegisterProfile({
    required String confirmPassword,
    required String deviceToken,
    required String email,
    required String name,
    required String newPassword,
    required String phoneNumber,
    required String platform,
    required String verifyToken,
  });

  Future<CompleteProfileResponse> postCompleteSsoProfile({
    required String name,
    required String phoneNumber,
  });

  Future<CompleteProfileResponse> postCompleteAppleSsoProfile({
    required String name,
    required String phoneNumber,
  });

  Future<LoginResponse> postRestoreAccount({required String jwt});
}
