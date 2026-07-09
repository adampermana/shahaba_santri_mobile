import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';

abstract class LastReadState {}

class LastReadInitial extends LastReadState {}

class LastReadLoaded extends LastReadState {
  LastReadLoaded(this.lastRead);

  final QuranLastReadModel? lastRead;
}

class LastReadError extends LastReadState {
  LastReadError(this.message);

  final String message;
}
