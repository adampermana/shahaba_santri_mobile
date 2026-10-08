part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.postloginUser({
    required String identifier,
    required String password,
  }) = _PostloginUser;

  const factory AuthEvent.postRegister({
    required String name,
    required String email,
    required String password,
  }) = _PostRegister;

  const factory AuthEvent.postVerifyEmail({
    required String email,
    required String code,
  }) = _PostVerifyEmail;

  const factory AuthEvent.postResendEmailOtp({
    required String email,
  }) = _PostResendEmailOtp;

  const factory AuthEvent.postloginGuest() = _PostloginGuest;
  const factory AuthEvent.postloginAi() = _PostloginAi;
  const factory AuthEvent.postRestoreAccount({required String jwt}) =
      _PostRestoreAccount;
}
