import 'dart:convert';
import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahaba_mobile/domains/prayer_schedule/prayer_schedule_model.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/i_prayer_local_datasource.dart';

class AdzanService {
  factory AdzanService.instance() => _instance;
  AdzanService._internal();

  static final AdzanService _instance = AdzanService._internal();

  static const String adzanPreferenceBox = 'adzan_preferences';
  static const String _assetAudioPath = 'assets/audio/adzan-default.mp3';
  static const String _payloadType = 'adzan';
  static const String _qiblaPath = '/main/qibla';
  static const MethodChannel _androidAlarmChannel = MethodChannel(
    'sahaba/adzan_alarm',
  );

  late Box<bool> _preferenceBox;
  late IPrayerLocalDatasource _local;
  bool _isInitialized = false;

  Future<void> init(IPrayerLocalDatasource local) async {
    if (_isInitialized) return;
    _local = local;
    _preferenceBox = Hive.box<bool>(adzanPreferenceBox);
    if (Platform.isAndroid) {
      await _requestNotificationPermission();
      await _requestScheduleExactAlarmPermission();
    }
    _isInitialized = true;
  }

  bool isAdzanEnabled(String prayerName) {
    _ensureInitialized();
    return _preferenceBox.get(_preferenceKey(prayerName), defaultValue: true) ??
        true;
  }

  Map<String, bool> getAdzanPreferences(Iterable<String> prayerNames) {
    _ensureInitialized();
    return {
      for (final prayerName in prayerNames)
        _normalizePrayerName(prayerName): isAdzanEnabled(prayerName),
    };
  }

  Future<bool> toggleAdzan({
    required String prayerName,
    required DateTime date,
    required String cityId,
    String? locationName,
  }) async {
    _ensureInitialized();
    final normalizedPrayerName = _normalizePrayerName(prayerName);
    final nextEnabled = !isAdzanEnabled(normalizedPrayerName);
    await _preferenceBox.put(
      _preferenceKey(normalizedPrayerName),
      nextEnabled,
    );

    if (!nextEnabled) {
      await cancelPrayer(normalizedPrayerName);
      return nextEnabled;
    }

    await schedulePrayer(
      prayerName: normalizedPrayerName,
      date: date,
      cityId: cityId,
      locationName: locationName,
    );
    return nextEnabled;
  }

  Future<void> syncSchedule({
    required DateTime date,
    required String cityId,
    String? locationName,
  }) async {
    _ensureInitialized();

    for (final prayerName in _adzanPrayerNames) {
      if (isAdzanEnabled(prayerName)) {
        await schedulePrayer(
          prayerName: prayerName,
          date: date,
          cityId: cityId,
          locationName: locationName,
        );
      } else {
        await cancelPrayer(prayerName);
      }
    }
  }

  Future<void> schedulePrayer({
    required String prayerName,
    required DateTime date,
    required String cityId,
    String? locationName,
  }) async {
    _ensureInitialized();

    final schedule = _local.getCachedSchedule(cityId, _dateKey(date));
    if (schedule == null) return;

    final normalizedPrayerName = _normalizePrayerName(prayerName);
    if (!_adzanPrayerNames.contains(normalizedPrayerName)) return;

    final prayerTime = _prayerDateTime(
      date: date,
      prayerName: normalizedPrayerName,
      schedule: schedule,
    );
    if (prayerTime == null) return;

    final alarmId = _alarmId(normalizedPrayerName, date);
    if (!prayerTime.isAfter(DateTime.now())) {
      await _cancelAlarmById(alarmId);
      return;
    }
    final prayerLabel = _label(normalizedPrayerName);
    final normalizedLocation = _locationLabel(locationName);
    final notificationTitle = 'Waktu $prayerLabel';
    final notificationBody = Platform.isAndroid
        ? 'Masuk waktu sholat $prayerLabel untuk $normalizedLocation.'
        : 'Masuk waktu sholat untuk $normalizedLocation.';

    if (Platform.isAndroid) {
      await _scheduleAndroidAlarm(
        alarmId: alarmId,
        prayerName: normalizedPrayerName,
        prayerLabel: prayerLabel,
        notificationTitle: notificationTitle,
        notificationBody: notificationBody,
        prayerTime: prayerTime,
        locationName: normalizedLocation,
        dateKey: _dateKey(date),
      );
      return;
    }

    await Alarm.set(
      alarmSettings: AlarmSettings(
        id: alarmId,
        dateTime: prayerTime,
        assetAudioPath: _assetAudioPath,
        loopAudio: false,
        warningNotificationOnKill: Platform.isIOS,
        androidStopAlarmOnTermination: false,
        volumeSettings: const VolumeSettings.fixed(
          volume: 0.4,
        ),
        notificationSettings: NotificationSettings(
          title: notificationTitle,
          body: notificationBody,
          stopButton: 'Hentikan',
          keepNotificationAfterAlarmEnds: true,
        ),
        payload: jsonEncode({
          'type': _payloadType,
          'prayer': normalizedPrayerName,
          'title': notificationTitle,
          'body': notificationBody,
          'date': _dateKey(date),
          'asset': _notificationAsset(normalizedPrayerName),
          'qiblaPath': _qiblaPath,
        }),
      ),
    );
  }

  Future<void> cancelPrayer(String prayerName) async {
    _ensureInitialized();
    final normalizedPrayerName = _normalizePrayerName(prayerName);
    if (Platform.isAndroid) {
      await _cancelAndroidPrayer(normalizedPrayerName);
      return;
    }

    final alarms = await Alarm.getAlarms();
    for (final alarm in alarms) {
      if (_isAdzanPrayerAlarm(alarm, normalizedPrayerName)) {
        await Alarm.stop(alarm.id);
      }
    }
  }

  Future<void> _cancelAlarmById(int alarmId) async {
    if (Platform.isAndroid) {
      await _cancelAndroidAlarm(alarmId);
      return;
    }

    await Alarm.stop(alarmId);
  }

  Future<void> _scheduleAndroidAlarm({
    required int alarmId,
    required String prayerName,
    required String prayerLabel,
    required String notificationTitle,
    required String notificationBody,
    required DateTime prayerTime,
    required String locationName,
    required String dateKey,
  }) async {
    try {
      await _androidAlarmChannel.invokeMethod<void>('scheduleAdzanAlarm', {
        'alarmId': alarmId,
        'prayerName': prayerName,
        'prayerLabel': prayerLabel,
        'title': notificationTitle,
        'body': notificationBody,
        'triggerAtMillis': prayerTime.millisecondsSinceEpoch,
        'locationName': locationName,
        'date': dateKey,
        'qiblaPath': _qiblaPath,
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to schedule native adzan alarm: $e');
    }
  }

  Future<void> _cancelAndroidPrayer(String prayerName) async {
    try {
      await _androidAlarmChannel.invokeMethod<void>('cancelAdzanPrayer', {
        'prayerName': prayerName,
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to cancel native adzan prayer: $e');
    }
  }

  Future<void> _cancelAndroidAlarm(int alarmId) async {
    try {
      await _androidAlarmChannel.invokeMethod<void>('cancelAdzanAlarm', {
        'alarmId': alarmId,
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to cancel native adzan alarm: $e');
    }
  }

  Future<void> _requestNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
    }
  }

  Future<void> _requestScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    if (status.isDenied) {
      await Permission.scheduleExactAlarm.request();
    }
  }

  bool _isAdzanPrayerAlarm(AlarmSettings alarm, String prayerName) {
    final payload = alarm.payload;
    if (payload == null) return false;
    try {
      final data = jsonDecode(payload);
      if (data is! Map<String, dynamic>) return false;
      return data['type'] == _payloadType && data['prayer'] == prayerName;
    } on FormatException catch (e) {
      debugPrint('Invalid adzan alarm payload: $e');
      return false;
    }
  }

  DateTime? _prayerDateTime({
    required DateTime date,
    required String prayerName,
    required PrayerScheduleModel schedule,
  }) {
    final time = schedule.getTimeByPrayerName(prayerName);
    if (time == null) return null;

    final parts = time.split(':');
    if (parts.length != 2) return null;

    final hour = int.tryParse(parts[0].trim());
    final minute = int.tryParse(parts[1].trim());
    if (hour == null || minute == null) return null;

    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  int _alarmId(String prayerName, DateTime date) {
    final prayerIndex = _adzanPrayerNames.indexOf(prayerName) + 1;
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return int.parse('${date.year}$month$day$prayerIndex');
  }

  String _dateKey(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  String _preferenceKey(String prayerName) =>
      'adzan_enabled_${_normalizePrayerName(prayerName)}';

  String _normalizePrayerName(String prayerName) =>
      prayerName.trim().toLowerCase();

  String _locationLabel(String? locationName) {
    final value = locationName?.trim();
    if (value == null || value.isEmpty) return 'Anda';
    return value;
  }

  String _label(String prayerName) {
    switch (prayerName) {
      case 'subuh':
        return 'Subuh';
      case 'dzuhur':
        return 'Dzuhur';
      case 'ashar':
        return 'Ashar';
      case 'maghrib':
        return 'Maghrib';
      case 'isya':
        return 'Isya';
      default:
        return prayerName;
    }
  }

  String _notificationAsset(String prayerName) {
    switch (prayerName) {
      case 'subuh':
        return 'assets/svg/notif/icon-transparant.svg';
      case 'dzuhur':
      case 'ashar':
        return 'assets/svg/notif/duzhur-ashar.svg';
      case 'maghrib':
        return 'assets/svg/notif/maghrib.svg';
      case 'isya':
        return 'assets/svg/notif/isya.svg';
      default:
        return 'assets/svg/notif/icon-transparant.svg';
    }
  }

  void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError('AdzanService must be initialized before use.');
    }
  }

  static const List<String> _adzanPrayerNames = [
    'subuh',
    'dzuhur',
    'ashar',
    'maghrib',
    'isya',
  ];
}
