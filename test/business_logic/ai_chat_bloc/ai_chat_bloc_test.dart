import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/business_logic/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:sahaba_mobile/domains/ai_chat/ai_chat_response.dart';
import 'package:sahaba_mobile/infrastructure/ai_chat/repositories/i_ai_chat_repository.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

class MockAiChatRepository extends Mock implements IAiChatRepository {}

void main() {
  late AiChatBloc bloc;
  late MockAiChatRepository mockRepository;

  setUp(() {
    mockRepository = MockAiChatRepository();
    bloc = AiChatBloc(mockRepository);
  });

  group('AiChatBloc', () {
    const tMessage = 'Halo';
    final tResponse = AiChatResponse(answer: 'Halo juga');

    test('initial state should be AiChatState.initial()', () {
      expect(bloc.state, AiChatState.initial());
    });

    blocTest<AiChatBloc, AiChatState>(
      'should emit [Loading, Success] when postAiChat is successful',
      build: () {
        when(() => mockRepository.postAiChat(tMessage))
            .thenAnswer((_) async => Right(tResponse));
        return bloc;
      },
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: tMessage)),
      expect: () => [
        AiChatState.initial().copyWith(
          postAiChatLoading: true,
          postAiChatSuccess: false,
          postAiChatErrorMessage: '',
          messages: [
            const AiChatMessage(content: tMessage, isUser: true),
          ],
        ),
        AiChatState.initial().copyWith(
          postAiChatLoading: false,
          postAiChatSuccess: true,
          postAiChatErrorMessage: '',
          messages: [
            const AiChatMessage(content: tMessage, isUser: true),
            const AiChatMessage(content: 'Halo juga', isUser: false),
          ],
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.postAiChat(tMessage)).called(1);
      },
    );

    blocTest<AiChatBloc, AiChatState>(
      'should emit [Loading, Error] when postAiChat fails',
      build: () {
        when(() => mockRepository.postAiChat(tMessage)).thenAnswer(
          (_) async => const Left(
            ServerFailures(statusCode: 500, title: 'Error', message: 'Error'),
          ),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: tMessage)),
      expect: () => [
        AiChatState.initial().copyWith(
          postAiChatLoading: true,
          postAiChatSuccess: false,
          postAiChatErrorMessage: '',
          messages: [
            const AiChatMessage(content: tMessage, isUser: true),
          ],
        ),
        AiChatState.initial().copyWith(
          postAiChatLoading: false,
          postAiChatSuccess: false,
          postAiChatErrorMessage: 'Error',
          messages: [
            const AiChatMessage(content: tMessage, isUser: true),
          ],
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.postAiChat(tMessage)).called(1);
      },
    );

    blocTest<AiChatBloc, AiChatState>(
      'should not emit anything when message is empty or whitespace',
      build: () => bloc,
      act: (bloc) => bloc.add(const AiChatEvent.postAiChat(message: '   ')),
      expect: () => [],
      verify: (_) {
        verifyNever(() => mockRepository.postAiChat(any()));
      },
    );

    blocTest<AiChatBloc, AiChatState>(
      'should emit initial state when clearChat is added',
      seed: () => AiChatState.initial().copyWith(
        messages: [const AiChatMessage(content: 'Hello', isUser: true)],
      ),
      build: () => bloc,
      act: (bloc) => bloc.add(const AiChatEvent.clearChat()),
      expect: () => [
        AiChatState.initial(),
      ],
    );
  });
}
