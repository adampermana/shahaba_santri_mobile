part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.postloginGuest() = _PostloginGuest;
  const factory AuthEvent.postloginAi() = _PostloginAi;
  const factory AuthEvent.postloginUser({
    required String email,
    required String password,
  }) = _Postlogin;

  const factory AuthEvent.postSSO() = _PostSSO;

  const factory AuthEvent.postAppleSSO() = _PostAppleSSO;

  const factory AuthEvent.postRegister({required String email}) = _PostRegister;

  const factory AuthEvent.postVerifyOtp({
    required String email,
    required String otp,
  }) = _PostVerifyOtp;

  const factory AuthEvent.postForgotPassword({required String email}) =
      _PostForgotPassword;

  const factory AuthEvent.postCompleteRegisterProfile({
    required String confirmPassword,
    required String deviceToken,
    required String email,
    required String name,
    required String newPassword,
    required String phoneNumber,
    required String platform,
    required String verifyToken,
  }) = _PostCompleteRegisterProfile;

  const factory AuthEvent.postCompleteSsoProfile({
    required String name,
    required String phoneNumber,
  }) = _PostCompleteSsoProfile;

  const factory AuthEvent.postCompleteAppleSsoProfile({
    required String name,
    required String phoneNumber,
  }) = _PostCompleteAppleSsoProfile;

  const factory AuthEvent.postRestoreAccount({required String jwt}) =
      _PostRestoreAccount;

  // Method Ini Hanya sementara
  const factory AuthEvent.getLocalUser() = _GetLocalUser;
}
