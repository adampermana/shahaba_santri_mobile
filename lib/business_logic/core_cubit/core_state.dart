part of 'core_cubit.dart';

@freezed
abstract class CoreState with _$CoreState {
  const factory CoreState({
    required int tabIndex,
    required bool isSubmmitBoard,
    required bool isBoarding,
    required String? titleErrorMessage,
    required String? errorMessage,
  }) = _CoreState;

  factory CoreState.initial() => const CoreState(
    tabIndex: 0,
    isSubmmitBoard: false,
    isBoarding: false,
    titleErrorMessage: null,
    errorMessage: null,
  );
}
