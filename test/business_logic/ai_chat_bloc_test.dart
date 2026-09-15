import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/business_logic/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:sahaba_mobile/domains/ai_chat/ai_chat_response.dart';
import 'package:sahaba_mobile/infrastructure/ai_chat/repositories/i_ai_chat_repository.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

//  Mock

class MockAiChatRepository extends Mock implements IAiChatRepository {}

//  Fixture helpers

AiChatResponse _response({String answer = 'Baik, ini jawabannya.'}) =>
    AiChatResponse(answer: answer, model: 'gpt-4', tokensUsed: 100);

const _failure = ServerFailures(
  statusCode: 500,
  title: 'Server Error',
  message: 'Terjadi kesalahan server',
);

const _userMsg = 'Apa hukum sholat Jumat?';

//  Tests

void main() {
  late MockAiChatRepository repository;

  setUp(() {
    repository = MockAiChatRepository();
  });

  //  AiChatMessage model

  group('AiChatMessage', () {
    test('isUser=true for user message', () {
      const msg = AiChatMessage(content: 'Hello', isUser: true);
      expect(msg.isUser, isTrue);
      expect(msg.content, 'Hello');
    });

    test('isUser=false for bot message', () {
      const msg = AiChatMessage(content: 'Response', isUser: false);
      expect(msg.isUser, isFalse);
      expect(msg.content, 'Response');
    });

    test('Freezed equality: same values are equal', () {
      const a = AiChatMessage(content: 'Hello', isUser: true);
      const b = AiChatMessage(content: 'Hello', isUser: true);
      expect(a, equals(b));
    });

    test('Freezed equality: different content are NOT equal', () {
      const a = AiChatMessage(content: 'Hello', isUser: true);
      const b = AiChatMessage(content: 'World', isUser: true);
      expect(a, isNot(equals(b)));
    });

    test('copyWith returns new instance with changed fields', () {
      const original = AiChatMessage(content: 'Original', isUser: true);
      final modified = original.copyWith(content: 'Modified', isUser: false);
      expect(modified.content, 'Modified');
      expect(modified.isUser, isFalse);
      // original unchanged
      expect(original.content, 'Original');
    });
  });

  //  AiChatState.initial()

  group('AiChatState.initial()', () {
    test('all flags are false/empty', () {
      final state = AiChatState.initial();
      expect(state.postAiChatLoading, isFalse);
      expect(state.postAiChatSuccess, isFalse);
      expect(state.postAiChatErrorMessage, '');
      expect(state.messages, isEmpty);
    });
  });

  //  AiChatEvent.postAiChat – guard: empty message

  group('AiChatEvent.postAiChat — empty/whitespace guard', () {
    blocTest<AiChatBloc, AiChatState>(
      'emits nothing when message is empty string',
      build: () => AiChatBloc(repository),
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: '')),
      expect: () => <AiChatState>[],
    );

    blocTest<AiChatBloc, AiChatState>(
      'emits nothing when message is whitespace only',
      build: () => AiChatBloc(repository),
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: '   ')),
      expect: () => <AiChatState>[],
    );

    blocTest<AiChatBloc, AiChatState>(
      'does NOT call repository when message is empty',
      build: () => AiChatBloc(repository),
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: '')),
      verify: (_) {
        verifyNever(() => repository.postAiChat(any()));
      },
    );
  });

  //  AiChatEvent.postAiChat – success path

  group('AiChatEvent.postAiChat — success', () {
    blocTest<AiChatBloc, AiChatState>(
      'emits [loading+userMsg, success+botMsg] on success',
      build: () {
        when(
          () => repository.postAiChat(any()),
        ).thenAnswer((_) async => Right(_response()));
        return AiChatBloc(repository);
      },
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: _userMsg)),
      expect: () => [
        // 1. loading, user message appended
        isA<AiChatState>()
            .having((s) => s.postAiChatLoading, 'loading', isTrue)
            .having((s) => s.postAiChatSuccess, 'success', isFalse)
            .having((s) => s.postAiChatErrorMessage, 'errorMsg', '')
            .having((s) => s.messages, 'messages', hasLength(1))
            .having(
              (s) => s.messages.last.isUser,
              'last message isUser',
              isTrue,
            )
            .having(
              (s) => s.messages.last.content,
              'last message content',
              _userMsg,
            ),
        // 2. success, bot message appended
        isA<AiChatState>()
            .having((s) => s.postAiChatLoading, 'loading', isFalse)
            .having((s) => s.postAiChatSuccess, 'success', isTrue)
            .having((s) => s.messages, 'messages', hasLength(2))
            .having(
              (s) => s.messages.last.isUser,
              'bot message isUser',
              isFalse,
            )
            .having(
              (s) => s.messages.last.content,
              'bot message content',
              'Baik, ini jawabannya.',
            ),
      ],
    );

    blocTest<AiChatBloc, AiChatState>(
      'trims whitespace from message before sending',
      build: () {
        when(
          () => repository.postAiChat(any()),
        ).thenAnswer((_) async => Right(_response()));
        return AiChatBloc(repository);
      },
      act: (bloc) => bloc.add(
        const AiChatEvent.postAiChat(message: '  Apa hukum sholat Jumat?  '),
      ),
      verify: (bloc) {
        // repository called with trimmed message
        verify(
          () => repository.postAiChat('Apa hukum sholat Jumat?'),
        ).called(1);
        // user message stored trimmed
        expect(bloc.state.messages.first.content, 'Apa hukum sholat Jumat?');
      },
    );

    blocTest<AiChatBloc, AiChatState>(
      'bot answer uses empty string when response.answer is null',
      build: () {
        when(() => repository.postAiChat(any())).thenAnswer(
          (_) async => Right(AiChatResponse()),
        );
        return AiChatBloc(repository);
      },
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: _userMsg)),
      verify: (bloc) {
        expect(bloc.state.messages.last.content, '');
        expect(bloc.state.messages.last.isUser, isFalse);
      },
    );

    blocTest<AiChatBloc, AiChatState>(
      'messages accumulate correctly across multiple sends',
      build: () {
        when(
          () => repository.postAiChat(any()),
        ).thenAnswer((_) async => Right(_response(answer: 'Jawaban.')));
        return AiChatBloc(repository);
      },
      act: (bloc) async {
        bloc.add(const AiChatEvent.postAiChat(message: 'Pertanyaan 1'));
        await Future<void>.delayed(const Duration(milliseconds: 50));
        bloc.add(const AiChatEvent.postAiChat(message: 'Pertanyaan 2'));
      },
      verify: (bloc) {
        // 2 user + 2 bot = 4 messages total
        expect(bloc.state.messages, hasLength(4));
        expect(bloc.state.messages[0].isUser, isTrue);
        expect(bloc.state.messages[1].isUser, isFalse);
        expect(bloc.state.messages[2].isUser, isTrue);
        expect(bloc.state.messages[3].isUser, isFalse);
      },
    );

    blocTest<AiChatBloc, AiChatState>(
      'calls repository.postAiChat exactly once per event',
      build: () {
        when(
          () => repository.postAiChat(any()),
        ).thenAnswer((_) async => Right(_response()));
        return AiChatBloc(repository);
      },
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: _userMsg)),
      verify: (_) {
        verify(() => repository.postAiChat(_userMsg)).called(1);
      },
    );
  });

  //  AiChatEvent.postAiChat – failure path

  group('AiChatEvent.postAiChat — failure', () {
    blocTest<AiChatBloc, AiChatState>(
      'emits [loading+userMsg, error] on failure',
      build: () {
        when(
          () => repository.postAiChat(any()),
        ).thenAnswer((_) async => const Left(_failure));
        return AiChatBloc(repository);
      },
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: _userMsg)),
      expect: () => [
        // 1. loading
        isA<AiChatState>()
            .having((s) => s.postAiChatLoading, 'loading', isTrue)
            .having((s) => s.messages, 'messages', hasLength(1)),
        // 2. error — loading cleared, errorMessage set
        isA<AiChatState>()
            .having((s) => s.postAiChatLoading, 'loading', isFalse)
            .having((s) => s.postAiChatSuccess, 'success', isFalse)
            .having(
              (s) => s.postAiChatErrorMessage,
              'errorMessage',
              'Terjadi kesalahan server',
            ),
      ],
    );

    blocTest<AiChatBloc, AiChatState>(
      'user message is retained in messages list after failure',
      build: () {
        when(
          () => repository.postAiChat(any()),
        ).thenAnswer((_) async => const Left(_failure));
        return AiChatBloc(repository);
      },
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: _userMsg)),
      verify: (bloc) {
        // user message stays — no bot message added
        expect(bloc.state.messages, hasLength(1));
        expect(bloc.state.messages.first.isUser, isTrue);
      },
    );

    blocTest<AiChatBloc, AiChatState>(
      'error is cleared on next successful send',
      build: () {
        var callCount = 0;
        when(() => repository.postAiChat(any())).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) return const Left(_failure);
          return Right(_response());
        });
        return AiChatBloc(repository);
      },
      act: (bloc) async {
        bloc.add(const AiChatEvent.postAiChat(message: 'Q1'));
        await Future<void>.delayed(const Duration(milliseconds: 50));
        bloc.add(const AiChatEvent.postAiChat(message: 'Q2'));
      },
      verify: (bloc) {
        expect(bloc.state.postAiChatSuccess, isTrue);
        expect(bloc.state.postAiChatErrorMessage, '');
      },
    );
  });

  //  AiChatEvent.clearChat

  group('AiChatEvent.clearChat', () {
    blocTest<AiChatBloc, AiChatState>(
      'emits initial state when clearChat called',
      build: () => AiChatBloc(repository),
      act: (bloc) => bloc.add(const AiChatEvent.clearChat()),
      expect: () => [AiChatState.initial()],
    );

    blocTest<AiChatBloc, AiChatState>(
      'clears all messages and resets all flags',
      build: () {
        when(
          () => repository.postAiChat(any()),
        ).thenAnswer((_) async => Right(_response()));
        return AiChatBloc(repository);
      },
      seed: () => const AiChatState(
        postAiChatLoading: false,
        postAiChatSuccess: true,
        postAiChatErrorMessage: '',
        messages: [
          AiChatMessage(content: 'User msg', isUser: true),
          AiChatMessage(content: 'Bot msg', isUser: false),
        ],
      ),
      act: (bloc) => bloc.add(const AiChatEvent.clearChat()),
      expect: () => [AiChatState.initial()],
    );

    blocTest<AiChatBloc, AiChatState>(
      'clearChat after error resets errorMessage to empty',
      build: () => AiChatBloc(repository),
      seed: () => const AiChatState(
        postAiChatLoading: false,
        postAiChatSuccess: false,
        postAiChatErrorMessage: 'Terjadi kesalahan server',
        messages: [],
      ),
      act: (bloc) => bloc.add(const AiChatEvent.clearChat()),
      verify: (bloc) {
        expect(bloc.state.postAiChatErrorMessage, '');
        expect(bloc.state.postAiChatLoading, isFalse);
        expect(bloc.state.postAiChatSuccess, isFalse);
      },
    );

    blocTest<AiChatBloc, AiChatState>(
      'can send messages again after clearChat',
      build: () {
        when(
          () => repository.postAiChat(any()),
        ).thenAnswer((_) async => Right(_response()));
        return AiChatBloc(repository);
      },
      act: (bloc) async {
        // 1. Post
        bloc.add(const AiChatEvent.postAiChat(message: _userMsg));
        await Future<void>.delayed(const Duration(milliseconds: 50));
        // 2. Clear
        bloc.add(const AiChatEvent.clearChat());
        await Future<void>.delayed(const Duration(milliseconds: 10));
        // 3. Post again
        bloc.add(const AiChatEvent.postAiChat(message: 'Pertanyaan baru'));
        await Future<void>.delayed(const Duration(milliseconds: 50));
      },
      verify: (bloc) {
        // After the second post, messages contain only the new conversation
        expect(bloc.state.messages.first.content, 'Pertanyaan baru');
        expect(bloc.state.messages.first.isUser, isTrue);
      },
    );
  });

  //  AiChatState – Freezed copyWith

  group('AiChatState copyWith', () {
    test('copyWith updates specific fields without touching others', () {
      final state = AiChatState.initial();
      final updated = state.copyWith(postAiChatLoading: true);
      expect(updated.postAiChatLoading, isTrue);
      expect(updated.postAiChatSuccess, isFalse);
      expect(updated.messages, isEmpty);
      expect(updated.postAiChatErrorMessage, '');
    });

    test('Freezed equality: two initial states are equal', () {
      expect(AiChatState.initial(), equals(AiChatState.initial()));
    });
  });
}
