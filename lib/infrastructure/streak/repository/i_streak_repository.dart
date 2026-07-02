import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/streak/streak_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class IStreakRepository {
  Future<Either<Failure, StreakModel>> getStreak(String date);
  Future<Either<Failure, Unit>> updateStreak(
    String date,
    String prayerName,
    bool checked,
  );
  Future<Either<Failure, Unit>> resetStreak();
}
