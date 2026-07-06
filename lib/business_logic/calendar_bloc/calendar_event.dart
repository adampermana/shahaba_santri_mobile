part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.loadHolidays() = _LoadHolidays;
  const factory CalendarEvent.changeMonth(int delta) = _ChangeMonth;
  const factory CalendarEvent.selectDate(DateTime date) = _SelectDate;
}
