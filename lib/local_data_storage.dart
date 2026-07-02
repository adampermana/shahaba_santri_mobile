import 'dart:io';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sahaba_mobile/infrastructure/core/datasources/i_core_local_datasource.dart';

late Directory appCacheDir;

Future<void> initHiveStorage() async {
  appCacheDir = await getApplicationCacheDirectory();
  await Hive.initFlutter(appCacheDir.absolute.path);
  // await _registerAdapterHive();
  await initHiveBox();
}

// Future<void> _registerAdapterHive() async {
//   Hive.registerAdapter();
// }

Future<void> initHiveBox() async {
  await Hive.openBox<String>(HiveCoreLocalDatasource.l10nBox);

  await Hive.openBox<bool>(HiveCoreLocalDatasource.onBoardingBox);
}
