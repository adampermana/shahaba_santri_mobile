import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';

abstract class QuranDetailState {}

class QuranDetailInitial extends QuranDetailState {}

class QuranDetailLoading extends QuranDetailState {}

class QuranDetailLoaded extends QuranDetailState {
  QuranDetailLoaded(this.detail);

  final QuranDetailModel detail;
}

class QuranDetailError extends QuranDetailState {
  QuranDetailError(this.message);

  final String message;
}
