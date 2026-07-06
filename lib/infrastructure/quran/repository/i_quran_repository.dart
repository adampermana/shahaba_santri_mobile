import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class IQuranRepository {
  Future<Either<Failure, List<SurahModel>>> getAllSurahs();
  Future<Either<Failure, List<JuzModel>>> getAllJuz();
}
