import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sahaba_mobile/infrastructure/core/api/dio_interceptors.dart';

// New Url
// const String baseUrl = 'http://158.140.181.43:8513';
const String baseUrl = 'http://157.20.32.181:8513';
const String baseAIUrl = 'https://api-katanara.solu.co.id';
// const String baseUrl = 'http://192.168.10.130:8123';
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

    return Dio(option)
      ..interceptors.addAll([
        RequestInterceptor(),
        if (kDebugMode) LoggingInterceptor(),
      ]);
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
