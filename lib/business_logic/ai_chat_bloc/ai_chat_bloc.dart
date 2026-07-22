import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/infrastructure/ai_chat/repositories/i_ai_chat_repository.dart';

part 'ai_chat_event.dart';
part 'ai_chat_state.dart';
part 'ai_chat_bloc.freezed.dart';

@freezed
abstract class AiChatMessage with _$AiChatMessage {
  const factory AiChatMessage({
    required String content,
    required bool isUser,
  }) = _AiChatMessage;
}

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  AiChatBloc(this._repository) : super(AiChatState.initial()) {
    on<_PostAiChat>(_onPostAiChat);
    on<_ClearChat>(_onClearChat);
  }

  final IAiChatRepository _repository;

  Future<void> _onPostAiChat(
    _PostAiChat event,
    Emitter<AiChatState> emit,
  ) async {
    final message = event.message.trim();
    if (message.isEmpty) {
      return;
    }

    emit(
      state.copyWith(
        postAiChatLoading: true,
        postAiChatSuccess: false,
        postAiChatErrorMessage: '',
        messages: [
          ...state.messages,
          AiChatMessage(content: message, isUser: true),
        ],
      ),
    );

    final result = await _repository.postAiChat(message);

    result.fold(
      (f) => emit(
        state.copyWith(
          postAiChatLoading: false,
          postAiChatSuccess: false,
          postAiChatErrorMessage: f.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          postAiChatLoading: false,
          postAiChatSuccess: true,
          messages: [
            ...state.messages,
            AiChatMessage(
              content: r.answer ?? '',
              isUser: false,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClearChat(
    _ClearChat event,
    Emitter<AiChatState> emit,
  ) async {
    emit(AiChatState.initial());
  }
}
