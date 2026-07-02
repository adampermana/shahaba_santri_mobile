import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:sahaba_mobile/domains/streak/streak_model.dart';
import 'package:sahaba_mobile/infrastructure/streak/datasources/i_streak_local_datasource.dart';

class StreakLocalDatasource implements IStreakLocalDatasource {
  static const String streakBox = 'streak_data';
  static const String _streakKey = 'streak_key';

  @override
  Future<StreakModel> getStreak(String date) async {
    final box = Hive.box<String>(streakBox);
    final raw = box.get(_streakKey);
    if (raw == null) return StreakModel.empty();
    return StreakModel.fromHiveMap(
      jsonDecode(raw) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> updateStreak(
    String date,
    String prayerName,
    bool checked,
  ) async {
    final box = Hive.box<String>(streakBox);
    final raw = box.get(_streakKey);
    final model = raw != null
        ? StreakModel.fromHiveMap(
            jsonDecode(raw) as Map<String, dynamic>,
          )
        : StreakModel.empty();

    model.checkedPrayers[prayerName] = checked;
    model.lastCheckedDate = date;
    await box.put(_streakKey, jsonEncode(model.toHiveMap()));
  }

  @override
  Future<void> saveStreakModel(StreakModel model) async {
    final box = Hive.box<String>(streakBox);
    await box.put(_streakKey, jsonEncode(model.toHiveMap()));
  }
}
