import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

// Keep a repository interface for GetIt registration consistency.
// ignore: one_member_abstracts
abstract class IQiblaRepository {
  Future<Either<Failure, double>> getQiblaDirection(
    double latitude,
    double longitude,
  );
}
