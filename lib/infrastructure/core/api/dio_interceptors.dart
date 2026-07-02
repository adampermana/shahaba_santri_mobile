import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
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
  void onResponse(Response response, ResponseInterceptorHandler handler) {
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
