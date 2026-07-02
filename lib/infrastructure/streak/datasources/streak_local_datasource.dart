import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:sahaba_mobile/domains/streak/streak_model.dart';
import 'package:sahaba_mobile/infrastructure/streak/datasources/i_streak_local_datasource.dart';

class StreakLocalDatasource implements IStreakLocalDatasource {
  static const String streakBox = 'streak_data';
  static const String _legacyStreakKey = 'streak_key';

  @override
  Future<StreakModel> getStreak(String date) async {
    final box = Hive.box<String>(streakBox);
    final raw = box.get(date) ?? box.get(_legacyStreakKey);
    if (raw == null) return StreakModel.empty();
    final model = StreakModel.fromHiveMap(
      jsonDecode(raw) as Map<String, dynamic>,
    )..lastCheckedDate = date;
    await box.put(date, jsonEncode(model.toHiveMap()));
    return model;
  }

  @override
  Future<void> updateStreak(
    String date,
    String prayerName,
    bool checked,
  ) async {
    final box = Hive.box<String>(streakBox);
    final raw = box.get(date) ?? box.get(_legacyStreakKey);
    final model = raw != null
        ? StreakModel.fromHiveMap(
            jsonDecode(raw) as Map<String, dynamic>,
          )
        : StreakModel.empty();

    final checkedPrayers = Map<String, bool>.from(model.checkedPrayers)
      ..[prayerName] = checked;
    model
      ..checkedPrayers = checkedPrayers
      ..currentStreak = checkedPrayers.values
          .where((isChecked) => isChecked)
          .length
      ..lastCheckedDate = date;
    await box.put(date, jsonEncode(model.toHiveMap()));
  }

  @override
  Future<void> saveStreakModel(StreakModel model) async {
    final box = Hive.box<String>(streakBox);
    final date = model.lastCheckedDate;
    if (date == null) {
      await box.clear();
      return;
    }
    await box.put(date, jsonEncode(model.toHiveMap()));
  }
}
