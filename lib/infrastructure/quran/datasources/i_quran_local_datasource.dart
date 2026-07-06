import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';

abstract class IQuranLocalDatasource {
  Future<List<SurahModel>> getAllSurahs();
  Future<List<JuzModel>> getAllJuz();
}
