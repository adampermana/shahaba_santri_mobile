import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_hive.dart';
import 'package:sahaba_mobile/domains/auth/hive/auth_data_katanara_hive.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class IAuthLocalDatasource {
  AuthDataHive? get authUserDataHive;
  AuthDataHive? get authGuestDataHive;
  AuthDataKatanaraHive? get authAiDataHive;

  Future<void> saveAuthUser(AuthDataHive authDataHive);
  Future<void> saveAuthGuest(AuthDataHive authDataHive);
  Future<void> saveAuthAi(AuthDataKatanaraHive authDataHive);

  Future<void> clearAuthUser();
  Future<void> clearAuthGuest();
  Future<void> clearAuthAi();
}

class HiveAuthLocalDatasource implements IAuthLocalDatasource {
  static const String authGuestBox = 'auth-guest-box';
  static const String authUserBox = 'auth-user-box';
  static const String authAiBox = 'auth-ai-box';
  static const String _authUserKey = 'auth-user-key';
  static const String _authGuestKey = 'auth-guest-key';
  static const String _authAiKey = 'auth-ai-key';

  @override
  AuthDataHive? get authUserDataHive =>
      Hive.box<AuthDataHive>(authUserBox).get(_authUserKey);

  @override
  AuthDataHive? get authGuestDataHive =>
      Hive.box<AuthDataHive>(authGuestBox).get(_authGuestKey);

  @override
  AuthDataKatanaraHive? get authAiDataHive =>
      Hive.box<AuthDataKatanaraHive>(authAiBox).get(_authAiKey);

  @override
  Future<void> saveAuthUser(AuthDataHive authDataHive) async {
    try {
      await Hive.box<AuthDataHive>(authUserBox).put(
        _authUserKey,
        authDataHive,
      );
    } on CacheFailure catch (e) {
      throw CacheFailure(message: e.message);
    }
  }

  @override
  Future<void> saveAuthGuest(AuthDataHive authDataHive) async {
    try {
      await Hive.box<AuthDataHive>(authGuestBox).put(
        _authGuestKey,
        authDataHive,
      );
    } on CacheFailure catch (e) {
      throw CacheFailure(message: e.message);
    }
  }
  
  @override
  Future<void> saveAuthAi(AuthDataKatanaraHive authDataHive) async {
    try {
      await Hive.box<AuthDataKatanaraHive>(authAiBox).put(
        _authAiKey,
        authDataHive,
      );
    } on CacheFailure catch (e) {
      throw CacheFailure(message: e.message);
    }
  }

  @override
  Future<void> clearAuthUser() async {
    try {
      await Hive.box<AuthDataHive>(authUserBox).delete(_authUserKey);
    } on CacheFailure catch (e) {
      throw CacheFailure(message: e.message);
    }
  }

  @override
  Future<void> clearAuthGuest() async {
    try {
      await Hive.box<AuthDataHive>(authGuestBox).delete(_authGuestKey);
    } on CacheFailure catch (e) {
      throw CacheFailure(message: e.message);
    }
  }

  @override
  Future<void> clearAuthAi() async {
    try {
      await Hive.box<AuthDataKatanaraHive>(authAiBox).delete(_authAiKey);
    } on CacheFailure catch (e) {
      throw CacheFailure(message: e.message);
    }
  }
}
