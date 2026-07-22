import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/ai_chat/ai_chat_response.dart';
import 'package:sahaba_mobile/infrastructure/ai_chat/datasources/i_ai_chat_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

part 'ai_chat_repository.dart';

abstract class IAiChatRepository {
  Future<Either<ServerFailures, AiChatResponse>> postAiChat(String message);
}
