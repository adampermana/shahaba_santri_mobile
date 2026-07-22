import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class IKisahRepository {
  Future<Either<Failure, KisahResponse>> getKisahList();
  Future<Either<Failure, KisahData>> getKisahDetail(int id);
}
