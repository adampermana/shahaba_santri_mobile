part of 'ai_chat_bloc.dart';

@freezed
abstract class AiChatState with _$AiChatState {
  const factory AiChatState({
    required bool postAiChatLoading,
    required bool postAiChatSuccess,
    required String postAiChatErrorMessage,
    required List<AiChatMessage> messages,
  }) = _AiChatState;

  factory AiChatState.initial() => const AiChatState(
    postAiChatLoading: false,
    postAiChatSuccess: false,
    postAiChatErrorMessage: '',
    messages: [],
  );
}
