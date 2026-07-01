import 'package:meta/meta.dart';

const locationServiceErrorCode = -1;
const locationPermissionErrorCode = -2;

const notificationServiceErrorCode = -1;
const notificationPermissionErrorCode = -2;

@immutable
class Failure {
  const Failure(this.title, this.message);

  final String title;
  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          message == other.message;

  @override
  int get hashCode => Object.hash(title, message);
}

class ServerFailures extends Failure {
  const ServerFailures({
    required this.statusCode,
    required String title,
    required String message,
    this.requiresVerification = false,
    this.email,
    this.phone,
    this.cooldownOtp,
    this.tempToken,
    this.isProfileCompleted,
    this.validationErrors = const {},
  }) : super(title, message);
  factory ServerFailures.fromResponse(Map<String, dynamic> json) {
    final meta = json['meta'] as Map<String, dynamic>;
    final data = json['data'] as Map<String, dynamic>?;

    final statusCode = meta['code'] as int;
    final title = meta['message'] as String;
    final message = meta['message'] as String;

    return ServerFailures(
      statusCode: statusCode,
      title: title,
      message: message,
      requiresVerification: data?['requiresVerification'] as bool? ?? false,
      email: data?['email'] as String?,
      phone: data?['phone'] as String?,
      cooldownOtp: json['cooldown_otp'] as int?,
      tempToken: data?['temp_token'] as String?,
      isProfileCompleted: data?['is_profile_completed'] as bool?,
    );
  }

  final int statusCode;
  final bool requiresVerification;
  final String? email;
  final String? phone;
  final int? cooldownOtp;
  final String? tempToken;
  final bool? isProfileCompleted;
  final Map<String, String> validationErrors;

  List<Object?> get props => [
    statusCode,
    title,
    message,
    requiresVerification,
    email,
    phone,
    cooldownOtp,
    tempToken,
    isProfileCompleted,
    validationErrors,
  ];

  @override
  String toString() {
    return 'ServerFailures('
        'statusCode: $statusCode, '
        'title: $title, '
        'message: $message, '
        'requiresVerification: $requiresVerification, '
        'email: $email, '
        'phone: $phone, '
        'cooldownOtp: $cooldownOtp, '
        'tempToken: $tempToken, '
        'isProfileCompleted: $isProfileCompleted, '
        'validationErrors: $validationErrors)';
  }
}

class LocationError extends Failure {
  const LocationError({required String title, required String message})
    : super(title, message);

  List<Object?> get props => [title, message];
}

class CacheFailure extends Failure {
  const CacheFailure({required String? message})
    : super(message ?? 'Failed', 'Error while caching data');
}

enum PermissionType { location, storage, microphone }

class PermissionFailure extends Failure {
  const PermissionFailure({
    required this.permissionType,
    String? title,
    String? message,
  }) : super(title ?? 'Failed', message ?? 'Permission denied');
  final PermissionType permissionType;
}

class LocationFailure extends Failure {
  const LocationFailure([
    String? title,
    String? message,
    this.statusCode = locationServiceErrorCode,
  ]) : super(
         title ?? 'Failed',
         message ?? "Can't get location from the device",
       );
  final int statusCode;
}

class NoImageFailure extends Failure {
  const NoImageFailure([String? title, String? message])
    : super(title ?? 'Failed', message ?? 'Image is required to continue');
}

class LocationFakeGpsFailure extends Failure {
  const LocationFakeGpsFailure([
    String? title,
    String? message,
    this.statusCode = locationServiceErrorCode,
  ]) : super(
         title ?? 'Failed',
         message ??
             'Our app has detected the use of a fake GPS. '
                 'Please deactivate it to utilize our feature',
       );
  final int statusCode;
}

class NotificationFailure extends Failure {
  const NotificationFailure([
    String? title,
    String? message,
    this.statusCode = notificationServiceErrorCode,
  ]) : super(
         title ?? 'Failed',
         message ?? "Can't get notification from the device",
       );
  final int statusCode;
}

class DeviceFailure extends Failure {
  const DeviceFailure([String? title, String? message])
    : super(title ?? 'Failed', message ?? "Can't get device information");
}
