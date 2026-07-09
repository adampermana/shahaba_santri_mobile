import 'dart:io';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/calendar_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/core/datasources/i_core_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/prayer_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/quran_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/services/adzan_service.dart';
import 'package:sahaba_mobile/infrastructure/streak/datasources/streak_local_datasource.dart';

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

  // Prayer schedule boxes
  await Hive.openBox<String>(PrayerLocalDatasource.selectedCityBox);
  await Hive.openBox<String>(PrayerLocalDatasource.prayerCacheBox);

  // Streak box
  await Hive.openBox<String>(StreakLocalDatasource.streakBox);

  // Adzan settings box
  await Hive.openBox<bool>(AdzanService.adzanPreferenceBox);

  // Calendar box
  await Hive.openBox<String>(CalendarLocalDatasource.calendarBox);

  // Quran box
  await Hive.openBox<String>(QuranLocalDatasource.lastReadBox);
}
