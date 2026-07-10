import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:sahaba_mobile/domains/streak/streak_model.dart';
import 'package:sahaba_mobile/infrastructure/streak/datasources/i_streak_local_datasource.dart';

class StreakLocalDatasource implements IStreakLocalDatasource {
  static const String streakBox = 'streak_data';
  static const _requiredPrayers = [
    'subuh',
    'dzuhur',
    'ashar',
    'maghrib',
    'isya',
  ];

  @override
  Future<StreakModel> getStreak(String date) async {
    final box = Hive.box<String>(streakBox);
    final model = _readModel(box, date) ?? StreakModel.empty();
    final currentStreak = _countConsecutiveCompleteDays(
      box,
      overrideDate: date,
      overrideModel: model,
    );
    final shouldBackfill =
        box.containsKey(date) &&
        (model.lastCheckedDate != date ||
            model.currentStreak != currentStreak);

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
    final currentStreak = _countConsecutiveCompleteDays(
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

  /// Hitung streak = jumlah hari consecutive (mundur dari hari terakhir)
  /// di mana SEMUA 5 sholat wajib sudah di-check.
  /// Berhenti mundur saat menemui hari yang belum lengkap.
  int _countConsecutiveCompleteDays(
    Box<String> box, {
    String? overrideDate,
    StreakModel? overrideModel,
  }) {
    var latestDate = overrideDate;
    for (final key in box.keys) {
      final k = key.toString();
      if (!_isDateKey(k)) continue;
      if (latestDate == null || k.compareTo(latestDate) > 0) {
        latestDate = k;
      }
    }
    if (latestDate == null) return 0;

    var streak = 0;
    String? date = latestDate;

    while (date != null) {
      final isOverride = date == overrideDate;
      final model = isOverride
          ? overrideModel
          : _readModel(box, date);

      if (model == null) break;
      if (!_isDayComplete(model)) break;
      streak++;
      date = _prevDateKey(date);
    }

    return streak;
  }

  bool _isDayComplete(StreakModel model) =>
      _requiredPrayers.every((p) => model.isPrayerChecked(p));

  String? _prevDateKey(String dateKey) {
    final parts = dateKey.split('-');
    if (parts.length != 3) return null;
    final d = DateTime.tryParse(dateKey);
    if (d == null) return null;
    final prev = d.subtract(const Duration(days: 1));
    final m = prev.month.toString().padLeft(2, '0');
    final day = prev.day.toString().padLeft(2, '0');
    return '${prev.year}-$m-$day';
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
