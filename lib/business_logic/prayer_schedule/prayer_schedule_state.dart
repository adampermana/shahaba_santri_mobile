import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/presentation/screens/home/widgets/card_jadwal_sholat.dart';

abstract class PrayerScheduleState {}

class PrayerScheduleInitial extends PrayerScheduleState {}

class PrayerScheduleLoading extends PrayerScheduleState {}

class PrayerScheduleLoaded extends PrayerScheduleState {
  PrayerScheduleLoaded({
    required this.response,
    required this.date,
    this.activePrayer,
    this.nextPrayer,
  });

  final PrayerScheduleResponse response;
  final DateTime date;
  final WaktuSholat? activePrayer;
  final WaktuSholat? nextPrayer;
}

class PrayerScheduleError extends PrayerScheduleState {
  PrayerScheduleError(this.message);

  final String message;
}
