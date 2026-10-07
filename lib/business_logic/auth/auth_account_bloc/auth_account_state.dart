part of 'auth_account_bloc.dart';

@freezed
sealed class AuthAccountState with _$AuthAccountState {
  const factory AuthAccountState.loading() = AuthAccountLoading;
  const factory AuthAccountState.unauthenticated() = AuthAccountUnauthenticated;
  const factory AuthAccountState.authenticatedUser(
    AuthDataHive authData, [
    AuthDataKatanaraHive? aiData,
  ]) = AuthAccountAuthenticatedUser;
  const factory AuthAccountState.authenticatedGuest(
    AuthDataHive authData,
  ) = AuthAccountAuthenticatedGuest;
}
