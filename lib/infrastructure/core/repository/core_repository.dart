part of 'i_core_repository.dart';

class CoreRepositories implements ICoreRepository {
  const CoreRepositories(this._localDatasource);
  final ICoreLocalDatasource _localDatasource;

  @override
  Future<void> saveLocale(Locale locale) => _localDatasource.saveLocale(locale);

  @override
  Future<Locale?> loadLocale() => Future.value(_localDatasource.locale);

  @override
  Locale? getLocale() => _localDatasource.locale;

  @override
  Future<void> saveOnBoarding({required bool isBoarding}) =>
      _localDatasource.saveOnBoarding(isBoarding: isBoarding);

  @override
  bool fetchOnBoarding() => _localDatasource.fetchOnBoarding();
}
