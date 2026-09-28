import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/infrastructure/core/repository/i_core_repository.dart';

part 'core_cubit.freezed.dart';
part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit(this._coreRepository) : super(CoreState.initial());

  final ICoreRepository _coreRepository;

  void fetchOnBoarding() {
    final result = _coreRepository.fetchOnBoarding();
    emit(state.copyWith(isBoarding: result));
  }

  Future<void> saveBoardingScreen() async {
    emit(state.copyWith(isSubmmitBoard: false));

    await _coreRepository.saveOnBoarding(isBoarding: true);
    emit(state.copyWith(isBoarding: true, isSubmmitBoard: true));
  }
}
