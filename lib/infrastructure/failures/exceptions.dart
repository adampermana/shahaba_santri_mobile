import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

const int defaultErrorCode = -1;
const int socketErrorCode = -4;

class ServerException extends ServerFailures implements Exception {
  factory ServerException.withMessage({
    required String title,
    required String message,
    int statusCode = defaultErrorCode,
    String email = '',
    int? cooldownOtp,
    String? tempToken,
    bool? isProfileCompleted,
  }) {
    return ServerException._(
      statusCode: statusCode,
      title: title,
      message: message,
      email: email,
      cooldownOtp: cooldownOtp,
      tempToken: tempToken,
      isProfileCompleted: isProfileCompleted,
    );
  }

  factory ServerException.withError(DioException error) {
    var code = defaultErrorCode;
    var title = '';
    var message = '';
    const email = '';

    switch (error.type) {
      case DioExceptionType.cancel:
        title = 'Oh no...';
        message = 'Request was cancelled';

      case DioExceptionType.connectionTimeout:
        title = 'Connection timeout...';
        message = 'Please check your internet connection and try again.';

      case DioExceptionType.receiveTimeout:
        title = 'Oh no...';
        message = 'Receive timeout in connection';

      case DioExceptionType.sendTimeout:
        title = 'Oh no...';
        message = 'Receive timeout in send request';

      case DioExceptionType.badCertificate:
        title = 'This connection is not safe';
        message = 'Please ensure that you are going to correct site';

      case DioExceptionType.connectionError:
        title = 'Connection error...';
        message = 'Please check your internet connection and try again.';

      case DioExceptionType.unknown:
        final ex = error.error;
        // SocketException → treat sebagai no-connection
        if (ex is SocketException) {
          code = socketErrorCode;
          title = 'No connection found';
          message = 'Please check your internet connection and try again.';
          break;
        }
        title = 'Oh no...';
        message = 'Internal Server Error';

      case DioExceptionType.badResponse:
        code = error.response?.statusCode ?? defaultErrorCode;

        final raw = error.response?.data;
        Map<String, dynamic>? responseData;

        if (raw is Map) {
          responseData = Map<String, dynamic>.from(raw);
        }

        if (responseData == null) {
          title = 'Oh no...';
          message = 'Something went wrong. We are working on it.';
          break;
        }

        // Parse meta object if present
        final meta = responseData['meta'] is Map
            ? Map<String, dynamic>.from(responseData['meta'] as Map)
            : null;

        // Parse flat response: message, status, code, errors, error
        final responseMessage = _asString(responseData['message']) ??
            _asString(meta?['message']);
        final responseError = _asString(responseData['error']);
        final responseCode =
            _asStatusCode(responseData['status']) ??
            _asStatusCode(responseData['code']) ??
            _asStatusCode(meta?['code']);
        final validationErrors = _parseValidationErrors(
          responseData['errors'],
        );
        final cooldownOtp = _asInt(responseData['cooldown_otp']);
        final topEmailVerified = responseData['email_verified'] as bool?;
        final validationMessage =
            (validationErrors.isEmpty ? null : validationErrors.values.first) ??
            _firstErrorMessage(responseData['errors']);

        // Parse data object
        final data = responseData['data'];
        var requiresVerification = topEmailVerified == false;
        var dataEmail = '';
        var dataPhone = '';
        String? tempToken;
        bool? isProfileCompleted;

        if (data is Map) {
          final dataMap = Map<String, dynamic>.from(data);
          requiresVerification =
              (dataMap['requiresVerification'] as bool?) ??
              requiresVerification;
          dataEmail = _asString(dataMap['email']) ?? '';
          dataPhone = _asString(dataMap['phone']) ?? '';
          tempToken = _asString(dataMap['temp_token']);
          isProfileCompleted = dataMap['is_profile_completed'] as bool?;

          final user = dataMap['user'];
          if (user is Map) {
            final userMap = Map<String, dynamic>.from(user);
            dataEmail = _asString(userMap['email']) ?? dataEmail;
            isProfileCompleted =
                userMap['is_profile_completed'] as bool? ?? isProfileCompleted;
            final isEmailVerified = userMap['is_email_verified'] as bool?;
            if (isEmailVerified == false) {
              requiresVerification = true;
            }
          }
        }

        code = responseCode ?? code;
        message =
            validationMessage ??
            (responseMessage != null && responseMessage.isNotEmpty
                ? responseMessage
                : responseError) ??
            'Something went wrong.';
        title = responseMessage ?? responseError ?? 'Something went wrong';

        // Return with all parsed data
        return ServerException._(
          statusCode: code,
          title: title,
          message: message,
          email: dataEmail,
          phone: dataPhone,
          requiresVerification: requiresVerification,
          cooldownOtp: cooldownOtp,
          tempToken: tempToken,
          isProfileCompleted: isProfileCompleted,
          validationErrors: validationErrors,
        );
      case DioExceptionType.transformTimeout:
        title = 'Oh no...';
        message = 'Transform timeout in response processing';
    }

    // Fallback terakhir: beberapa lib mengisi error.error sebagai Map
    if (message.isEmpty) {
      final e = error.error;
      if (e is Map) {
        final mm = _asString(e['message']);
        if (mm != null && mm.isNotEmpty) {
          message = mm;
          if (title.isEmpty) title = 'Something went wrong';
        }
      }
    }

    if (title.isEmpty) title = 'Oh no...';
    if (message.isEmpty) message = 'Unexpected error.';

    return ServerException._(
      statusCode: code,
      title: title,
      message: message,
      email: email,
    );
  }
  const ServerException._({
    required super.statusCode,
    required super.title,
    required super.message,
    super.requiresVerification,
    super.email,
    super.phone,
    super.cooldownOtp,
    super.tempToken,
    super.isProfileCompleted,
    super.validationErrors,
  });

  static String? _asString(dynamic v) => v is String ? v : v?.toString();

  static int? _asInt(dynamic v) {
    if (v is int) return v;
    if (v is num) return v.toInt();
    if (v is String) return int.tryParse(v);
    return null;
  }

  static int? _asStatusCode(dynamic v) {
    final value = _asInt(v);
    if (value == null || value < 100 || value > 599) return null;
    return value;
  }

  static String? _firstErrorMessage(dynamic errors) {
    if (errors is List) {
      for (final value in errors) {
        if (value is Map) {
          final message = _asString(value['message']);
          if (message != null && message.isNotEmpty) return message;
        }
        final message = _asString(value);
        if (message != null && message.isNotEmpty) return message;
      }
      return null;
    }

    if (errors is! Map) return null;

    for (final value in errors.values) {
      if (value is List && value.isNotEmpty) {
        return _asString(value.first);
      }
      final message = _asString(value);
      if (message != null && message.isNotEmpty) return message;
    }

    return null;
  }

  static Map<String, String> _parseValidationErrors(dynamic errors) {
    final result = <String, String>{};

    if (errors is List) {
      for (final value in errors) {
        if (value is! Map) continue;

        final field = _asString(value['field']);
        final message = _asString(value['message']);
        if (field != null &&
            field.isNotEmpty &&
            message != null &&
            message.isNotEmpty) {
          result.putIfAbsent(field, () => message);
        }
      }
      return result;
    }

    if (errors is Map) {
      for (final entry in errors.entries) {
        final field = _asString(entry.key);
        final value = entry.value;
        final message = value is List && value.isNotEmpty
            ? _asString(value.first)
            : _asString(value);

        if (field != null &&
            field.isNotEmpty &&
            message != null &&
            message.isNotEmpty) {
          result.putIfAbsent(field, () => message);
        }
      }
    }

    return result;
  }
}
