part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.getValidationEmail({
    required String email,
  }) = _GetValidationEmail;

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
  const factory AuthEvent.postCreatePin({
    required String pin,
  }) = _PostCreatePin;
  const factory AuthEvent.postRequestResetPinOtp({
    required String email,
  }) = _PostRequestResetPinOtp;
  const factory AuthEvent.postResetPin({
    required String email,
    required String code,
    required String pin,
  }) = _PostResetPin;

  const factory AuthEvent.postRequestForgotPasswordOtp({
    required String email,
  }) = _PostRequestForgotPasswordOtp;

  const factory AuthEvent.postResetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) = _PostResetPassword;

  const factory AuthEvent.postLoginPin({
    required String identifier,
    required String pin,
  }) = _PostLoginPin;
}
