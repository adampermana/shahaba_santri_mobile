import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';

abstract class QuranDetailState {}

class QuranDetailInitial extends QuranDetailState {}

class QuranDetailLoading extends QuranDetailState {
  QuranDetailLoading({this.args});

  final QuranDetailArgs? args;
}

class QuranDetailLoaded extends QuranDetailState {
  QuranDetailLoaded(this.detail, {this.args});

  final QuranDetailModel detail;
  final QuranDetailArgs? args;
}

class QuranDetailError extends QuranDetailState {
  QuranDetailError(this.message, {this.args});

  final String message;
  final QuranDetailArgs? args;
}
