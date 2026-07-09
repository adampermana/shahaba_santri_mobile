import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class IQuranRepository {
  Future<Either<Failure, List<SurahModel>>> getAllSurahs();
  Future<Either<Failure, List<JuzModel>>> getAllJuz();
  Future<Either<Failure, QuranDetailModel>> getSurahDetail(SurahModel surah);
  Future<Either<Failure, QuranDetailModel>> getJuzDetail(JuzModel juz);
  Future<Either<Failure, void>> saveLastRead(QuranLastReadModel lastRead);
  Future<Either<Failure, QuranLastReadModel?>> getLastRead();
}
