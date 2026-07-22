part of 'ai_chat_bloc.dart';

@freezed
abstract class AiChatEvent with _$AiChatEvent {
  const factory AiChatEvent.postAiChat({required String message}) = _PostAiChat;
  const factory AiChatEvent.clearChat() = _ClearChat;
}
