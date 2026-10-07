import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_hive.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_katanara_hive.dart';
import 'package:sahaba_mobile/infrastructure/auth/repositories/i_auth_repositories.dart';

part 'auth_account_bloc.freezed.dart';
part 'auth_account_event.dart';
part 'auth_account_state.dart';

class AuthAccountBloc extends Bloc<AuthAccountEvent, AuthAccountState> {
  AuthAccountBloc(this._authRepository)
    : super(const AuthAccountState.loading()) {
    on<_CheckAuthStatus>(_onCheckAuthStatus);
    on<_SignedOut>(_onSignedOut);
  }

  final IAuthRepositories _authRepository;

  Future<void> _onCheckAuthStatus(
    _CheckAuthStatus event,
    Emitter<AuthAccountState> emit,
  ) async {
    emit(const AuthAccountState.loading());

    final userHive = _authRepository.fetchDataLoginUser();
    final guestHive = _authRepository.fetchDataLoginGuest();
    final aiHive = _authRepository.fetchDataLoginAi();

    if (userHive != null &&
        userHive.accessToken != null &&
        userHive.accessToken!.isNotEmpty) {
      emit(AuthAccountState.authenticatedUser(userHive, aiHive));
      return;
    }

    if (guestHive != null &&
        guestHive.accessToken != null &&
        guestHive.accessToken!.isNotEmpty) {
      emit(AuthAccountState.authenticatedGuest(guestHive));
      return;
    }

    emit(const AuthAccountState.unauthenticated());
  }

  Future<void> _onSignedOut(
    _SignedOut event,
    Emitter<AuthAccountState> emit,
  ) async {
    await _authRepository.clearAuthData();
    emit(const AuthAccountState.unauthenticated());
  }
}
