import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/streak/streak_state.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/streak/repository/i_streak_repository.dart';

class StreakCubit extends Cubit<StreakState> {
  StreakCubit(this._repository) : super(StreakInitial());

  final IStreakRepository _repository;

  Future<void> loadStreak(DateTime date) async {
    final dateKey = _dateKey(date);
    emit(StreakLoading());

    final result = await _repository.getStreak(dateKey);
    result.fold(
      (f) => emit(StreakError(f.message)),
      (r) => emit(
        StreakLoaded(
          currentStreak: r.currentStreak,
          checkedPrayers: Map<String, bool>.from(r.checkedPrayers),
          date: dateKey,
        ),
      ),
    );
  }

  Future<void> checkPrayer({
    required String prayerName,
    required DateTime now,
    required PrayerScheduleModel schedule,
  }) async {
    final currentState = state;
    if (currentState is! StreakLoaded) return;

    final window = _getPrayerWindow(
      prayerName: prayerName,
      now: now,
      schedule: schedule,
    );
    if (window == null) return;

    final isInWindow =
        now.isAfter(window.start) || now.isAtSameMomentAs(window.start);
    final isBeforeEnd = now.isBefore(window.end);

    if (!isInWindow || !isBeforeEnd) return;

    if (currentState.isPrayerChecked(prayerName)) return;

    final updated = Map<String, bool>.from(currentState.checkedPrayers);
    updated[prayerName] = true;

    emit(
      StreakLoaded(
        currentStreak: currentState.currentStreak,
        checkedPrayers: updated,
        date: currentState.date,
      ),
    );

    await _repository.updateStreak(currentState.date, prayerName, true);
  }

  _PrayerWindow? _getPrayerWindow({
    required String prayerName,
    required DateTime now,
    required PrayerScheduleModel schedule,
  }) {
    final date = DateTime(now.year, now.month, now.day);

    DateTime? parseTime(String? time) {
      if (time == null) return null;
      final parts = time.split(':');
      if (parts.length != 2) return null;
      final h = int.tryParse(parts[0].trim());
      final m = int.tryParse(parts[1].trim());
      if (h == null || m == null) return null;
      return DateTime(date.year, date.month, date.day, h, m);
    }

    final prayerTime = parseTime(schedule.getTimeByPrayerName(prayerName));
    if (prayerTime == null) return null;

    switch (prayerName.toLowerCase()) {
      case 'subuh':
        final terbit = parseTime(schedule.terbit);
        if (terbit == null) return null;
        return _PrayerWindow(start: prayerTime, end: terbit);
      case 'isya':
        final endOfDay = DateTime(date.year, date.month, date.day, 23, 59);
        return _PrayerWindow(start: prayerTime, end: endOfDay);
      case 'terbit':
        final dzuhur = parseTime(schedule.dzuhur);
        if (dzuhur == null) return null;
        return _PrayerWindow(start: prayerTime, end: dzuhur);
      case 'dzuhur':
        final ashar = parseTime(schedule.ashar);
        if (ashar == null) return null;
        return _PrayerWindow(start: prayerTime, end: ashar);
      case 'ashar':
        final maghrib = parseTime(schedule.maghrib);
        if (maghrib == null) return null;
        return _PrayerWindow(start: prayerTime, end: maghrib);
      case 'maghrib':
        final isya = parseTime(schedule.isya);
        if (isya == null) return null;
        return _PrayerWindow(start: prayerTime, end: isya);
      default:
        return null;
    }
  }

  String _dateKey(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

class _PrayerWindow {
  const _PrayerWindow({required this.start, required this.end});

  final DateTime start;
  final DateTime end;
}
