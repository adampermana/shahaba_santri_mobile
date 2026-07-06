import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_state.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/i_prayer_repository.dart';
import 'package:sahaba_mobile/presentation/screens/home/widgets/card_jadwal_sholat.dart';

class PrayerScheduleCubit extends Cubit<PrayerScheduleState> {
  PrayerScheduleCubit(this._repository) : super(PrayerScheduleInitial());

  final IPrayerRepository _repository;

  String? _currentCityId;
  DateTime? _currentDate;
  PrayerScheduleModel? _todaySchedule;
  String? _yearFetchedForCityId;

  Future<void> loadSchedule(
    String cityId,
    DateTime date, {
    bool showLoading = true,
  }) async {
    _currentCityId = cityId;
    _currentDate = date;

    final cachedResult = _repository.getCachedSchedule(cityId, date);
    final cached = cachedResult.fold(
      (_) => null,
      (schedule) => schedule,
    );

    if (cached != null) {
      final now = DateTime.now();
      if (_isSameDay(date, now)) {
        _todaySchedule = cached;
      }
      final active = _resolveActivePrayer(cached, now);
      final next = _resolveNextPrayer(cached, now);
      emit(
        PrayerScheduleLoaded(
          response: PrayerScheduleResponse(jadwal: cached),
          cityId: cityId,
          date: date,
          activePrayer: active,
          nextPrayer: next,
          todaySchedule: _todaySchedule,
        ),
      );
      _maybeFetchYear(cityId);
      return;
    }

    if (showLoading) {
      emit(PrayerScheduleLoading());
    }

    final result = await _repository.getPrayerSchedule(cityId, date);
    result.fold(
      (f) => emit(PrayerScheduleError(f.message)),
      (r) {
        final now = DateTime.now();
        if (_isSameDay(date, now)) {
          _todaySchedule = r.jadwal;
        }
        final active = _resolveActivePrayer(r.jadwal, now);
        final next = _resolveNextPrayer(r.jadwal, now);
        emit(
          PrayerScheduleLoaded(
            response: r,
            cityId: cityId,
            date: date,
            activePrayer: active,
            nextPrayer: next,
            todaySchedule: _todaySchedule,
          ),
        );
      },
    );
    _maybeFetchYear(cityId);
  }

  void _maybeFetchYear(String cityId) {
    if (_yearFetchedForCityId == cityId) return;
    _yearFetchedForCityId = cityId;
    unawaited(
      _repository.fetchAndSaveYearSchedule(cityId, DateTime.now().year),
    );
  }

  Future<void> nextDay() async {
    if (_currentCityId == null || _currentDate == null) return;
    final next = _currentDate!.add(const Duration(days: 1));
    await loadSchedule(_currentCityId!, next, showLoading: false);
  }

  Future<void> previousDay() async {
    if (_currentCityId == null || _currentDate == null) return;
    final prev = _currentDate!.subtract(const Duration(days: 1));
    await loadSchedule(_currentCityId!, prev, showLoading: false);
  }

  WaktuSholat? _resolveActivePrayer(
    PrayerScheduleModel? schedule,
    DateTime now,
  ) {
    if (schedule == null) return null;
    final selectedDate = _currentDate;
    if (selectedDate == null) return null;

    final isToday = _isSameDay(selectedDate, now);
    if (!isToday) return null;

    final todayPrayers = _getPrayerTimesForDate(schedule, now);
    for (var i = todayPrayers.length - 1; i >= 0; i--) {
      final entry = todayPrayers[i];
      if (now.isAfter(entry.value) || now.isAtSameMomentAs(entry.value)) {
        return entry.key;
      }
    }
    return null;
  }

  WaktuSholat? _resolveNextPrayer(
    PrayerScheduleModel? schedule,
    DateTime now,
  ) {
    if (schedule == null) return null;
    final selectedDate = _currentDate;
    if (selectedDate == null) return null;

    final isPast = _isPastDate(selectedDate, now);
    final isToday = _isSameDay(selectedDate, now);

    if (isPast || isToday) {
      final todayPrayers = _getPrayerTimesForDate(schedule, now);
      for (final entry in todayPrayers) {
        if (entry.value.isAfter(now)) {
          return entry.key;
        }
      }
      if (isPast) return WaktuSholat.isya;
      return WaktuSholat.subuh;
    }

    final todaySchedule = _todaySchedule;
    if (todaySchedule != null) {
      final todayPrayers = _getPrayerTimesForDate(todaySchedule, now);
      for (final entry in todayPrayers) {
        if (entry.value.isAfter(now)) {
          return entry.key;
        }
      }
    }
    return WaktuSholat.subuh;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  List<MapEntry<WaktuSholat, DateTime>> _getPrayerTimesForDate(
    PrayerScheduleModel schedule,
    DateTime date,
  ) {
    final entries = <MapEntry<WaktuSholat, DateTime>>[];
    final timeMap = {
      WaktuSholat.subuh: schedule.subuh,
      WaktuSholat.terbit: schedule.terbit,
      WaktuSholat.dzuhur: schedule.dzuhur,
      WaktuSholat.ashar: schedule.ashar,
      WaktuSholat.maghrib: schedule.maghrib,
      WaktuSholat.isya: schedule.isya,
    };
    for (final entry in timeMap.entries) {
      final time = entry.value;
      if (time != null) {
        final parts = time.split(':');
        if (parts.length == 2) {
          final hour = int.tryParse(parts[0].trim()) ?? 0;
          final minute = int.tryParse(parts[1].trim()) ?? 0;
          entries.add(
            MapEntry(
              entry.key,
              DateTime(date.year, date.month, date.day, hour, minute),
            ),
          );
        }
      }
    }
    return entries;
  }

  bool _isPastDate(DateTime selectedDate, DateTime now) {
    final selectedDay = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    final today = DateTime(now.year, now.month, now.day);
    return selectedDay.isBefore(today);
  }
}
