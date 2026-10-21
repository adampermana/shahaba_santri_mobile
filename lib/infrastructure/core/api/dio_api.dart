import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sahaba_mobile/infrastructure/core/api/dio_interceptors.dart';

// New Url
const String baseUrl = 'http://192.168.35.31:8539';
// const String baseUrl = 'http://192.168.10.52:8123';
const String baseAIUrl = 'https://api-katanara.solu.co.id';
// const String baseUrl = 'http://192.168.10.42:8123';
const String minio = 'https://api.minio-dev.solu.co.id';
const String myQuranBaseUrl = 'https://api.myquran.com';
const String calendarBaseUrl = 'https://api-hari-libur.vercel.app';

class DioApi {
  static Dio init() {
    final option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    final dio = Dio(option);
    dio.interceptors.addAll([
      RequestInterceptor(),
      RefreshTokenInterceptor(dio),
      if (kDebugMode) LoggingInterceptor(),
    ]);
    return dio;
  }

  static Dio initMyQuran() {
    final option = BaseOptions(
      baseUrl: myQuranBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    return Dio(option)
      ..interceptors.addAll([
        RequestInterceptor(),
        if (kDebugMode) LoggingInterceptor(),
      ]);
  }

  static Dio initCalendar() {
    final option = BaseOptions(
      baseUrl: calendarBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    return Dio(option)
      ..interceptors.addAll([
        RequestInterceptor(),
        if (kDebugMode) LoggingInterceptor(),
      ]);
  }

  static Dio initAi() {
    final option = BaseOptions(
      baseUrl: baseAIUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    return Dio(option)
      ..interceptors.addAll([
        RequestInterceptor(),
        if (kDebugMode) LoggingInterceptor(),
      ]);
  }
}
