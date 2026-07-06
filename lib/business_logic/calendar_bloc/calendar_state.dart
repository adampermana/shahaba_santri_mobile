part of 'calendar_bloc.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    required DateTime focusedMonth,
    required DateTime selectedDate,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default(<IslamicHolidayModel>[]) List<IslamicHolidayModel> holidays,
  }) = _CalendarState;

  factory CalendarState.initial() => CalendarState(
    focusedMonth: DateTime(DateTime.now().year, DateTime.now().month),
    selectedDate: DateTime.now(),
  );
}

extension CalendarStateX on CalendarState {
  List<IslamicHolidayModel> get eventsForSelectedDate {
    return holidays.where((h) {
      return h.year == selectedDate.year &&
          h.month == selectedDate.month &&
          h.dayOfMonth == selectedDate.day;
    }).toList();
  }

  Set<int> get eventDaysInMonth {
    return holidays
        .where(
          (h) => h.year == focusedMonth.year && h.month == focusedMonth.month,
        )
        .map((h) => h.dayOfMonth)
        .toSet();
  }

  List<IslamicHolidayModel> get eventsInMonth {
    return holidays
        .where(
          (h) => h.year == focusedMonth.year && h.month == focusedMonth.month,
        )
        .toList();
  }
}
