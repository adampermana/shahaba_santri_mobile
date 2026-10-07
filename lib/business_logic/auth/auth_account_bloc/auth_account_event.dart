part of 'auth_account_bloc.dart';

@freezed
class AuthAccountEvent with _$AuthAccountEvent {
  const factory AuthAccountEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthAccountEvent.signedOut() = _SignedOut;
}
