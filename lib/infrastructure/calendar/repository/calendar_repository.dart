import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/i_calendar_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/i_calendar_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/calendar/repository/i_calendar_repository.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

class CalendarRepository implements ICalendarRepository {
  CalendarRepository(this._remote, this._local);

  final ICalendarRemoteDatasource _remote;
  final ICalendarLocalDatasource _local;

  @override
  Future<Either<Failure, List<IslamicHolidayModel>>> getHolidays(
    int year,
  ) async {
    // Check if cached data is for the requested year
    final cached = _local.getCachedHolidays(year);
    if (cached != null) {
      return Right(cached);
    }

    try {
      final holidays = await _remote.getHolidays(year);
      await _local.saveHolidays(year, holidays);
      return Right(holidays);
    } on ServerException catch (e) {
      return Left(
        ServerFailures(
          statusCode: e.statusCode,
          title: e.title,
          message: e.message,
        ),
      );
    }
  }
}
