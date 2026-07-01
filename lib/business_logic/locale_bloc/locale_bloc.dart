import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/infrastructure/core/repository/i_core_repository.dart';

part 'locale_event.dart';
part 'locale_state.dart';
part 'locale_bloc.freezed.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(this._localeRepository)
    : super(
        LocaleState(
          locale: _localeRepository.getLocale() ?? const Locale('en'),
        ),
      ) {
    on<_LoadCurrentLocale>(_onLoadCurrentLocale);
    on<_LoadLocale>(_onLoadLocale);
    on<_LoadLocaleName>(_onLoadLocaleName);
  }

  final ICoreRepository _localeRepository;

  Future<void> _onLoadCurrentLocale(
    _LoadCurrentLocale event,
    Emitter<LocaleState> emit,
  ) async {
    final locale = _localeRepository.getLocale();
    if (locale != null) {
      emit(state.copyWith(locale: locale));
    } else {
      await _localeRepository.saveLocale(state.locale);
    }
  }

  Future<void> _onLoadLocale(
    _LoadLocale event,
    Emitter<LocaleState> emit,
  ) async {
    await _localeRepository.saveLocale(event.locale);
    emit(state.copyWith(locale: event.locale));
  }

  Future<void> _onLoadLocaleName(
    _LoadLocaleName event,
    Emitter<LocaleState> emit,
  ) async {
    final locale = Locale(event.languageCode, event.countryCode);

    await _localeRepository.saveLocale(locale);
    emit(state.copyWith(locale: locale));
  }
}
