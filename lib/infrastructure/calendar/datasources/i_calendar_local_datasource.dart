import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';

abstract class ICalendarLocalDatasource {
  Future<void> saveHolidays(int year, List<IslamicHolidayModel> holidays);
  List<IslamicHolidayModel>? getCachedHolidays(int year);
  int? getCachedYear();
}
