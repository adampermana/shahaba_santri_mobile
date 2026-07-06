import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:sahaba_mobile/domains/streak/streak_model.dart';
import 'package:sahaba_mobile/infrastructure/streak/datasources/i_streak_local_datasource.dart';

class StreakLocalDatasource implements IStreakLocalDatasource {
  static const String streakBox = 'streak_data';

  @override
  Future<StreakModel> getStreak(String date) async {
    final box = Hive.box<String>(streakBox);
    final model = _readModel(box, date) ?? StreakModel.empty();
    final currentStreak = _totalCheckedPrayerCount(box);
    final shouldBackfill =
        box.containsKey(date) &&
        (model.lastCheckedDate != date || model.currentStreak != currentStreak);

    model
      ..currentStreak = currentStreak
      ..lastCheckedDate = date;

    if (shouldBackfill) {
      await box.put(date, jsonEncode(model.toHiveMap()));
    }
    return model;
  }

  @override
  Future<void> updateStreak(
    String date,
    String prayerName,
    bool checked,
  ) async {
    final box = Hive.box<String>(streakBox);
    final model = _readModel(box, date) ?? StreakModel.empty();

    final checkedPrayers = Map<String, bool>.from(model.checkedPrayers)
      ..[prayerName] = checked;
    final updatedModel = model
      ..checkedPrayers = checkedPrayers
      ..lastCheckedDate = date;
    final currentStreak = _totalCheckedPrayerCount(
      box,
      overrideDate: date,
      overrideModel: updatedModel,
    );
    model
      ..currentStreak = currentStreak
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

  StreakModel? _readModel(Box<String> box, String date) {
    final raw = box.get(date);
    if (raw == null) return null;

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return StreakModel.fromHiveMap(
        decoded.map((key, value) => MapEntry(key.toString(), value)),
      );
    } on FormatException {
      return null;
    }
  }

  int _totalCheckedPrayerCount(
    Box<String> box, {
    String? overrideDate,
    StreakModel? overrideModel,
  }) {
    var total = 0;
    var hasOverrideDate = false;

    for (final key in box.keys) {
      final date = key.toString();
      if (!_isDateKey(date)) continue;

      final model = date == overrideDate
          ? overrideModel
          : _readModel(box, date);
      if (model == null) continue;

      if (date == overrideDate) {
        hasOverrideDate = true;
      }
      total += model.checkedPrayerCount;
    }

    if (!hasOverrideDate &&
        overrideDate != null &&
        overrideModel != null &&
        _isDateKey(overrideDate)) {
      total += overrideModel.checkedPrayerCount;
    }

    return total;
  }

  bool _isDateKey(String key) {
    final parts = key.split('-');
    if (parts.length != 3) return false;
    return parts[0].length == 4 &&
        parts[1].length == 2 &&
        parts[2].length == 2 &&
        int.tryParse(parts[0]) != null &&
        int.tryParse(parts[1]) != null &&
        int.tryParse(parts[2]) != null;
  }
}
