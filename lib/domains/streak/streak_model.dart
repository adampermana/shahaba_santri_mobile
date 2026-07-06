class StreakModel {
  StreakModel({
    this.currentStreak = 0,
    this.lastCheckedDate,
    Map<String, bool>? checkedPrayers,
  }) : checkedPrayers = Map<String, bool>.from(
         checkedPrayers ?? const {},
       );

  factory StreakModel.empty() => StreakModel();

  factory StreakModel.fromHiveMap(Map<String, dynamic> map) => StreakModel(
    currentStreak: _parseInt(map['current_streak']),
    lastCheckedDate: _parseString(map['last_checked_date']),
    checkedPrayers: _parseCheckedPrayers(map['checked_prayers']),
  );

  int currentStreak;
  String? lastCheckedDate;
  Map<String, bool> checkedPrayers;

  Map<String, dynamic> toHiveMap() => {
    'current_streak': currentStreak,
    'last_checked_date': lastCheckedDate,
    'checked_prayers': checkedPrayers,
  };

  int get checkedPrayerCount =>
      checkedPrayers.values.where((isChecked) => isChecked).length;

  bool isPrayerChecked(String prayerName) =>
      checkedPrayers[prayerName] ?? false;

  static int _parseInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  static String? _parseString(Object? value) {
    final stringValue = value?.toString();
    if (stringValue == null || stringValue.isEmpty) return null;
    return stringValue;
  }

  static Map<String, bool> _parseCheckedPrayers(Object? value) {
    if (value is! Map) return {};

    final checkedPrayers = <String, bool>{};
    for (final entry in value.entries) {
      final prayerName = entry.key?.toString();
      if (prayerName == null || prayerName.isEmpty) continue;
      checkedPrayers[prayerName] = _parseBool(entry.value);
    }
    return checkedPrayers;
  }

  static bool _parseBool(Object? value) {
    if (value is bool) return value;
    if (value is num) return value == 1;
    if (value is String) return value.toLowerCase() == 'true';
    return false;
  }
}
