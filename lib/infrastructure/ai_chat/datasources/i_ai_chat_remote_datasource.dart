import 'package:dio/dio.dart';
import 'package:sahaba_mobile/domains/ai_chat/ai_chat_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';

part 'ai_chat_remote_datasource.dart';

abstract class IAiChatRemoteDatasource {
  Future<AiChatResponse> postAiChat({required String message});
}
