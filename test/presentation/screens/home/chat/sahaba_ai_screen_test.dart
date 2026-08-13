import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/business_logic/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:sahaba_mobile/presentation/screens/home/chat/sahaba_ai_screen.dart';

class MockAiChatBloc extends MockBloc<AiChatEvent, AiChatState> implements AiChatBloc {}

class FakeAiChatEvent extends Fake implements AiChatEvent {}

void main() {
  late MockAiChatBloc mockAiChatBloc;

  setUpAll(() {
    registerFallbackValue(FakeAiChatEvent());
  });

  setUp(() {
    mockAiChatBloc = MockAiChatBloc();
    when(() => mockAiChatBloc.state).thenReturn(AiChatState.initial());
  });

  Widget buildWidget() {
    return MaterialApp(
      home: BlocProvider<AiChatBloc>.value(
        value: mockAiChatBloc,
        child: const SahabaAiScreen(),
      ),
    );
  }

  testWidgets('should render initial empty state with suggestions', (tester) async {
    await tester.pumpWidget(buildWidget());

    expect(find.text("Assalamu'alaikum"), findsOneWidget);
    expect(find.text('Ada yang ingin ditanyakan hari ini?'), findsOneWidget);
    expect(find.text('Mulai dengan topik di bawah ini'), findsOneWidget);
    expect(find.text('Carikan doa sebelum tidur'), findsOneWidget);
  });

  testWidgets('should add PostAiChat event when suggestion chip is tapped', (tester) async {
    await tester.pumpWidget(buildWidget());

    final chip = find.text('Carikan doa sebelum tidur');
    expect(chip, findsOneWidget);

    await tester.tap(chip);
    await tester.pump();

    verify(() => mockAiChatBloc.add(const AiChatEvent.postAiChat(message: 'Carikan doa sebelum tidur'))).called(1);
  });

  testWidgets('should render loading state correctly', (tester) async {
    when(() => mockAiChatBloc.state).thenReturn(AiChatState.initial().copyWith(
      postAiChatLoading: true,
      messages: [const AiChatMessage(content: 'Halo', isUser: true)],
    ));

    await tester.pumpWidget(buildWidget());

    expect(find.text('Halo'), findsOneWidget);
  });

  testWidgets('should render user and AI messages', (tester) async {
    when(() => mockAiChatBloc.state).thenReturn(AiChatState.initial().copyWith(
      messages: [
        const AiChatMessage(content: 'Halo', isUser: true),
        const AiChatMessage(content: 'Halo juga', isUser: false),
      ],
    ));

    await tester.pumpWidget(buildWidget());

    expect(find.text('Halo'), findsOneWidget);
    expect(find.text('Halo juga'), findsOneWidget);
    expect(find.text('Kata Sahaba'), findsOneWidget);
  });

  testWidgets('should add PostAiChat event when text is entered and send button is tapped', (tester) async {
    await tester.pumpWidget(buildWidget());

    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    await tester.enterText(textField, 'Test question');
    await tester.pump();

    final sendButton = find.byIcon(Icons.send_rounded);
    await tester.tap(sendButton);
    await tester.pump();

    verify(() => mockAiChatBloc.add(const AiChatEvent.postAiChat(message: 'Test question'))).called(1);
  });
}
