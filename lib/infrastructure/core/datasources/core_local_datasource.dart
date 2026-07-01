part of 'i_core_local_datasource.dart';

class HiveCoreLocalDatasource implements ICoreLocalDatasource {
  static const String l10nBox = 'l10n-box';
  static const String _l10nKey = 'l10n_key';

  static const String onBoardingBox = 'onboarding-box';
  static const String _onBoardingKey = 'onboarding_key';

  @override
  Future<void> saveLocale(Locale locale) async {
    try {
      final languageCode = locale.languageCode;
      final countryCode = locale.countryCode != null
          ? '_${locale.countryCode}'
          : '';

      await Hive.box<String>(l10nBox).put(_l10nKey, languageCode + countryCode);
    } on CacheFailure catch (e) {
      debugPrint('Error saveLocale : $e');
    }
  }

  @override
  Locale? get locale {
    try {
      final localeName = Hive.box<String>(l10nBox).get(_l10nKey).toString();
      if (localeName.length > 5 || localeName.length < 2) {
        return null;
      }

      final separatorIndex = localeName.indexOf('-');
      final languageCode = localeName.substring(
        0,
        separatorIndex.isNegative ? null : separatorIndex,
      );
      final countryCode = separatorIndex.isNegative
          ? null
          : localeName.substring(separatorIndex + 1);

      return Locale(languageCode, countryCode);
    } on Exception catch (e) {
      debugPrint('Error locale : $e');
      return null;
    }
  }

  @override
  Future<void> saveOnBoarding({required bool isBoarding}) async {
    try {
      await Hive.box<bool>(onBoardingBox).put(_onBoardingKey, isBoarding);
    } on CacheFailure catch (e) {
      debugPrint('Error saveOnBoarding : $e');
    }
  }

  @override
  bool fetchOnBoarding() {
    try {
      return Hive.box<bool>(onBoardingBox).get(_onBoardingKey) ?? false;
    } on SocketException catch (e) {
      debugPrint('Error fetchOnBoarding : $e');
      return false;
    }
  }
}
