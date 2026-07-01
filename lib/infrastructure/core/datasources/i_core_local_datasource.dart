import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

part 'core_local_datasource.dart';

abstract class ICoreLocalDatasource {
  Future<void> saveLocale(Locale locale);
  Locale? get locale;

  Future<void> saveOnBoarding({required bool isBoarding});

  bool fetchOnBoarding();
}
