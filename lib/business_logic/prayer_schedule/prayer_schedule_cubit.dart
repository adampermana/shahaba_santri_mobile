import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule/prayer_schedule_state.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/i_prayer_repository.dart';
import 'package:sahaba_mobile/presentation/screens/home/widgets/card_jadwal_sholat.dart';

class PrayerScheduleCubit extends Cubit<PrayerScheduleState> {
  PrayerScheduleCubit(this._repository) : super(PrayerScheduleInitial());

  final IPrayerRepository _repository;

  String? _currentCityId;
  DateTime? _currentDate;

  Future<void> loadSchedule(String cityId, DateTime date) async {
    _currentCityId = cityId;
    _currentDate = date;
    emit(PrayerScheduleLoading());

    final result = await _repository.getPrayerSchedule(cityId, date);
    result.fold(
      (f) => emit(PrayerScheduleError(f.message)),
      (r) {
        final now = DateTime.now();
        final active = _resolveActivePrayer(r.jadwal, now);
        final next = _resolveNextPrayer(r.jadwal, now);
        emit(
          PrayerScheduleLoaded(
            response: r,
            date: date,
            activePrayer: active,
            nextPrayer: next,
          ),
        );
      },
    );
  }

  Future<void> nextDay() async {
    if (_currentCityId == null || _currentDate == null) return;
    final next = _currentDate!.add(const Duration(days: 1));
    await loadSchedule(_currentCityId!, next);
  }

  Future<void> previousDay() async {
    if (_currentCityId == null || _currentDate == null) return;
    final prev = _currentDate!.subtract(const Duration(days: 1));
    await loadSchedule(_currentCityId!, prev);
  }

  WaktuSholat? _resolveActivePrayer(
    PrayerScheduleModel? schedule,
    DateTime now,
  ) {
    if (schedule == null) return null;

    final prayers = _getPrayerTimes(schedule);
    for (var i = prayers.length - 1; i >= 0; i--) {
      final entry = prayers[i];
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

    final prayers = _getPrayerTimes(schedule);
    for (final entry in prayers) {
      if (entry.value.isAfter(now)) {
        return entry.key;
      }
    }
    return WaktuSholat.subuh;
  }

  List<MapEntry<WaktuSholat, DateTime>> _getPrayerTimes(
    PrayerScheduleModel schedule,
  ) {
    final date = _currentDate ?? DateTime.now();
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
}
