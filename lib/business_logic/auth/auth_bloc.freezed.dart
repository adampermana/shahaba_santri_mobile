// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {
@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}

@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}
}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
}
/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);
  final _Started _self;
  final $Res Function(_Started) _then;
}

/// @nodoc
class _Started implements AuthEvent {
  const _Started();
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
  }
  @override
  int get hashCode => runtimeType.hashCode;
  @override
  String toString() => 'AuthEvent.started()';
}

/// @nodoc
abstract mixin class _$PostloginUserCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostloginUserCopyWith(_PostloginUser value, $Res Function(_PostloginUser) _then) = __$PostloginUserCopyWithImpl;
  @useResult
  $Res call({String identifier, String password});
}
/// @nodoc
class __$PostloginUserCopyWithImpl<$Res> implements _$PostloginUserCopyWith<$Res> {
  __$PostloginUserCopyWithImpl(this._self, this._then);
  final _PostloginUser _self;
  final $Res Function(_PostloginUser) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? identifier = null, Object? password = null}) {
    return _then(_PostloginUser(
      identifier: null == identifier ? _self.identifier : identifier as String,
      password: null == password ? _self.password : password as String,
    ));
  }
}

/// @nodoc
class _PostloginUser implements AuthEvent {
  const _PostloginUser({required this.identifier, required this.password});
  final String identifier;
  final String password;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostloginUser &&
            (identical(other.identifier, identifier) || other.identifier == identifier) &&
            (identical(other.password, password) || other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, password);

  @override
  String toString() => 'AuthEvent.postloginUser(identifier: $identifier, password: $password)';
}

/// @nodoc
abstract mixin class _$PostRegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostRegisterCopyWith(_PostRegister value, $Res Function(_PostRegister) _then) = __$PostRegisterCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}
/// @nodoc
class __$PostRegisterCopyWithImpl<$Res> implements _$PostRegisterCopyWith<$Res> {
  __$PostRegisterCopyWithImpl(this._self, this._then);
  final _PostRegister _self;
  final $Res Function(_PostRegister) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(_PostRegister(
      email: null == email ? _self.email : email as String,
      password: null == password ? _self.password : password as String,
    ));
  }
}

/// @nodoc
class _PostRegister implements AuthEvent {
  const _PostRegister({required this.email, required this.password});
  final String email;
  final String password;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostRegister &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) || other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() => 'AuthEvent.postRegister(email: $email, password: $password)';
}

/// @nodoc
abstract mixin class _$PostVerifyEmailCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostVerifyEmailCopyWith(_PostVerifyEmail value, $Res Function(_PostVerifyEmail) _then) = __$PostVerifyEmailCopyWithImpl;
  @useResult
  $Res call({String email, String code});
}
/// @nodoc
class __$PostVerifyEmailCopyWithImpl<$Res> implements _$PostVerifyEmailCopyWith<$Res> {
  __$PostVerifyEmailCopyWithImpl(this._self, this._then);
  final _PostVerifyEmail _self;
  final $Res Function(_PostVerifyEmail) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? code = null}) {
    return _then(_PostVerifyEmail(
      email: null == email ? _self.email : email as String,
      code: null == code ? _self.code : code as String,
    ));
  }
}

/// @nodoc
class _PostVerifyEmail implements AuthEvent {
  const _PostVerifyEmail({required this.email, required this.code});
  final String email;
  final String code;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostVerifyEmail &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @override
  String toString() => 'AuthEvent.postVerifyEmail(email: $email, code: $code)';
}

/// @nodoc
abstract mixin class _$PostResendEmailOtpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostResendEmailOtpCopyWith(_PostResendEmailOtp value, $Res Function(_PostResendEmailOtp) _then) = __$PostResendEmailOtpCopyWithImpl;
  @useResult
  $Res call({String email});
}
/// @nodoc
class __$PostResendEmailOtpCopyWithImpl<$Res> implements _$PostResendEmailOtpCopyWith<$Res> {
  __$PostResendEmailOtpCopyWithImpl(this._self, this._then);
  final _PostResendEmailOtp _self;
  final $Res Function(_PostResendEmailOtp) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(_PostResendEmailOtp(
      email: null == email ? _self.email : email as String,
    ));
  }
}

/// @nodoc
class _PostResendEmailOtp implements AuthEvent {
  const _PostResendEmailOtp({required this.email});
  final String email;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostResendEmailOtp &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() => 'AuthEvent.postResendEmailOtp(email: $email)';
}

/// @nodoc
abstract mixin class _$PostloginGuestCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostloginGuestCopyWith(_PostloginGuest value, $Res Function(_PostloginGuest) _then) = __$PostloginGuestCopyWithImpl;
}
/// @nodoc
class __$PostloginGuestCopyWithImpl<$Res> implements _$PostloginGuestCopyWith<$Res> {
  __$PostloginGuestCopyWithImpl(this._self, this._then);
  final _PostloginGuest _self;
  final $Res Function(_PostloginGuest) _then;
}

/// @nodoc
class _PostloginGuest implements AuthEvent {
  const _PostloginGuest();
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostloginGuest);
  }
  @override
  int get hashCode => runtimeType.hashCode;
  @override
  String toString() => 'AuthEvent.postloginGuest()';
}

/// @nodoc
abstract mixin class _$PostloginAiCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostloginAiCopyWith(_PostloginAi value, $Res Function(_PostloginAi) _then) = __$PostloginAiCopyWithImpl;
}
/// @nodoc
class __$PostloginAiCopyWithImpl<$Res> implements _$PostloginAiCopyWith<$Res> {
  __$PostloginAiCopyWithImpl(this._self, this._then);
  final _PostloginAi _self;
  final $Res Function(_PostloginAi) _then;
}

/// @nodoc
class _PostloginAi implements AuthEvent {
  const _PostloginAi();
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostloginAi);
  }
  @override
  int get hashCode => runtimeType.hashCode;
  @override
  String toString() => 'AuthEvent.postloginAi()';
}

/// @nodoc
abstract mixin class _$PostRestoreAccountCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostRestoreAccountCopyWith(_PostRestoreAccount value, $Res Function(_PostRestoreAccount) _then) = __$PostRestoreAccountCopyWithImpl;
  @useResult
  $Res call({String jwt});
}
/// @nodoc
class __$PostRestoreAccountCopyWithImpl<$Res> implements _$PostRestoreAccountCopyWith<$Res> {
  __$PostRestoreAccountCopyWithImpl(this._self, this._then);
  final _PostRestoreAccount _self;
  final $Res Function(_PostRestoreAccount) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? jwt = null}) {
    return _then(_PostRestoreAccount(
      jwt: null == jwt ? _self.jwt : jwt as String,
    ));
  }
}

/// @nodoc
class _PostRestoreAccount implements AuthEvent {
  const _PostRestoreAccount({required this.jwt});
  final String jwt;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostRestoreAccount &&
            (identical(other.jwt, jwt) || other.jwt == jwt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jwt);

  @override
  String toString() => 'AuthEvent.postRestoreAccount(jwt: $jwt)';
}

/// @nodoc
mixin _$AuthState {
  String? get message;
  String? get messageVerifyOtp;
  bool get loading;
  bool get loadingUser;
  bool get loadingGuest;
  bool get loadingAi;
  bool get loadingVerifyEmail;
  bool get loadingResendOtp;
  bool get loadingRestoreAccount;
  bool get successLoginUser;
  bool get successLoginGuest;
  bool get successLoginAi;
  bool get successRegister;
  bool get successVerifyEmail;
  bool get successResendOtp;
  bool get successRestoreAccount;
  bool get isEmailUnverified;
  int get cooldownOtp;
  String? get pendingEmail;
  LoginResponse? get loginResponse;
  LoginResponAI? get loginAiResponse;
  RegisterResponse? get registerResponse;
  VerifyOtpResponse? get verifyEmailResponse;
  ResendOtpResponse? get resendOtpResponse;
  AuthDataHive? get authDataHive;
  AuthDataKatanaraHive? get authAiDataHive;
  Alert? get alert;

  AuthState copyWith({
    String? message,
    String? messageVerifyOtp,
    bool? loading,
    bool? loadingUser,
    bool? loadingGuest,
    bool? loadingAi,
    bool? loadingVerifyEmail,
    bool? loadingResendOtp,
    bool? loadingRestoreAccount,
    bool? successLoginUser,
    bool? successLoginGuest,
    bool? successLoginAi,
    bool? successRegister,
    bool? successVerifyEmail,
    bool? successResendOtp,
    bool? successRestoreAccount,
    bool? isEmailUnverified,
    int? cooldownOtp,
    String? pendingEmail,
    LoginResponse? loginResponse,
    LoginResponAI? loginAiResponse,
    RegisterResponse? registerResponse,
    VerifyOtpResponse? verifyEmailResponse,
    ResendOtpResponse? resendOtpResponse,
    AuthDataHive? authDataHive,
    AuthDataKatanaraHive? authAiDataHive,
    Alert? alert,
  });
}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
  @useResult
  $Res call({
    String? message,
    String? messageVerifyOtp,
    bool loading,
    bool loadingUser,
    bool loadingGuest,
    bool loadingAi,
    bool loadingVerifyEmail,
    bool loadingResendOtp,
    bool loadingRestoreAccount,
    bool successLoginUser,
    bool successLoginGuest,
    bool successLoginAi,
    bool successRegister,
    bool successVerifyEmail,
    bool successResendOtp,
    bool successRestoreAccount,
    bool isEmailUnverified,
    int cooldownOtp,
    String? pendingEmail,
    LoginResponse? loginResponse,
    LoginResponAI? loginAiResponse,
    RegisterResponse? registerResponse,
    VerifyOtpResponse? verifyEmailResponse,
    ResendOtpResponse? resendOtpResponse,
    AuthDataHive? authDataHive,
    AuthDataKatanaraHive? authAiDataHive,
    Alert? alert,
  });
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);
  final AuthState _self;
  final $Res Function(AuthState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? messageVerifyOtp = freezed,
    Object? loading = null,
    Object? loadingUser = null,
    Object? loadingGuest = null,
    Object? loadingAi = null,
    Object? loadingVerifyEmail = null,
    Object? loadingResendOtp = null,
    Object? loadingRestoreAccount = null,
    Object? successLoginUser = null,
    Object? successLoginGuest = null,
    Object? successLoginAi = null,
    Object? successRegister = null,
    Object? successVerifyEmail = null,
    Object? successResendOtp = null,
    Object? successRestoreAccount = null,
    Object? isEmailUnverified = null,
    Object? cooldownOtp = null,
    Object? pendingEmail = freezed,
    Object? loginResponse = freezed,
    Object? loginAiResponse = freezed,
    Object? registerResponse = freezed,
    Object? verifyEmailResponse = freezed,
    Object? resendOtpResponse = freezed,
    Object? authDataHive = freezed,
    Object? authAiDataHive = freezed,
    Object? alert = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message ? _self.message : message as String?,
      messageVerifyOtp: freezed == messageVerifyOtp ? _self.messageVerifyOtp : messageVerifyOtp as String?,
      loading: null == loading ? _self.loading : loading as bool,
      loadingUser: null == loadingUser ? _self.loadingUser : loadingUser as bool,
      loadingGuest: null == loadingGuest ? _self.loadingGuest : loadingGuest as bool,
      loadingAi: null == loadingAi ? _self.loadingAi : loadingAi as bool,
      loadingVerifyEmail: null == loadingVerifyEmail ? _self.loadingVerifyEmail : loadingVerifyEmail as bool,
      loadingResendOtp: null == loadingResendOtp ? _self.loadingResendOtp : loadingResendOtp as bool,
      loadingRestoreAccount: null == loadingRestoreAccount ? _self.loadingRestoreAccount : loadingRestoreAccount as bool,
      successLoginUser: null == successLoginUser ? _self.successLoginUser : successLoginUser as bool,
      successLoginGuest: null == successLoginGuest ? _self.successLoginGuest : successLoginGuest as bool,
      successLoginAi: null == successLoginAi ? _self.successLoginAi : successLoginAi as bool,
      successRegister: null == successRegister ? _self.successRegister : successRegister as bool,
      successVerifyEmail: null == successVerifyEmail ? _self.successVerifyEmail : successVerifyEmail as bool,
      successResendOtp: null == successResendOtp ? _self.successResendOtp : successResendOtp as bool,
      successRestoreAccount: null == successRestoreAccount ? _self.successRestoreAccount : successRestoreAccount as bool,
      isEmailUnverified: null == isEmailUnverified ? _self.isEmailUnverified : isEmailUnverified as bool,
      cooldownOtp: null == cooldownOtp ? _self.cooldownOtp : cooldownOtp as int,
      pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail as String?,
      loginResponse: freezed == loginResponse ? _self.loginResponse : loginResponse as LoginResponse?,
      loginAiResponse: freezed == loginAiResponse ? _self.loginAiResponse : loginAiResponse as LoginResponAI?,
      registerResponse: freezed == registerResponse ? _self.registerResponse : registerResponse as RegisterResponse?,
      verifyEmailResponse: freezed == verifyEmailResponse ? _self.verifyEmailResponse : verifyEmailResponse as VerifyOtpResponse?,
      resendOtpResponse: freezed == resendOtpResponse ? _self.resendOtpResponse : resendOtpResponse as ResendOtpResponse?,
      authDataHive: freezed == authDataHive ? _self.authDataHive : authDataHive as AuthDataHive?,
      authAiDataHive: freezed == authAiDataHive ? _self.authAiDataHive : authAiDataHive as AuthDataKatanaraHive?,
      alert: freezed == alert ? _self.alert : alert as Alert?,
    ));
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? message,
    String? messageVerifyOtp,
    bool loading,
    bool loadingUser,
    bool loadingGuest,
    bool loadingAi,
    bool loadingVerifyEmail,
    bool loadingResendOtp,
    bool loadingRestoreAccount,
    bool successLoginUser,
    bool successLoginGuest,
    bool successLoginAi,
    bool successRegister,
    bool successVerifyEmail,
    bool successResendOtp,
    bool successRestoreAccount,
    bool isEmailUnverified,
    int cooldownOtp,
    String? pendingEmail,
    LoginResponse? loginResponse,
    LoginResponAI? loginAiResponse,
    RegisterResponse? registerResponse,
    VerifyOtpResponse? verifyEmailResponse,
    ResendOtpResponse? resendOtpResponse,
    AuthDataHive? authDataHive,
    AuthDataKatanaraHive? authAiDataHive,
    Alert? alert,
  });
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);
  final _Initial _self;
  final $Res Function(_Initial) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? messageVerifyOtp = freezed,
    Object? loading = null,
    Object? loadingUser = null,
    Object? loadingGuest = null,
    Object? loadingAi = null,
    Object? loadingVerifyEmail = null,
    Object? loadingResendOtp = null,
    Object? loadingRestoreAccount = null,
    Object? successLoginUser = null,
    Object? successLoginGuest = null,
    Object? successLoginAi = null,
    Object? successRegister = null,
    Object? successVerifyEmail = null,
    Object? successResendOtp = null,
    Object? successRestoreAccount = null,
    Object? isEmailUnverified = null,
    Object? cooldownOtp = null,
    Object? pendingEmail = freezed,
    Object? loginResponse = freezed,
    Object? loginAiResponse = freezed,
    Object? registerResponse = freezed,
    Object? verifyEmailResponse = freezed,
    Object? resendOtpResponse = freezed,
    Object? authDataHive = freezed,
    Object? authAiDataHive = freezed,
    Object? alert = freezed,
  }) {
    return _then(_Initial(
      message: freezed == message ? _self.message : message as String?,
      messageVerifyOtp: freezed == messageVerifyOtp ? _self.messageVerifyOtp : messageVerifyOtp as String?,
      loading: null == loading ? _self.loading : loading as bool,
      loadingUser: null == loadingUser ? _self.loadingUser : loadingUser as bool,
      loadingGuest: null == loadingGuest ? _self.loadingGuest : loadingGuest as bool,
      loadingAi: null == loadingAi ? _self.loadingAi : loadingAi as bool,
      loadingVerifyEmail: null == loadingVerifyEmail ? _self.loadingVerifyEmail : loadingVerifyEmail as bool,
      loadingResendOtp: null == loadingResendOtp ? _self.loadingResendOtp : loadingResendOtp as bool,
      loadingRestoreAccount: null == loadingRestoreAccount ? _self.loadingRestoreAccount : loadingRestoreAccount as bool,
      successLoginUser: null == successLoginUser ? _self.successLoginUser : successLoginUser as bool,
      successLoginGuest: null == successLoginGuest ? _self.successLoginGuest : successLoginGuest as bool,
      successLoginAi: null == successLoginAi ? _self.successLoginAi : successLoginAi as bool,
      successRegister: null == successRegister ? _self.successRegister : successRegister as bool,
      successVerifyEmail: null == successVerifyEmail ? _self.successVerifyEmail : successVerifyEmail as bool,
      successResendOtp: null == successResendOtp ? _self.successResendOtp : successResendOtp as bool,
      successRestoreAccount: null == successRestoreAccount ? _self.successRestoreAccount : successRestoreAccount as bool,
      isEmailUnverified: null == isEmailUnverified ? _self.isEmailUnverified : isEmailUnverified as bool,
      cooldownOtp: null == cooldownOtp ? _self.cooldownOtp : cooldownOtp as int,
      pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail as String?,
      loginResponse: freezed == loginResponse ? _self.loginResponse : loginResponse as LoginResponse?,
      loginAiResponse: freezed == loginAiResponse ? _self.loginAiResponse : loginAiResponse as LoginResponAI?,
      registerResponse: freezed == registerResponse ? _self.registerResponse : registerResponse as RegisterResponse?,
      verifyEmailResponse: freezed == verifyEmailResponse ? _self.verifyEmailResponse : verifyEmailResponse as VerifyOtpResponse?,
      resendOtpResponse: freezed == resendOtpResponse ? _self.resendOtpResponse : resendOtpResponse as ResendOtpResponse?,
      authDataHive: freezed == authDataHive ? _self.authDataHive : authDataHive as AuthDataHive?,
      authAiDataHive: freezed == authAiDataHive ? _self.authAiDataHive : authAiDataHive as AuthDataKatanaraHive?,
      alert: freezed == alert ? _self.alert : alert as Alert?,
    ));
  }
}

/// @nodoc
class _Initial implements AuthState {
  const _Initial({
    required this.message,
    required this.messageVerifyOtp,
    required this.loading,
    required this.loadingUser,
    required this.loadingGuest,
    required this.loadingAi,
    required this.loadingVerifyEmail,
    required this.loadingResendOtp,
    required this.loadingRestoreAccount,
    required this.successLoginUser,
    required this.successLoginGuest,
    required this.successLoginAi,
    required this.successRegister,
    required this.successVerifyEmail,
    required this.successResendOtp,
    required this.successRestoreAccount,
    required this.isEmailUnverified,
    required this.cooldownOtp,
    required this.pendingEmail,
    required this.loginResponse,
    required this.loginAiResponse,
    required this.registerResponse,
    required this.verifyEmailResponse,
    required this.resendOtpResponse,
    required this.authDataHive,
    required this.authAiDataHive,
    required this.alert,
  });

  @override final String? message;
  @override final String? messageVerifyOtp;
  @override final bool loading;
  @override final bool loadingUser;
  @override final bool loadingGuest;
  @override final bool loadingAi;
  @override final bool loadingVerifyEmail;
  @override final bool loadingResendOtp;
  @override final bool loadingRestoreAccount;
  @override final bool successLoginUser;
  @override final bool successLoginGuest;
  @override final bool successLoginAi;
  @override final bool successRegister;
  @override final bool successVerifyEmail;
  @override final bool successResendOtp;
  @override final bool successRestoreAccount;
  @override final bool isEmailUnverified;
  @override final int cooldownOtp;
  @override final String? pendingEmail;
  @override final LoginResponse? loginResponse;
  @override final LoginResponAI? loginAiResponse;
  @override final RegisterResponse? registerResponse;
  @override final VerifyOtpResponse? verifyEmailResponse;
  @override final ResendOtpResponse? resendOtpResponse;
  @override final AuthDataHive? authDataHive;
  @override final AuthDataKatanaraHive? authAiDataHive;
  @override final Alert? alert;

  @override
  AuthState copyWith({
    Object? message = freezed,
    Object? messageVerifyOtp = freezed,
    Object? loading = null,
    Object? loadingUser = null,
    Object? loadingGuest = null,
    Object? loadingAi = null,
    Object? loadingVerifyEmail = null,
    Object? loadingResendOtp = null,
    Object? loadingRestoreAccount = null,
    Object? successLoginUser = null,
    Object? successLoginGuest = null,
    Object? successLoginAi = null,
    Object? successRegister = null,
    Object? successVerifyEmail = null,
    Object? successResendOtp = null,
    Object? successRestoreAccount = null,
    Object? isEmailUnverified = null,
    Object? cooldownOtp = null,
    Object? pendingEmail = freezed,
    Object? loginResponse = freezed,
    Object? loginAiResponse = freezed,
    Object? registerResponse = freezed,
    Object? verifyEmailResponse = freezed,
    Object? resendOtpResponse = freezed,
    Object? authDataHive = freezed,
    Object? authAiDataHive = freezed,
    Object? alert = freezed,
  }) {
    return _Initial(
      message: freezed == message ? this.message : message as String?,
      messageVerifyOtp: freezed == messageVerifyOtp ? this.messageVerifyOtp : messageVerifyOtp as String?,
      loading: null == loading ? this.loading : loading as bool,
      loadingUser: null == loadingUser ? this.loadingUser : loadingUser as bool,
      loadingGuest: null == loadingGuest ? this.loadingGuest : loadingGuest as bool,
      loadingAi: null == loadingAi ? this.loadingAi : loadingAi as bool,
      loadingVerifyEmail: null == loadingVerifyEmail ? this.loadingVerifyEmail : loadingVerifyEmail as bool,
      loadingResendOtp: null == loadingResendOtp ? this.loadingResendOtp : loadingResendOtp as bool,
      loadingRestoreAccount: null == loadingRestoreAccount ? this.loadingRestoreAccount : loadingRestoreAccount as bool,
      successLoginUser: null == successLoginUser ? this.successLoginUser : successLoginUser as bool,
      successLoginGuest: null == successLoginGuest ? this.successLoginGuest : successLoginGuest as bool,
      successLoginAi: null == successLoginAi ? this.successLoginAi : successLoginAi as bool,
      successRegister: null == successRegister ? this.successRegister : successRegister as bool,
      successVerifyEmail: null == successVerifyEmail ? this.successVerifyEmail : successVerifyEmail as bool,
      successResendOtp: null == successResendOtp ? this.successResendOtp : successResendOtp as bool,
      successRestoreAccount: null == successRestoreAccount ? this.successRestoreAccount : successRestoreAccount as bool,
      isEmailUnverified: null == isEmailUnverified ? this.isEmailUnverified : isEmailUnverified as bool,
      cooldownOtp: null == cooldownOtp ? this.cooldownOtp : cooldownOtp as int,
      pendingEmail: freezed == pendingEmail ? this.pendingEmail : pendingEmail as String?,
      loginResponse: freezed == loginResponse ? this.loginResponse : loginResponse as LoginResponse?,
      loginAiResponse: freezed == loginAiResponse ? this.loginAiResponse : loginAiResponse as LoginResponAI?,
      registerResponse: freezed == registerResponse ? this.registerResponse : registerResponse as RegisterResponse?,
      verifyEmailResponse: freezed == verifyEmailResponse ? this.verifyEmailResponse : verifyEmailResponse as VerifyOtpResponse?,
      resendOtpResponse: freezed == resendOtpResponse ? this.resendOtpResponse : resendOtpResponse as ResendOtpResponse?,
      authDataHive: freezed == authDataHive ? this.authDataHive : authDataHive as AuthDataHive?,
      authAiDataHive: freezed == authAiDataHive ? this.authAiDataHive : authAiDataHive as AuthDataKatanaraHive?,
      alert: freezed == alert ? this.alert : alert as Alert?,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageVerifyOtp, messageVerifyOtp) || other.messageVerifyOtp == messageVerifyOtp) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loadingUser, loadingUser) || other.loadingUser == loadingUser) &&
            (identical(other.loadingGuest, loadingGuest) || other.loadingGuest == loadingGuest) &&
            (identical(other.loadingAi, loadingAi) || other.loadingAi == loadingAi) &&
            (identical(other.loadingVerifyEmail, loadingVerifyEmail) || other.loadingVerifyEmail == loadingVerifyEmail) &&
            (identical(other.loadingResendOtp, loadingResendOtp) || other.loadingResendOtp == loadingResendOtp) &&
            (identical(other.loadingRestoreAccount, loadingRestoreAccount) || other.loadingRestoreAccount == loadingRestoreAccount) &&
            (identical(other.successLoginUser, successLoginUser) || other.successLoginUser == successLoginUser) &&
            (identical(other.successLoginGuest, successLoginGuest) || other.successLoginGuest == successLoginGuest) &&
            (identical(other.successLoginAi, successLoginAi) || other.successLoginAi == successLoginAi) &&
            (identical(other.successRegister, successRegister) || other.successRegister == successRegister) &&
            (identical(other.successVerifyEmail, successVerifyEmail) || other.successVerifyEmail == successVerifyEmail) &&
            (identical(other.successResendOtp, successResendOtp) || other.successResendOtp == successResendOtp) &&
            (identical(other.successRestoreAccount, successRestoreAccount) || other.successRestoreAccount == successRestoreAccount) &&
            (identical(other.isEmailUnverified, isEmailUnverified) || other.isEmailUnverified == isEmailUnverified) &&
            (identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp) &&
            (identical(other.pendingEmail, pendingEmail) || other.pendingEmail == pendingEmail) &&
            (identical(other.loginResponse, loginResponse) || other.loginResponse == loginResponse) &&
            (identical(other.loginAiResponse, loginAiResponse) || other.loginAiResponse == loginAiResponse) &&
            (identical(other.registerResponse, registerResponse) || other.registerResponse == registerResponse) &&
            (identical(other.verifyEmailResponse, verifyEmailResponse) || other.verifyEmailResponse == verifyEmailResponse) &&
            (identical(other.resendOtpResponse, resendOtpResponse) || other.resendOtpResponse == resendOtpResponse) &&
            (identical(other.authDataHive, authDataHive) || other.authDataHive == authDataHive) &&
            (identical(other.authAiDataHive, authAiDataHive) || other.authAiDataHive == authAiDataHive) &&
            (identical(other.alert, alert) || other.alert == alert));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        message,
        messageVerifyOtp,
        loading,
        loadingUser,
        loadingGuest,
        loadingAi,
        loadingVerifyEmail,
        loadingResendOtp,
        loadingRestoreAccount,
        successLoginUser,
        successLoginGuest,
        successLoginAi,
        successRegister,
        successVerifyEmail,
        successResendOtp,
        successRestoreAccount,
        isEmailUnverified,
        cooldownOtp,
        pendingEmail,
        loginResponse,
        loginAiResponse,
        registerResponse,
        verifyEmailResponse,
        resendOtpResponse,
        authDataHive,
        authAiDataHive,
        alert,
      ]);

  @override
  String toString() => 'AuthState(message: $message, messageVerifyOtp: $messageVerifyOtp, loading: $loading, loadingUser: $loadingUser, loadingGuest: $loadingGuest, loadingAi: $loadingAi, loadingVerifyEmail: $loadingVerifyEmail, loadingResendOtp: $loadingResendOtp, loadingRestoreAccount: $loadingRestoreAccount, successLoginUser: $successLoginUser, successLoginGuest: $successLoginGuest, successLoginAi: $successLoginAi, successRegister: $successRegister, successVerifyEmail: $successVerifyEmail, successResendOtp: $successResendOtp, successRestoreAccount: $successRestoreAccount, isEmailUnverified: $isEmailUnverified, cooldownOtp: $cooldownOtp, pendingEmail: $pendingEmail, loginResponse: $loginResponse, loginAiResponse: $loginAiResponse, registerResponse: $registerResponse, verifyEmailResponse: $verifyEmailResponse, resendOtpResponse: $resendOtpResponse, authDataHive: $authDataHive, authAiDataHive: $authAiDataHive, alert: $alert)';
}
