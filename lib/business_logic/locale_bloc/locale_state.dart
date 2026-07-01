part of 'locale_bloc.dart';

@freezed
abstract class LocaleState with _$LocaleState {
  const factory LocaleState({@Default(Locale('en')) Locale locale}) =
      _LocaleState;
}
