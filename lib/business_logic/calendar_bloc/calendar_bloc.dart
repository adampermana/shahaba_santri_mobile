import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';
import 'package:sahaba_mobile/infrastructure/calendar/repository/i_calendar_repository.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';
part 'calendar_bloc.freezed.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc(this._repository) : super(CalendarState.initial()) {
    on<_LoadHolidays>(_onLoadHolidays);
    on<_ChangeMonth>(_onChangeMonth);
    on<_SelectDate>(_onSelectDate);
  }

  final ICalendarRepository _repository;

  Future<void> _onLoadHolidays(
    _LoadHolidays event,
    Emitter<CalendarState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, errorMessage: ''));

    final year = DateTime.now().year;
    final result = await _repository.getHolidays(year);

    result.fold(
      (f) => emit(
        state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: f.message,
        ),
      ),
      (holidays) => emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorMessage: '',
          holidays: holidays,
        ),
      ),
    );
  }

  void _onChangeMonth(_ChangeMonth event, Emitter<CalendarState> emit) {
    final current = state.focusedMonth;
    final newMonth = DateTime(current.year, current.month + event.delta);
    if (newMonth.year != DateTime.now().year) return;

    final lastDayInNewMonth = DateTime(newMonth.year, newMonth.month + 1, 0);
    final selectedDay = state.selectedDate.day > lastDayInNewMonth.day
        ? lastDayInNewMonth.day
        : state.selectedDate.day;

    emit(
      state.copyWith(
        focusedMonth: newMonth,
        selectedDate: DateTime(newMonth.year, newMonth.month, selectedDay),
      ),
    );
  }

  void _onSelectDate(_SelectDate event, Emitter<CalendarState> emit) {
    emit(state.copyWith(selectedDate: event.date));
  }
}
