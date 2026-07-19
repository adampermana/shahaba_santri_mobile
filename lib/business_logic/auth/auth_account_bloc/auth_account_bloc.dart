// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:halal_cam/domain/auth/isar/auth_data_isar.dart';

// import '../../../infrastructure/auth/datasources/auth_local_datasource.dart';
// import '../../../infrastructure/auth/repositories/i_auth_repositories.dart';

// part 'auth_account_bloc.freezed.dart';
// part 'auth_account_event.dart';
// part 'auth_account_state.dart';

// class AuthAccountBloc extends Bloc<AuthAccountEvent, AuthAccountState> {
//   AuthAccountBloc(this._authRepository, this._authLocalDatasource)
//     : super(AuthAccountState.unauthenticated()) {
//     on<_CheckAuthStatus>(_onCheckAuthStatus);
//     on<_SignedOutUser>(_onSignOutUser);
//     on<_SignedOutGuest>(_onSignOutGuest);
//   }

//   final IAuthRepositories _authRepository;
//   final IAuthLocalDatasource _authLocalDatasource;

//   Future<void> _onCheckAuthStatus(
//     _CheckAuthStatus event,
//     Emitter<AuthAccountState> emit,
//   ) async {
//     final isAuthUser = await _authRepository.fetchDataLoginUser();
//     final isAuthGuest = await _authRepository.fetchDataLoginGuest();

//     emit(
//       isAuthUser != null
//           ? AuthAccountState.authenticatedUser(isAuthUser)
//           : isAuthGuest != null
//           ? AuthAccountState.authenticatedGuest(isAuthGuest)
//           : AuthAccountState.unauthenticated(),
//     );
//   }

//   Future<void> _onSignOutUser(
//     _SignedOutUser event,
//     Emitter<AuthAccountState> emit,
//   ) async {
//     await _authRepository.postLogoutUser(userId: event.userId);
//     emit(AuthAccountState.unauthenticated());
//   }

//   Future<void> _onSignOutGuest(
//     _SignedOutGuest event,
//     Emitter<AuthAccountState> emit,
//   ) async {
//     await _authLocalDatasource.clearAuthGuest();
//     debugPrint('=== SignOutGuest: state before emit => $state');
//     emit(AuthAccountState.unauthenticated());
//   }
// }
