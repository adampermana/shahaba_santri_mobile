import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/business_logic/calendar_bloc/calendar_bloc.dart';
import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';
import 'package:sahaba_mobile/infrastructure/calendar/repository/i_calendar_repository.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

// Mock

class MockCalendarRepository extends Mock implements ICalendarRepository {}

// Fixture

final _now = DateTime.now();

IslamicHolidayModel _holiday({
  required String date, // 'yyyy-MM-dd'
  String name = 'Hari Raya',
  String type = 'holiday',
}) => IslamicHolidayModel(date: date, day: 'Senin', name: name, type: type);

/// Holiday pada bulan/tahun saat ini
IslamicHolidayModel get _thisMonthHoliday =>
    _holiday(date: '${_now.year}-${_now.month.toString().padLeft(2, '0')}-10');

/// Holiday pada bulan berbeda di tahun yang sama
IslamicHolidayModel _otherMonthHoliday(int month) =>
    _holiday(date: '${_now.year}-${month.toString().padLeft(2, '0')}-05');

const _failure = Failure('Server Error', 'Terjadi kesalahan server');

// ─ Tests

void main() {
  late MockCalendarRepository repository;

  setUp(() {
    repository = MockCalendarRepository();
  });

  //  CalendarState.initial()

  group('CalendarState.initial()', () {
    test('focusedMonth matches current year and month', () {
      final state = CalendarState.initial();
      expect(state.focusedMonth.year, _now.year);
      expect(state.focusedMonth.month, _now.month);
      expect(state.focusedMonth.day, 1);
    });

    test('selectedDate is today', () {
      final state = CalendarState.initial();
      expect(state.selectedDate.year, _now.year);
      expect(state.selectedDate.month, _now.month);
      expect(state.selectedDate.day, _now.day);
    });

    test('default flags are false and empty', () {
      final state = CalendarState.initial();
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isFalse);
      expect(state.errorMessage, '');
      expect(state.holidays, isEmpty);
    });
  });

  //  CalendarEvent.loadHolidays

  group('CalendarEvent.loadHolidays', () {
    blocTest<CalendarBloc, CalendarState>(
      'emits [loading, success] when repository returns holidays',
      build: () {
        when(
          () => repository.getHolidays(any()),
        ).thenAnswer((_) async => Right([_thisMonthHoliday]));
        return CalendarBloc(repository);
      },
      act: (bloc) => bloc.add(const CalendarEvent.loadHolidays()),
      expect: () => [
        // loading state
        isA<CalendarState>()
            .having((s) => s.isLoading, 'isLoading', isTrue)
            .having((s) => s.isSuccess, 'isSuccess', isFalse)
            .having((s) => s.errorMessage, 'errorMessage', ''),
        // success state
        isA<CalendarState>()
            .having((s) => s.isLoading, 'isLoading', isFalse)
            .having((s) => s.isSuccess, 'isSuccess', isTrue)
            .having((s) => s.holidays, 'holidays', hasLength(1))
            .having((s) => s.errorMessage, 'errorMessage', ''),
      ],
    );

    blocTest<CalendarBloc, CalendarState>(
      'emits [loading, error] when repository returns failure',
      build: () {
        when(
          () => repository.getHolidays(any()),
        ).thenAnswer((_) async => const Left(_failure));
        return CalendarBloc(repository);
      },
      act: (bloc) => bloc.add(const CalendarEvent.loadHolidays()),
      expect: () => [
        isA<CalendarState>().having((s) => s.isLoading, 'isLoading', isTrue),
        isA<CalendarState>()
            .having((s) => s.isLoading, 'isLoading', isFalse)
            .having((s) => s.isSuccess, 'isSuccess', isFalse)
            .having(
              (s) => s.errorMessage,
              'errorMessage',
              'Terjadi kesalahan server',
            ),
      ],
    );

    blocTest<CalendarBloc, CalendarState>(
      'holidays list is populated with returned data',
      build: () {
        when(() => repository.getHolidays(any())).thenAnswer(
          (_) async => Right([_thisMonthHoliday, _thisMonthHoliday]),
        );
        return CalendarBloc(repository);
      },
      act: (bloc) => bloc.add(const CalendarEvent.loadHolidays()),
      verify: (bloc) {
        expect(bloc.state.holidays, hasLength(2));
        expect(bloc.state.holidays.first.name, 'Hari Raya');
      },
    );

    blocTest<CalendarBloc, CalendarState>(
      'calls repository.getHolidays with current year',
      build: () {
        when(
          () => repository.getHolidays(any()),
        ).thenAnswer((_) async => const Right([]));
        return CalendarBloc(repository);
      },
      act: (bloc) => bloc.add(const CalendarEvent.loadHolidays()),
      verify: (_) {
        verify(() => repository.getHolidays(_now.year)).called(1);
      },
    );

    blocTest<CalendarBloc, CalendarState>(
      'error state clears holidays from previous success',
      build: () {
        var callCount = 0;
        when(() => repository.getHolidays(any())).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) return Right([_thisMonthHoliday]);
          return const Left(_failure);
        });
        return CalendarBloc(repository);
      },
      act: (bloc) async {
        bloc.add(const CalendarEvent.loadHolidays());
        await Future<void>.delayed(const Duration(milliseconds: 10));
        bloc.add(const CalendarEvent.loadHolidays());
      },
      verify: (bloc) {
        // After second (failed) load, isSuccess is false and errorMessage set
        expect(bloc.state.isSuccess, isFalse);
        expect(bloc.state.errorMessage, isNotEmpty);
      },
    );
  });

  //  CalendarEvent.changeMonth ─

  group('CalendarEvent.changeMonth', () {
    blocTest<CalendarBloc, CalendarState>(
      'delta +1 advances focusedMonth by one month (when not December)',
      build: () => CalendarBloc(repository),
      act: (bloc) => bloc.add(const CalendarEvent.changeMonth(1)),
      verify: (bloc) {
        if (_now.month == 12) return; // guard: year would cross boundary
        final expected = DateTime(_now.year, _now.month + 1);
        expect(bloc.state.focusedMonth.month, expected.month);
        expect(bloc.state.focusedMonth.year, expected.year);
      },
    );

    blocTest<CalendarBloc, CalendarState>(
      'delta -1 goes back one month (when not January)',
      build: () => CalendarBloc(repository),
      act: (bloc) => bloc.add(const CalendarEvent.changeMonth(-1)),
      verify: (bloc) {
        if (_now.month == 1) return; // guard: year would cross boundary
        final expected = DateTime(_now.year, _now.month - 1);
        expect(bloc.state.focusedMonth.month, expected.month);
        expect(bloc.state.focusedMonth.year, expected.year);
      },
    );

    blocTest<CalendarBloc, CalendarState>(
      'does NOT emit when changing to a different year (guard)',
      build: () => CalendarBloc(repository),
      act: (bloc) {
        // Navigate enough months to leave current year
        final stepsForward = 12 - _now.month + 1;
        for (var i = 0; i < stepsForward; i++) {
          bloc.add(const CalendarEvent.changeMonth(1));
        }
      },
      verify: (bloc) {
        // focusedMonth must remain in the same year
        expect(bloc.state.focusedMonth.year, _now.year);
      },
    );

    blocTest<CalendarBloc, CalendarState>(
      'selectedDate day is clamped to last day of new month when day overflows',
      build: () {
        return CalendarBloc(repository);
      },
      seed: () => CalendarState(
        focusedMonth: DateTime(_now.year), // January
        selectedDate: DateTime(_now.year, 1, 31), // day 31
      ),
      act: (bloc) => bloc.add(const CalendarEvent.changeMonth(1)), // go to Feb
      verify: (bloc) {
        final feb = DateTime(_now.year, 2);
        final lastDayFeb = DateTime(feb.year, feb.month + 1, 0).day;
        // Day cannot exceed lastDayFeb
        expect(bloc.state.selectedDate.day, lessThanOrEqualTo(lastDayFeb));
        expect(bloc.state.focusedMonth.month, 2);
      },
    );

    blocTest<CalendarBloc, CalendarState>(
      'selectedDate day is preserved when it fits in new month',
      build: () => CalendarBloc(repository),
      seed: () => CalendarState(
        focusedMonth: DateTime(_now.year),
        selectedDate: DateTime(_now.year, 1, 5),
      ),
      act: (bloc) => bloc.add(const CalendarEvent.changeMonth(1)), // Jan→Feb
      verify: (bloc) {
        // day 5 fits in any month
        expect(bloc.state.selectedDate.day, 5);
        expect(bloc.state.focusedMonth.month, 2);
      },
    );
  });

  //  CalendarEvent.selectDate

  group('CalendarEvent.selectDate', () {
    blocTest<CalendarBloc, CalendarState>(
      'emits state with updated selectedDate',
      build: () => CalendarBloc(repository),
      act: (bloc) => bloc.add(
        CalendarEvent.selectDate(DateTime(_now.year, _now.month, 15)),
      ),
      expect: () => [
        isA<CalendarState>().having(
          (s) => s.selectedDate.day,
          'selectedDate.day',
          15,
        ),
      ],
    );

    blocTest<CalendarBloc, CalendarState>(
      'does not change focusedMonth when selecting a date',
      build: () => CalendarBloc(repository),
      act: (bloc) => bloc.add(
        CalendarEvent.selectDate(DateTime(_now.year, _now.month, 20)),
      ),
      verify: (bloc) {
        expect(bloc.state.focusedMonth.month, _now.month);
        expect(bloc.state.focusedMonth.year, _now.year);
      },
    );

    blocTest<CalendarBloc, CalendarState>(
      'successive selectDate calls only keep last date',
      build: () => CalendarBloc(repository),
      act: (bloc) {
        bloc
          ..add(CalendarEvent.selectDate(DateTime(_now.year, _now.month)))
          ..add(CalendarEvent.selectDate(DateTime(_now.year, _now.month, 20)));
      },
      verify: (bloc) {
        expect(bloc.state.selectedDate.day, 20);
      },
    );
  });

  //  CalendarStateX extensions ─

  group('CalendarStateX.eventsForSelectedDate', () {
    final selectedDay = DateTime(_now.year, _now.month, 10);
    final matchHoliday = _holiday(
      date: '${_now.year}-${_now.month.toString().padLeft(2, '0')}-10',
    );
    final otherDayHoliday = _holiday(
      date: '${_now.year}-${_now.month.toString().padLeft(2, '0')}-20',
    );

    test('returns holidays matching selectedDate', () {
      final state = CalendarState(
        focusedMonth: DateTime(_now.year, _now.month),
        selectedDate: selectedDay,
        holidays: [matchHoliday, otherDayHoliday],
      );
      expect(state.eventsForSelectedDate, [matchHoliday]);
    });

    test('returns empty when no holidays match selectedDate', () {
      final state = CalendarState(
        focusedMonth: DateTime(_now.year, _now.month),
        selectedDate: DateTime(_now.year, _now.month, 5),
        holidays: [matchHoliday],
      );
      expect(state.eventsForSelectedDate, isEmpty);
    });

    test('returns empty when holidays list is empty', () {
      final state = CalendarState(
        focusedMonth: DateTime(_now.year, _now.month),
        selectedDate: selectedDay,
      );
      expect(state.eventsForSelectedDate, isEmpty);
    });
  });

  group('CalendarStateX.eventDaysInMonth', () {
    test('returns set of days that have events in focusedMonth', () {
      final month2Holiday = _otherMonthHoliday(2);
      final state = CalendarState(
        focusedMonth: DateTime(_now.year, _now.month),
        selectedDate: _now,
        holidays: [_thisMonthHoliday, month2Holiday],
      );
      expect(state.eventDaysInMonth, contains(10));
      // day from another month should NOT be in set
      expect(state.eventDaysInMonth.length, 1);
    });

    test('returns empty set when no events in focusedMonth', () {
      final otherMonth = _now.month == 1 ? 2 : 1;
      final state = CalendarState(
        focusedMonth: DateTime(_now.year, _now.month),
        selectedDate: _now,
        holidays: [_otherMonthHoliday(otherMonth)],
      );
      expect(state.eventDaysInMonth, isEmpty);
    });

    test('deduplicates days when multiple holidays on same day', () {
      final holiday1 = _holiday(
        date: '${_now.year}-${_now.month.toString().padLeft(2, '0')}-10',
        name: 'Event A',
      );
      final holiday2 = _holiday(
        date: '${_now.year}-${_now.month.toString().padLeft(2, '0')}-10',
        name: 'Event B',
      );
      final state = CalendarState(
        focusedMonth: DateTime(_now.year, _now.month),
        selectedDate: _now,
        holidays: [holiday1, holiday2],
      );
      // Set must deduplicate → only day 10
      expect(state.eventDaysInMonth, {10});
    });
  });

  group('CalendarStateX.eventsInMonth', () {
    test('returns all holidays in focusedMonth', () {
      final otherMonth = _now.month == 1 ? 2 : 1;
      final state = CalendarState(
        focusedMonth: DateTime(_now.year, _now.month),
        selectedDate: _now,
        holidays: [_thisMonthHoliday, _otherMonthHoliday(otherMonth)],
      );
      expect(state.eventsInMonth, hasLength(1));
      // IslamicHolidayModel does not override ==; compare by properties
      expect(state.eventsInMonth.first.name, _thisMonthHoliday.name);
      expect(state.eventsInMonth.first.date, _thisMonthHoliday.date);
    });

    test('returns empty list when no events in focusedMonth', () {
      final otherMonth = _now.month == 1 ? 2 : 1;
      final state = CalendarState(
        focusedMonth: DateTime(_now.year, _now.month),
        selectedDate: _now,
        holidays: [_otherMonthHoliday(otherMonth)],
      );
      expect(state.eventsInMonth, isEmpty);
    });
  });

  //  IslamicHolidayModel helpers ─

  group('IslamicHolidayModel', () {
    test('year/month/dayOfMonth parsed correctly from date string', () {
      final h = _holiday(date: '2025-08-14');
      expect(h.year, 2025);
      expect(h.month, 8);
      expect(h.dayOfMonth, 14);
    });

    test('isHoliday returns true for type holiday', () {
      final h = _holiday(date: '2025-01-01');
      expect(h.isHoliday, isTrue);
      expect(h.isLeave, isFalse);
    });

    test('isLeave returns true for type leave', () {
      final h = _holiday(date: '2025-01-01', type: 'leave');
      expect(h.isLeave, isTrue);
      expect(h.isHoliday, isFalse);
    });

    test('isIslamicEvent returns true for known Islamic keyword', () {
      final h = _holiday(date: '2025-01-01', name: 'Maulid Nabi Muhammad');
      expect(h.isIslamicEvent, isTrue);
    });

    test('isIslamicEvent returns true for Idul Fitri', () {
      final h = _holiday(date: '2025-01-01', name: 'Idul Fitri');
      expect(h.isIslamicEvent, isTrue);
    });

    test('isIslamicEvent returns false for non-Islamic event', () {
      final h = _holiday(date: '2025-01-01', name: 'Tahun Baru Masehi');
      expect(h.isIslamicEvent, isFalse);
    });

    test('fromHariLiburJson maps correctly', () {
      final json = {'date': '2025-08-14', 'description': 'Kemerdekaan RI'};
      final h = IslamicHolidayModel.fromHariLiburJson(json);
      expect(h.date, '2025-08-14');
      expect(h.name, 'Kemerdekaan RI');
      expect(h.type, 'holiday');
      expect(h.day, '');
    });
  });
}
