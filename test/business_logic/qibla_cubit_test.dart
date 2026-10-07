import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_cubit.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_state.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/i_prayer_repository.dart';
import 'package:sahaba_mobile/infrastructure/qibla/repository/i_qibla_repository.dart';

// Mocks

class MockQiblaRepository extends Mock implements IQiblaRepository {}

class MockPrayerRepository extends Mock implements IPrayerRepository {}

class MockCompassStreamHandler extends MockStreamHandler {
  MockCompassStreamHandler({this.initialData});
  final List<double>? initialData;

  @override
  void onListen(Object? arguments, MockStreamHandlerEventSink events) {
    if (initialData != null) {
      events.success(initialData);
    }
  }

  @override
  void onCancel(Object? arguments) {}
}

void _setupCompassMock({List<double>? initialData}) {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockStreamHandler(
        const EventChannel('hemanthraj/flutter_compass'),
        MockCompassStreamHandler(initialData: initialData),
      );
}

// Tests

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockQiblaRepository qiblaRepository;
  late MockPrayerRepository prayerRepository;

  setUp(() {
    qiblaRepository = MockQiblaRepository();
    prayerRepository = MockPrayerRepository();
  });

  tearDown(() {
    // Reset the stream handler after each test
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockStreamHandler(
          const EventChannel('hemanthraj/flutter_compass'),
          null,
        );
  });

  group('QiblaCubit', () {
    test('initial state is QiblaInitial', () async {
      final cubit = QiblaCubit(qiblaRepository, prayerRepository);
      expect(cubit.state, isA<QiblaInitial>());
      await cubit.close();
    });

    blocTest<QiblaCubit, QiblaState>(
      'emits [QiblaLoading, QiblaError] when getQiblaDirection fails',
      build: () {
        when(
          () => prayerRepository.getSelectedCoordinates(),
        ).thenReturn(const Right((latitude: -6.2, longitude: 106.8)));
        when(() => qiblaRepository.getQiblaDirection(any(), any())).thenAnswer(
          (_) async => const Left(
            ServerFailures(
              statusCode: 500,
              title: 'Error',
              message: 'Gagal mendapatkan arah kiblat',
            ),
          ),
        );
        return QiblaCubit(qiblaRepository, prayerRepository);
      },
      act: (cubit) => cubit.loadQibla(),
      expect: () => [
        isA<QiblaLoading>(),
        isA<QiblaError>().having(
          (s) => s.message,
          'message',
          'Gagal mendapatkan arah kiblat',
        ),
      ],
    );

    blocTest<QiblaCubit, QiblaState>(
      'emits [QiblaLoading, QiblaLoaded] when getQiblaDirection '
      'succeeds and compass emits data',
      build: () {
        _setupCompassMock(initialData: [100.0, 0.0, 0.0]); // heading: 100.0
        when(
          () => prayerRepository.getSelectedCoordinates(),
        ).thenReturn(const Right((latitude: -6.2, longitude: 106.8)));
        when(
          () => qiblaRepository.getQiblaDirection(any(), any()),
        ).thenAnswer((_) async => const Right(295)); // qibla: 295.0
        return QiblaCubit(qiblaRepository, prayerRepository);
      },
      act: (cubit) => cubit.loadQibla(),
      wait: const Duration(milliseconds: 100), // wait for stream to emit
      expect: () => [
        isA<QiblaLoading>(),
        isA<QiblaLoaded>()
            .having((s) => s.heading, 'heading', 100.0)
            .having((s) => s.qiblaDirection, 'qiblaDirection', 295.0)
            .having(
              (s) => s.isFacingQibla,
              'isFacingQibla',
              isFalse,
            ), // diff > threshold
      ],
    );

    blocTest<QiblaCubit, QiblaState>(
      'isFacingQibla is true when heading is close to qiblaDirection',
      build: () {
        _setupCompassMock(
          initialData: [290.0, 0.0, 0.0],
        ); // heading: 290.0 (diff 5 degrees)
        when(
          () => prayerRepository.getSelectedCoordinates(),
        ).thenReturn(const Right((latitude: -6.2, longitude: 106.8)));
        when(
          () => qiblaRepository.getQiblaDirection(any(), any()),
        ).thenAnswer((_) async => const Right(295)); // qibla: 295.0
        return QiblaCubit(qiblaRepository, prayerRepository);
      },
      act: (cubit) => cubit.loadQibla(),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        isA<QiblaLoading>(),
        isA<QiblaLoaded>()
            .having((s) => s.heading, 'heading', 290.0)
            .having((s) => s.qiblaDirection, 'qiblaDirection', 295.0)
            .having(
              (s) => s.isFacingQibla,
              'isFacingQibla',
              isTrue,
            ), // diff = 5 <= 15
      ],
    );
  });
}
