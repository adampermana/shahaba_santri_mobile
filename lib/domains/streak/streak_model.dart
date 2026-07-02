class StreakModel {
  StreakModel({
    this.currentStreak = 0,
    this.lastCheckedDate,
    this.checkedPrayers = const {},
  });

  factory StreakModel.empty() => StreakModel();

  factory StreakModel.fromHiveMap(Map<String, dynamic> map) => StreakModel(
        currentStreak: map['current_streak'] as int? ?? 0,
        lastCheckedDate: map['last_checked_date'] as String?,
        checkedPrayers: Map<String, bool>.from(
          map['checked_prayers'] as Map? ?? {},
        ),
      );

  int currentStreak;
  String? lastCheckedDate;
  Map<String, bool> checkedPrayers;

  Map<String, dynamic> toHiveMap() => {
        'current_streak': currentStreak,
        'last_checked_date': lastCheckedDate,
        'checked_prayers': checkedPrayers,
      };

  bool isPrayerChecked(String prayerName) =>
      checkedPrayers[prayerName] ?? false;
}
