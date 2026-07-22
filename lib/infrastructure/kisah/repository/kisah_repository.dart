import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/kisah/datasources/i_kisah_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/kisah/repository/i_kisah_repository.dart';

class KisahRepository implements IKisahRepository {
  KisahRepository(this._remote);

  final IKisahRemoteDatasource _remote;

  @override
  Future<Either<Failure, KisahResponse>> getKisahList() async {
    try {
      final response = await _remote.getKisahList();
      return Right(response);
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

  @override
  Future<Either<Failure, KisahData>> getKisahDetail(int id) async {
    try {
      final response = await _remote.getKisahDetail(id);
      return Right(response);
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
