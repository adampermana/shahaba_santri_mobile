import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class ICalendarRepository {
  Future<Either<Failure, List<IslamicHolidayModel>>> getHolidays(int year);
}
