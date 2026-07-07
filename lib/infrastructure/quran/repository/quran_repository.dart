import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/i_quran_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/quran/repository/i_quran_repository.dart';

class QuranRepository implements IQuranRepository {
  QuranRepository(this._localDatasource);

  final IQuranLocalDatasource _localDatasource;

  @override
  Future<Either<Failure, List<SurahModel>>> getAllSurahs() async {
    try {
      final surahs = await _localDatasource.getAllSurahs();
      return Right(surahs);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<JuzModel>>> getAllJuz() async {
    try {
      final juzList = await _localDatasource.getAllJuz();
      return Right(juzList);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuranDetailModel>> getSurahDetail(
    SurahModel surah,
  ) async {
    try {
      final detail = await _localDatasource.getSurahDetail(surah);
      return Right(detail);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuranDetailModel>> getJuzDetail(JuzModel juz) async {
    try {
      final detail = await _localDatasource.getJuzDetail(juz);
      return Right(detail);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
