import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
import 'package:sahaba_mobile/injector.dart';

class RequestInterceptor extends Interceptor {
  IAuthLocalDatasource? _authLocalDatasource;

  IAuthLocalDatasource get _authLocal => _authLocalDatasource ??= sl();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Lazy resolve auth datasource to avoid init order issues
    final authLocal = _authLocal;

    var token =
        authLocal.authGuestDataHive?.accessToken ??
        authLocal.authUserDataHive?.accessToken;
        
    var katanaraToken = authLocal.authAiDataHive?.token;

    debugPrint(
      '=== RequestInterceptor: Cached '
      'token: ${token != null ? 'Present' : 'Null'}',
    );
    if (token == null) {
      final authUser = authLocal.authUserDataHive?.accessToken;
      final authGuest = authLocal.authGuestDataHive?.accessToken;
      token = authUser ?? authGuest;

      debugPrint(
        '=== RequestInterceptor: Fetched from Hive'
        'User token: $authUser, Guest token: $authGuest',
      );
    }
    
    // Check if the request is going to Katanara AI URL
    if (options.baseUrl.contains('api-katanara.solu.co.id')) {
        if (katanaraToken != null) {
             options.headers['Authorization'] = 'Bearer $katanaraToken';
             debugPrint('=== RequestInterceptor: Katanara Token added to header for ${options.uri}');
        } else {
             debugPrint('=== RequestInterceptor: WARNING - No Katanara token found for ${options.uri}');
        }
    } else {
        if (token != null) {
          options.headers['Authorization'] = token;
          debugPrint(
            '=== RequestInterceptor: Token added to header for ${options.uri}',
          );
        } else {
          debugPrint(
            '=== RequestInterceptor: WARNING - No token found for ${options.uri}',
          );
        }
    }

    return handler.next(options);
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var headers = '';
    options.headers.forEach((key, value) {
      headers += '|    $key: $value\n';
    });

    debugPrint(
      '┌----------------------------------------------------------------------',
    );
    debugPrint('| [DIO] Request: ${options.method} ${options.uri} ');
    debugPrint('| Headers:\n$headers');
    if (options.queryParameters.isNotEmpty) {
      debugPrint('| Parameters:');
      options.queryParameters.forEach((key, value) {
        debugPrint('|    $key -> $value');
      });
    }
    if (options.data != null) {
      debugPrint('| Body:');
      if (options.data is Map) {
        (options.data as Map).forEach((key, value) {
          debugPrint('|    $key -> $value');
        });
      } else if (options.data is FormData) {
        for (final e in (options.data as FormData).fields) {
          debugPrint('|    ${e.key} -> ${e.value}');
        }
        for (final e in (options.data as FormData).files) {
          debugPrint('|    ${e.key} -> ${e.value}');
        }
      } else {
        debugPrint('|    ${options.data}');
      }
    }
    debugPrint(
      '├----------------------------------------------------------------------',
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(
      '| [DIO] Response ${response.requestOptions.uri}'
      '[code ${response.statusCode}]: ${response.data}',
    );
    debugPrint(
      '└----------------------------------------------------------------------',
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      '| [DIO] Error ${err.requestOptions.uri}: ${err.error}: ${err.response}',
    );
    debugPrint(
      '└----------------------------------------------------------------------',
    );

    super.onError(err, handler);
  }
}
