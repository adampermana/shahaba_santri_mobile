abstract class StreakState {}

class StreakInitial extends StreakState {}

class StreakLoading extends StreakState {}

class StreakLoaded extends StreakState {
  StreakLoaded({
    required this.currentStreak,
    required this.checkedPrayers,
    required this.date,
  });

  final int currentStreak;
  final Map<String, bool> checkedPrayers;
  final String date;

  bool isPrayerChecked(String name) => checkedPrayers[name] ?? false;
}

class StreakError extends StreakState {
  StreakError(this.message);

  final String message;
}
