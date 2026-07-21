import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/auth/complete_profile/complete_profile_response.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_hive.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/auth/login/login_sso_response.dart';
import 'package:sahaba_mobile/domains/auth/register/register_response.dart';
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
    on<_PostloginGuest>(_onPostloginGuest);
    on<_Postlogin>(_onPostloginUser);
    on<_PostSSO>(_onPostSSO);
    on<_PostAppleSSO>(_onPostAppleSSO);
    on<_PostRegister>(_onPostRegister);
    on<_PostVerifyOtp>(_onPostVerifyOtp);
    on<_PostCompleteRegisterProfile>(_onPostCompleteRegisterProfile);
    on<_PostCompleteSsoProfile>(_onPostCompleteSsoProfile);
    on<_PostCompleteAppleSsoProfile>(_onPostCompleteAppleSsoProfile);
    on<_PostRestoreAccount>(_onPostRestoreAccount);
    on<_GetLocalUser>(_onGetLocalUser);
  }

  final IAuthRepositories _authRepositories;
  final DeviceInfoService _deviceInfoService;

  Future<void> _onStarted(_Started event, Emitter<AuthState> emit) async {}

  Future<void> _onPostloginGuest(
    _PostloginGuest event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingGuest: true,
        successLoginGuest: false,
        alert: null,
        message: null,
      ),
    );

    // Device info
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
          loginResponse: null,
          alert: Alert.fromFailures(f),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loadingGuest: false,
          successLoginGuest: true,
          loginResponse: r,
          alert: null,
          message: r.meta?.message,
        ),
      ),
    );
  }

  Future<void> _onPostloginUser(
    _Postlogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingUser: true,
        successLoginUser: false,
        alert: null,
        message: null,
      ),
    );

    // Device info
    final device = await _deviceInfoService.deviceInfo();

    // final result = await _authRepositories.postLoginUser(
    //   email: event.email,
    //   password: event.password,
    //   platform: device.platform,
    // );

    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       successLoginUser: false,
    //       loadingUser: false,
    //       message: f.message,
    //       loginResponse: null,
    //       alert: Alert.fromFailures(f),
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       loadingUser: false,
    //       successLoginUser: true,
    //       loginResponse: r,
    //       message: r.meta?.message,
    //       alert: null,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPostSSO(_PostSSO event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        loadingSSO: true,
        successGoogleAuth: false,
        alert: null,
        message: null,
      ),
    );

    // Device info
    // final device = await _deviceInfoService.deviceInfo();

    // final result = await _authRepositories.postGoogleSSO(
    //   platform: device.platform,
    // );

    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       successGoogleAuth: false,
    //       loadingSSO: false,
    //       message: f.message,
    //       alert: Alert.fromFailures(f),
    //       loginSsoResponse: null,
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       loadingSSO: false,
    //       successGoogleAuth: true,
    //       loginSsoResponse: r,
    //       alert: null,
    //       message: r.meta?.message,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPostAppleSSO(
    _PostAppleSSO event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingSSO: true,
        successGoogleAuth: false,
        alert: null,
        message: null,
      ),
    );

    // final device = await _deviceInfoService.deviceInfo();

    // final result = await _authRepositories.postAppleSSO(
    //   platform: device.platform,
    // );

    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       successGoogleAuth: false,
    //       loadingSSO: false,
    //       message: f.message,
    //       alert: Alert.fromFailures(f),
    //       loginSsoResponse: null,
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       loadingSSO: false,
    //       successGoogleAuth: true,
    //       loginSsoResponse: r,
    //       alert: null,
    //       message: r.meta?.message,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPostRegister(
    _PostRegister event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
        successRegister: false,
        alert: null,
        message: null,
      ),
    );

    // final result = await _authRepositories.postRegister(email: event.email);

    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       successRegister: false,
    //       loading: false,
    //       message: f.message,
    //       alert: Alert.fromFailures(f),
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       loading: false,
    //       successRegister: true,
    //       pendingEmail: event.email,
    //       registerResponse: r,
    //       alert: null,
    //       message: r.meta?.message,
    //       resendIn: r.data?.resendIn,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPostVerifyOtp(
    _PostVerifyOtp event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingVerifyOtp: true,
        successVerifyOtp: false,
        alert: null,
        messageVerifyOtp: null,
      ),
    );

    // final result = await _authRepositories.postVerifyOtp(
    //   email: event.email,
    //   otp: event.otp,
    // );

    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       successVerifyOtp: false,
    //       loadingVerifyOtp: false,
    //       messageVerifyOtp: f.message,
    //       alert: Alert.fromFailures(f),
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       loadingVerifyOtp: false,
    //       successVerifyOtp: true,
    //       verifyToken:
    //           r.data?.verifyToken, // simpan untuk complete profile step
    //       verifyOtpResponse: r,
    //       alert: null,
    //       messageVerifyOtp: r.meta?.message,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPostCompleteRegisterProfile(
    _PostCompleteRegisterProfile event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
        successCompleteProfile: false,
        alert: null,
        message: null,
      ),
    );

    // final result = await _authRepositories.postCompleteRegisterProfile(
    //   confirmPassword: event.confirmPassword,
    //   deviceToken: event.deviceToken,
    //   email: event.email,
    //   name: event.name,
    //   newPassword: event.newPassword,
    //   phoneNumber: event.phoneNumber,
    //   platform: event.platform,
    //   verifyToken: event.verifyToken,
    // );

    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       successCompleteProfile: false,
    //       loading: false,
    //       message: f.message,
    //       completeProfileResponse: null,
    //       alert: Alert.fromFailures(f),
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       loading: false,
    //       successCompleteProfile: true,
    //       alert: null,
    //       message: r.meta?.message,
    //       completeProfileResponse: r,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPostCompleteSsoProfile(
    _PostCompleteSsoProfile event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
        successCompleteProfile: false,
        alert: null,
        message: null,
      ),
    );

    // final result = await _authRepositories.postCompleteSsoProfile(
    //   name: event.name,
    //   phoneNumber: event.phoneNumber,
    // );

    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       successCompleteProfile: false,
    //       loading: false,
    //       message: f.message,
    //       alert: Alert.fromFailures(f),
    //       completeProfileResponse: null,
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       loading: false,
    //       successCompleteProfile: true,
    //       alert: null,
    //       message: r.meta?.message,
    //       completeProfileResponse: r,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPostCompleteAppleSsoProfile(
    _PostCompleteAppleSsoProfile event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
        successCompleteProfile: false,
        alert: null,
        message: null,
      ),
    );

    // final result = await _authRepositories.postCompleteAppleSsoProfile(
    //   name: event.name,
    //   phoneNumber: event.phoneNumber,
    // );

    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       successCompleteProfile: false,
    //       loading: false,
    //       message: f.message,
    //       alert: Alert.fromFailures(f),
    //       completeProfileResponse: null,
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       loading: false,
    //       successCompleteProfile: true,
    //       alert: null,
    //       message: r.meta?.message,
    //       completeProfileResponse: r,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPostRestoreAccount(
    _PostRestoreAccount event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingRestoreAccount: true,
        successRestoreAccount: false,
        alert: null,
        message: null,
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
          alert: null,
          message: r.meta?.message,
        ),
      ),
    );
  }

  Future<void> _onGetLocalUser(
    _GetLocalUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    final result = _authRepositories.fetchDataLoginGuest();
    if (result == null) {
      emit(
        state.copyWith(
          loading: false,
        ),
      );
      add(const AuthEvent.postloginGuest());
      return;
    }
    emit(state.copyWith(authDataHive: result, loading: false));
  }
}
