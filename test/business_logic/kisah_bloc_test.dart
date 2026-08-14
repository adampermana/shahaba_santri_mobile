import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/business_logic/kisah_bloc/kisah_bloc.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/kisah/repository/i_kisah_repository.dart';

//  Mock

class MockKisahRepository extends Mock implements IKisahRepository {}

//  Fixture helpers

final _kisahData1 = KisahData(
  id: 1,
  title: 'Kisah Nabi Adam',
  content: 'Ini adalah kisah Nabi Adam.',
  authorId: 1,
  view: 100,
  createdAt: '2024-01-01',
  updatedAt: '2024-01-02',
);

final _kisahData2 = KisahData(
  id: 2,
  title: 'Kisah Nabi Idris',
  content: 'Ini adalah kisah Nabi Idris.',
  authorId: 1,
  view: 200,
  createdAt: '2024-02-01',
  updatedAt: '2024-02-02',
);

final _kisahResponse = KisahResponse(data: [_kisahData1, _kisahData2]);

const _failure = ServerFailures(
  statusCode: 500,
  title: 'Server Error',
  message: 'Terjadi kesalahan server',
);

//  Tests

void main() {
  late MockKisahRepository repository;

  setUp(() {
    repository = MockKisahRepository();
  });

  //  KisahState.initial()

  group('KisahState.initial()', () {
    test('all flags are false/empty', () {
      final state = KisahState.initial();
      expect(state.fetchKisahLoading, isFalse);
      expect(state.fetchKisahSuccess, isFalse);
      expect(state.fetchKisahErrorMessage, '');
      expect(state.fetchKisahStatusCode, 0);
      expect(state.kisahResponse, isNull);

      expect(state.fetchDetailLoading, isFalse);
      expect(state.fetchDetailSuccess, isFalse);
      expect(state.fetchDetailErrorMessage, '');
      expect(state.kisahDetail, isNull);
    });
  });

  //  KisahEvent.fetchKisahList

  group('KisahEvent.fetchKisahList', () {
    blocTest<KisahBloc, KisahState>(
      'emits [loading, success] when getKisahList succeeds',
      build: () {
        when(
          () => repository.getKisahList(),
        ).thenAnswer((_) async => Right(_kisahResponse));
        return KisahBloc(repository);
      },
      act: (bloc) => bloc.add(const KisahEvent.fetchKisahList()),
      expect: () => [
        // 1. Loading
        isA<KisahState>()
            .having((s) => s.fetchKisahLoading, 'fetchKisahLoading', isTrue)
            .having((s) => s.fetchKisahSuccess, 'fetchKisahSuccess', isFalse)
            .having(
              (s) => s.fetchKisahErrorMessage,
              'fetchKisahErrorMessage',
              '',
            )
            .having((s) => s.fetchKisahStatusCode, 'fetchKisahStatusCode', 0),
        // 2. Success
        isA<KisahState>()
            .having((s) => s.fetchKisahLoading, 'fetchKisahLoading', isFalse)
            .having((s) => s.fetchKisahSuccess, 'fetchKisahSuccess', isTrue)
            .having((s) => s.kisahResponse, 'kisahResponse', _kisahResponse),
      ],
      verify: (_) {
        verify(() => repository.getKisahList()).called(1);
      },
    );

    blocTest<KisahBloc, KisahState>(
      'emits [loading, error] when getKisahList fails',
      build: () {
        when(
          () => repository.getKisahList(),
        ).thenAnswer((_) async => const Left(_failure));
        return KisahBloc(repository);
      },
      act: (bloc) => bloc.add(const KisahEvent.fetchKisahList()),
      expect: () => [
        // 1. Loading
        isA<KisahState>().having(
          (s) => s.fetchKisahLoading,
          'fetchKisahLoading',
          isTrue,
        ),
        // 2. Error
        isA<KisahState>()
            .having((s) => s.fetchKisahLoading, 'fetchKisahLoading', isFalse)
            .having((s) => s.fetchKisahSuccess, 'fetchKisahSuccess', isFalse)
            .having(
              (s) => s.fetchKisahErrorMessage,
              'fetchKisahErrorMessage',
              'Terjadi kesalahan server',
            )
            .having((s) => s.kisahResponse, 'kisahResponse', isNull),
      ],
    );

    blocTest<KisahBloc, KisahState>(
      'resets kisahResponse on failure',
      build: () {
        when(
          () => repository.getKisahList(),
        ).thenAnswer((_) async => const Left(_failure));
        return KisahBloc(repository);
      },
      seed: () => KisahState.initial().copyWith(
        kisahResponse: _kisahResponse,
      ),
      act: (bloc) => bloc.add(const KisahEvent.fetchKisahList()),
      verify: (bloc) {
        expect(bloc.state.kisahResponse, isNull);
      },
    );
  });

  //  KisahEvent.fetchKisahDetail

  group('KisahEvent.fetchKisahDetail', () {
    const detailId = 1;

    blocTest<KisahBloc, KisahState>(
      'emits [loading, success] when getKisahDetail succeeds',
      build: () {
        when(
          () => repository.getKisahDetail(any()),
        ).thenAnswer((_) async => Right(_kisahData1));
        return KisahBloc(repository);
      },
      act: (bloc) => bloc.add(const KisahEvent.fetchKisahDetail(detailId)),
      expect: () => [
        // 1. Loading
        isA<KisahState>()
            .having((s) => s.fetchDetailLoading, 'fetchDetailLoading', isTrue)
            .having((s) => s.fetchDetailSuccess, 'fetchDetailSuccess', isFalse)
            .having(
              (s) => s.fetchDetailErrorMessage,
              'fetchDetailErrorMessage',
              '',
            )
            .having((s) => s.kisahDetail, 'kisahDetail', isNull),
        // 2. Success
        isA<KisahState>()
            .having((s) => s.fetchDetailLoading, 'fetchDetailLoading', isFalse)
            .having((s) => s.fetchDetailSuccess, 'fetchDetailSuccess', isTrue)
            .having((s) => s.kisahDetail, 'kisahDetail', _kisahData1),
      ],
      verify: (_) {
        verify(() => repository.getKisahDetail(detailId)).called(1);
      },
    );

    blocTest<KisahBloc, KisahState>(
      'emits [loading, error] when getKisahDetail fails',
      build: () {
        when(
          () => repository.getKisahDetail(any()),
        ).thenAnswer((_) async => const Left(_failure));
        return KisahBloc(repository);
      },
      act: (bloc) => bloc.add(const KisahEvent.fetchKisahDetail(detailId)),
      expect: () => [
        // 1. Loading
        isA<KisahState>().having(
          (s) => s.fetchDetailLoading,
          'fetchDetailLoading',
          isTrue,
        ),
        // 2. Error
        isA<KisahState>()
            .having((s) => s.fetchDetailLoading, 'fetchDetailLoading', isFalse)
            .having((s) => s.fetchDetailSuccess, 'fetchDetailSuccess', isFalse)
            .having(
              (s) => s.fetchDetailErrorMessage,
              'fetchDetailErrorMessage',
              'Terjadi kesalahan server',
            )
            .having((s) => s.kisahDetail, 'kisahDetail', isNull),
      ],
    );

    blocTest<KisahBloc, KisahState>(
      'resets kisahDetail on failure',
      build: () {
        when(
          () => repository.getKisahDetail(any()),
        ).thenAnswer((_) async => const Left(_failure));
        return KisahBloc(repository);
      },
      seed: () => KisahState.initial().copyWith(
        kisahDetail: _kisahData1,
      ),
      act: (bloc) => bloc.add(const KisahEvent.fetchKisahDetail(detailId)),
      verify: (bloc) {
        expect(bloc.state.kisahDetail, isNull);
      },
    );
  });
}
