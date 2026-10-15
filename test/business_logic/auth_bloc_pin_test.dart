import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/auth/pin/pin_response.dart';
import 'package:sahaba_mobile/domains/auth/pin/request_reset_pin_response.dart';
import 'package:sahaba_mobile/infrastructure/auth/repositories/i_auth_repositories.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/services/device_info_service.dart';

class MockAuthRepositories extends Mock implements IAuthRepositories {}

class MockDeviceInfoService extends Mock implements DeviceInfoService {}

void main() {
  late MockAuthRepositories mockRepo;
  late MockDeviceInfoService mockDeviceInfo;

  setUp(() {
    mockRepo = MockAuthRepositories();
    mockDeviceInfo = MockDeviceInfoService();
  });

  group('AuthBloc - PIN Flow Tests', () {
    const pinResponse = PinResponse(
      success: true,
      message: 'PIN set successfully',
      data: PinData(isPin: true),
    );

    const resetPinResponse = PinResponse(
      success: true,
      message: 'PIN reset successfully',
      data: PinData(isPin: true),
    );

    const requestResetPinResponse = RequestResetPinResponse(
      success: true,
      message: 'If the account exists, a PIN reset code has been sent',
      data: RequestResetPinData(cooldownOtp: 60),
    );

    const failure = ServerFailures(
      statusCode: 400,
      title: 'Gagal',
      message: 'Permintaan tidak valid',
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loadingCreatePin: true, successCreatePin: true] '
      'when postCreatePin succeeds',
      build: () {
        when(
          () => mockRepo.postCreatePin(pin: '123456'),
        ).thenAnswer((_) async => const Right(pinResponse));
        return AuthBloc(mockRepo, mockDeviceInfo);
      },
      act: (bloc) => bloc.add(const AuthEvent.postCreatePin(pin: '123456')),
      expect: () => [
        isA<AuthState>()
            .having((s) => s.loadingCreatePin, 'loadingCreatePin', isTrue)
            .having((s) => s.successCreatePin, 'successCreatePin', isFalse),
        isA<AuthState>()
            .having((s) => s.loadingCreatePin, 'loadingCreatePin', isFalse)
            .having((s) => s.successCreatePin, 'successCreatePin', isTrue)
            .having((s) => s.statusCode, 'statusCode', 200)
            .having(
              (s) => s.createPinResponse?.data?.isPin,
              'isPin',
              isTrue,
            ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loadingCreatePin: true, successCreatePin: false] '
      'with error when postCreatePin fails',
      build: () {
        when(
          () => mockRepo.postCreatePin(pin: '123456'),
        ).thenAnswer((_) async => const Left(failure));
        return AuthBloc(mockRepo, mockDeviceInfo);
      },
      act: (bloc) => bloc.add(const AuthEvent.postCreatePin(pin: '123456')),
      expect: () => [
        isA<AuthState>()
            .having((s) => s.loadingCreatePin, 'loadingCreatePin', isTrue)
            .having((s) => s.successCreatePin, 'successCreatePin', isFalse),
        isA<AuthState>()
            .having((s) => s.loadingCreatePin, 'loadingCreatePin', isFalse)
            .having((s) => s.successCreatePin, 'successCreatePin', isFalse)
            .having((s) => s.statusCode, 'statusCode', 400)
            .having((s) => s.message, 'message', 'Permintaan tidak valid'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loadingRequestResetPinOtp: true, '
      'successRequestResetPinOtp: true] '
      'when postRequestResetPinOtp succeeds',
      build: () {
        when(
          () => mockRepo.postRequestResetPinOtp(email: 'test@example.com'),
        ).thenAnswer((_) async => const Right(requestResetPinResponse));
        return AuthBloc(mockRepo, mockDeviceInfo);
      },
      act: (bloc) => bloc.add(
        const AuthEvent.postRequestResetPinOtp(email: 'test@example.com'),
      ),
      expect: () => [
        isA<AuthState>()
            .having(
              (s) => s.loadingRequestResetPinOtp,
              'loadingRequestResetPinOtp',
              isTrue,
            )
            .having(
              (s) => s.successRequestResetPinOtp,
              'successRequestResetPinOtp',
              isFalse,
            ),
        isA<AuthState>()
            .having(
              (s) => s.loadingRequestResetPinOtp,
              'loadingRequestResetPinOtp',
              isFalse,
            )
            .having(
              (s) => s.successRequestResetPinOtp,
              'successRequestResetPinOtp',
              isTrue,
            )
            .having((s) => s.statusCode, 'statusCode', 200)
            .having((s) => s.cooldownOtp, 'cooldownOtp', 60),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loadingResetPin: true, successResetPin: true] '
      'when postResetPin succeeds',
      build: () {
        when(
          () => mockRepo.postResetPin(
            email: 'test@example.com',
            code: '123456',
            pin: '654321',
          ),
        ).thenAnswer((_) async => const Right(resetPinResponse));
        return AuthBloc(mockRepo, mockDeviceInfo);
      },
      act: (bloc) => bloc.add(
        const AuthEvent.postResetPin(
          email: 'test@example.com',
          code: '123456',
          pin: '654321',
        ),
      ),
      expect: () => [
        isA<AuthState>()
            .having((s) => s.loadingResetPin, 'loadingResetPin', isTrue)
            .having((s) => s.successResetPin, 'successResetPin', isFalse),
        isA<AuthState>()
            .having((s) => s.loadingResetPin, 'loadingResetPin', isFalse)
            .having((s) => s.successResetPin, 'successResetPin', isTrue)
            .having((s) => s.statusCode, 'statusCode', 200)
            .having(
              (s) => s.resetPinResponse?.data?.isPin,
              'isPin',
              isTrue,
            ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loadingLoginPin: true, successLoginPin: true] '
      'when postLoginPin succeeds',
      build: () {
        when(
          () => mockRepo.postLoginPin(
            identifier: 'test@example.com',
            pin: '123456',
          ),
        ).thenAnswer(
          (_) async => const Right(
            LoginResponse(
              success: true,
              message: 'Login berhasil',
              token: 'jwt-token',
              isPin: true,
            ),
          ),
        );
        return AuthBloc(mockRepo, mockDeviceInfo);
      },
      act: (bloc) => bloc.add(
        const AuthEvent.postLoginPin(
          identifier: 'test@example.com',
          pin: '123456',
        ),
      ),
      expect: () => [
        isA<AuthState>()
            .having((s) => s.loadingLoginPin, 'loadingLoginPin', isTrue)
            .having((s) => s.successLoginPin, 'successLoginPin', isFalse),
        isA<AuthState>()
            .having((s) => s.loadingLoginPin, 'loadingLoginPin', isFalse)
            .having((s) => s.successLoginPin, 'successLoginPin', isTrue)
            .having((s) => s.statusCode, 'statusCode', 200)
            .having(
              (s) => s.loginResponse?.token,
              'token',
              'jwt-token',
            ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loadingLoginPin: true, successLoginPin: false] '
      'with 401 error when postLoginPin fails',
      build: () {
        when(
          () => mockRepo.postLoginPin(
            identifier: 'test@example.com',
            pin: '000000',
          ),
        ).thenAnswer((_) async => const Left(failure));
        return AuthBloc(mockRepo, mockDeviceInfo);
      },
      act: (bloc) => bloc.add(
        const AuthEvent.postLoginPin(
          identifier: 'test@example.com',
          pin: '000000',
        ),
      ),
      expect: () => [
        isA<AuthState>()
            .having((s) => s.loadingLoginPin, 'loadingLoginPin', isTrue)
            .having((s) => s.successLoginPin, 'successLoginPin', isFalse),
        isA<AuthState>()
            .having((s) => s.loadingLoginPin, 'loadingLoginPin', isFalse)
            .having((s) => s.successLoginPin, 'successLoginPin', isFalse)
            .having((s) => s.statusCode, 'statusCode', 400)
            .having((s) => s.message, 'message', 'Permintaan tidak valid'),
      ],
    );
  });
}
