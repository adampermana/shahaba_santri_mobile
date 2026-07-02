import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sahaba_mobile/infrastructure/core/api/dio_interceptors.dart';

// New Url
// const String baseUrl = 'http://158.140.181.43:8513';
// const String baseUrl = 'http://157.20.32.181:8513';
// const String minio = 'https://api.minio-dev.solu.co.id';
// const String aladhanBaseUrl = 'https://api.aladhan.com';
const String myQuranBaseUrl = 'https://api.myquran.com';

class DioApi {
  // static Dio init() {
  //   final option = BaseOptions(
  //     baseUrl: baseUrl,
  //     connectTimeout: const Duration(seconds: 30),
  //     sendTimeout: const Duration(seconds: 30),
  //     receiveTimeout: const Duration(seconds: 30),
  //   );

  //   return Dio(option)
  //     ..interceptors.addAll([
  //       RequestInterceptor(),
  //       if (kDebugMode) LoggingInterceptor(),
  //     ]);
  // }

  static Dio initMyQuran() {
    final option = BaseOptions(
      baseUrl: myQuranBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    return Dio(option)
      ..interceptors.addAll([if (kDebugMode) LoggingInterceptor()]);
  }
}
