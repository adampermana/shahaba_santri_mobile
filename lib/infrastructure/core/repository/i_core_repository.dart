import 'dart:ui';

import 'package:sahaba_mobile/infrastructure/core/datasources/i_core_local_datasource.dart';

part 'core_repository.dart';

abstract class ICoreRepository {
  Future<void> saveLocale(Locale locale);
  Future<Locale?> loadLocale();
  Locale? getLocale();

  Future<void> saveOnBoarding({required bool isBoarding});
  bool fetchOnBoarding();
}
