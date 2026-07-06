import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';

abstract class ICalendarRemoteDatasource {
  Future<List<IslamicHolidayModel>> getHolidays(int year);
}
