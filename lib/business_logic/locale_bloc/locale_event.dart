part of 'locale_bloc.dart';

@freezed
class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.loadCurrentLocale() = _LoadCurrentLocale;
  const factory LocaleEvent.loadLocale(Locale locale) = _LoadLocale;
  const factory LocaleEvent.loadLocaleName(
    String languageCode, [
    String? countryCode,
  ]) = _LoadLocaleName;
}
