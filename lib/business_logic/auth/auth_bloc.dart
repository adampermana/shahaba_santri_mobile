import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
import 'package:sahaba_mobile/infrastructure/auth/repositories/i_auth_repositories.dart';
import 'package:sahaba_mobile/infrastructure/failures/alert.dart';
import 'package:sahaba_mobile/infrastructure/services/device_info_service.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepositories, this._deviceInfoService)
    : super(AuthState.initial()) {
    on<_Started>(_onStarted);
    on<_GetValidationEmail>(_onGetValidationEmail);
    on<_PostloginUser>(_onPostloginUser);
    on<_PostRegister>(_onPostRegister);
    on<_PostVerifyEmail>(_onPostVerifyEmail);
    on<_PostResendEmailOtp>(_onPostResendEmailOtp);
    on<_PostloginGuest>(_onPostloginGuest);
    on<_PostloginAi>(_onPostloginAi);
    on<_PostRestoreAccount>(_onPostRestoreAccount);
    on<_PostCreatePin>(_onPostCreatePin);
    on<_PostRequestResetPinOtp>(_onPostRequestResetPinOtp);
    on<_PostResetPin>(_onPostResetPin);
  }

  final IAuthRepositories _authRepositories;
  final DeviceInfoService _deviceInfoService;

  Future<void> _onStarted(_Started event, Emitter<AuthState> emit) async {}

  Future<void> _onGetValidationEmail(
    _GetValidationEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingValidationEmail: true,
        successValidationEmail: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.getValidationEmail(
      email: event.email,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successValidationEmail: false,
          loadingValidationEmail: false,
          statusCode: f.statusCode,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingValidationEmail: false,
          successValidationEmail: true,
          statusCode: 200,
          validationEmailResponse: r,
          message: r.message,
        ),
      ),
    );
  }

  Future<void> _onPostloginUser(
    _PostloginUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingUser: true,
        successLoginUser: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postLoginUser(
      identifier: event.identifier,
      password: event.password,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successLoginUser: false,
          loadingUser: false,
          statusCode: f.statusCode,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingUser: false,
          successLoginUser: true,
          statusCode: 200,
          loginResponse: r,
          authDataHive: _authRepositories.fetchDataLoginUser(),
          message: r.message,
        ),
      ),
    );
  }

  Future<void> _onPostRegister(
    _PostRegister event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
        successRegister: false,
        isEmailUnverified: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postRegister(
      name: event.name,
      email: event.email,
      password: event.password,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successRegister: false,
          loading: false,
          statusCode: f.statusCode,
          pendingEmail: f.requiresVerification ? event.email : null,
          isEmailUnverified: f.requiresVerification,
          cooldownOtp: f.cooldownOtp ?? 60,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loading: false,
          successRegister: true,
          statusCode: 200,
          isEmailUnverified: false,
          pendingEmail: event.email,
          cooldownOtp: r.data?.cooldownOtp ?? 60,
          registerResponse: r,
          message: r.message,
        ),
      ),
    );
  }

  Future<void> _onPostVerifyEmail(
    _PostVerifyEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingVerifyEmail: true,
        successVerifyEmail: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postVerifyEmail(
      email: event.email,
      code: event.code,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successVerifyEmail: false,
          loadingVerifyEmail: false,
          statusCode: f.statusCode,
          messageVerifyOtp: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingVerifyEmail: false,
          successVerifyEmail: true,
          statusCode: 200,
          verifyEmailResponse: r,
          messageVerifyOtp: r.message,
        ),
      ),
    );
  }

  Future<void> _onPostResendEmailOtp(
    _PostResendEmailOtp event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingResendOtp: true,
        successResendOtp: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postResendEmailOtp(
      email: event.email,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successResendOtp: false,
          loadingResendOtp: false,
          statusCode: f.statusCode,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingResendOtp: false,
          successResendOtp: true,
          statusCode: 200,
          cooldownOtp: r.data?.cooldownOtp ?? 60,
          resendOtpResponse: r,
        ),
      ),
    );
  }

  Future<void> _onPostloginGuest(
    _PostloginGuest event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingGuest: true,
        successLoginGuest: false,
        statusCode: null,
      ),
    );

    final device = await _deviceInfoService.deviceInfo();

    final result = await _authRepositories.postLoginGuest(
      platform: device.platform,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successLoginGuest: false,
          loadingGuest: false,
          statusCode: f.statusCode,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingGuest: false,
          successLoginGuest: true,
          statusCode: 200,
          loginResponse: r,
          authDataHive: _authRepositories.fetchDataLoginGuest(),
          message: r.message,
        ),
      ),
    );
  }

  Future<void> _onPostloginAi(
    _PostloginAi event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingAi: true,
        successLoginAi: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postLoginAi(
      'sah@mail.com',
      '12345678',
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successLoginAi: false,
          loadingAi: false,
          statusCode: f.statusCode,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingAi: false,
          successLoginAi: true,
          statusCode: 200,
          loginAiResponse: r,
          authAiDataHive: _authRepositories.fetchDataLoginAi(),
        ),
      ),
    );
  }

  Future<void> _onPostRestoreAccount(
    _PostRestoreAccount event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingRestoreAccount: true,
        successRestoreAccount: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postRestoreAccount(jwt: event.jwt);

    result.fold(
      (f) => emit(
        state.copyWith(
          successRestoreAccount: false,
          loadingRestoreAccount: false,
          statusCode: f.statusCode,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingRestoreAccount: false,
          successRestoreAccount: true,
          statusCode: 200,
          message: r.message,
        ),
      ),
    );
  }

  Future<void> _onPostCreatePin(
    _PostCreatePin event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingCreatePin: true,
        successCreatePin: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postCreatePin(
      pin: event.pin,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successCreatePin: false,
          loadingCreatePin: false,
          statusCode: f.statusCode,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingCreatePin: false,
          successCreatePin: true,
          statusCode: 200,
          createPinResponse: r,
          message: r.message,
        ),
      ),
    );
  }

  Future<void> _onPostRequestResetPinOtp(
    _PostRequestResetPinOtp event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingRequestResetPinOtp: true,
        successRequestResetPinOtp: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postRequestResetPinOtp(
      email: event.email,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successRequestResetPinOtp: false,
          loadingRequestResetPinOtp: false,
          statusCode: f.statusCode,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingRequestResetPinOtp: false,
          successRequestResetPinOtp: true,
          statusCode: 200,
          cooldownOtp: r.data?.cooldownOtp ?? 60,
          requestResetPinResponse: r,
          message: r.message,
        ),
      ),
    );
  }

  Future<void> _onPostResetPin(
    _PostResetPin event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingResetPin: true,
        successResetPin: false,
        statusCode: null,
      ),
    );

    final result = await _authRepositories.postResetPin(
      email: event.email,
      code: event.code,
      pin: event.pin,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          successResetPin: false,
          loadingResetPin: false,
          statusCode: f.statusCode,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingResetPin: false,
          successResetPin: true,
          statusCode: 200,
          resetPinResponse: r,
          message: r.message,
        ),
      ),
    );
  }
}
