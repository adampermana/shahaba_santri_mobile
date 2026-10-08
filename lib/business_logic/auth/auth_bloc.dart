import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_hive.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_katanara_hive.dart';
import 'package:sahaba_mobile/domains/auth/login/login_respon_ai.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/auth/register/register_response.dart';
import 'package:sahaba_mobile/domains/auth/resend_otp/resend_otp_response.dart';
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
    on<_PostloginUser>(_onPostloginUser);
    on<_PostRegister>(_onPostRegister);
    on<_PostVerifyEmail>(_onPostVerifyEmail);
    on<_PostResendEmailOtp>(_onPostResendEmailOtp);
    on<_PostloginGuest>(_onPostloginGuest);
    on<_PostloginAi>(_onPostloginAi);
    on<_PostRestoreAccount>(_onPostRestoreAccount);
  }

  final IAuthRepositories _authRepositories;
  final DeviceInfoService _deviceInfoService;

  Future<void> _onStarted(_Started event, Emitter<AuthState> emit) async {}

  Future<void> _onPostloginUser(
    _PostloginUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingUser: true,
        successLoginUser: false,
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
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingUser: false,
          successLoginUser: true,
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
          messageVerifyOtp: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingVerifyEmail: false,
          successVerifyEmail: true,
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
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingResendOtp: false,
          successResendOtp: true,
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
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingGuest: false,
          successLoginGuest: true,
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
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingAi: false,
          successLoginAi: true,
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
      ),
    );

    final result = await _authRepositories.postRestoreAccount(jwt: event.jwt);

    result.fold(
      (f) => emit(
        state.copyWith(
          successRestoreAccount: false,
          loadingRestoreAccount: false,
          message: f.message,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingRestoreAccount: false,
          successRestoreAccount: true,
          message: r.message,
        ),
      ),
    );
  }
}
