import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/i_calendar_local_datasource.dart';

class CalendarLocalDatasource implements ICalendarLocalDatasource {
  static const String calendarBox = 'calendar_holidays';
  static const String _holidaysKey = 'holidays_data';
  static const String _yearKey = 'holidays_year';

  @override
  Future<void> saveHolidays(
    int year,
    List<IslamicHolidayModel> holidays,
  ) async {
    final box = Hive.box<String>(calendarBox);
    final islamicHolidays = holidays.where((e) => e.isIslamicEvent);
    final jsonList = islamicHolidays.map((e) => e.toJson()).toList();
    await box.put(_holidaysKey, jsonEncode(jsonList));
    await box.put(_yearKey, year.toString());
  }

  @override
  List<IslamicHolidayModel>? getCachedHolidays(int year) {
    final box = Hive.box<String>(calendarBox);
    final cachedYear = box.get(_yearKey);
    if (cachedYear != year.toString()) return null;

    final raw = box.get(_holidaysKey);
    if (raw == null) return null;

    final jsonList = json.decode(raw) as List<dynamic>;
    return jsonList
        .map((e) => IslamicHolidayModel.fromJson(e as Map<String, dynamic>))
        .where((holiday) => holiday.isIslamicEvent)
        .toList();
  }

  @override
  int? getCachedYear() {
    final box = Hive.box<String>(calendarBox);
    final raw = box.get(_yearKey);
    if (raw == null) return null;
    return int.tryParse(raw);
  }
}
