import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/streak/streak_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/streak/datasources/i_streak_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/streak/repository/i_streak_repository.dart';

class StreakRepository implements IStreakRepository {
  StreakRepository(this._local);

  final IStreakLocalDatasource _local;

  @override
  Future<Either<Failure, StreakModel>> getStreak(String date) async {
    try {
      final model = await _local.getStreak(date);
      return Right(model);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateStreak(
    String date,
    String prayerName,
    bool checked,
  ) async {
    try {
      await _local.updateStreak(date, prayerName, checked);
      return const Right(unit);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetStreak() async {
    try {
      await _local.saveStreakModel(StreakModel.empty());
      return const Right(unit);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
