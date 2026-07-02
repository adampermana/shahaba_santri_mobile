import 'package:sahaba_mobile/domains/streak/streak_model.dart';

abstract class IStreakLocalDatasource {
  Future<StreakModel> getStreak(String date);
  Future<void> updateStreak(String date, String prayerName, bool checked);
  Future<void> saveStreakModel(StreakModel model);
}
