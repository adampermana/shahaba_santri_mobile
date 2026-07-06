import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/i_quran_local_datasource.dart';

class QuranLocalDatasource implements IQuranLocalDatasource {
  @override
  Future<List<SurahModel>> getAllSurahs() async {
    final jsonStr = await rootBundle.loadString('assets/quran/surah.json');
    final jsonList = json.decode(jsonStr) as List<dynamic>;
    return jsonList
        .map((e) => SurahModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<JuzModel>> getAllJuz() async {
    final jsonStr = await rootBundle.loadString('assets/quran/juz.json');
    final jsonList = json.decode(jsonStr) as List<dynamic>;
    return jsonList
        .map((e) => JuzModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
