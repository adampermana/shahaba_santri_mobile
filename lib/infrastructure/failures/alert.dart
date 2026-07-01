import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

abstract class Alert {
  factory Alert.fromFailures(Failure failure) {
    switch (failure) {
      case ServerFailures():
        final f = failure;
        switch (f.statusCode) {
          case defaultErrorCode:
            return GeneralAlert();
          case socketErrorCode:
            return NetworkAlert();
          case 401:
            return UnauthenticatedAlert();
          default:
            return GeneralAlert();
        }

      case PermissionFailure():
        return PermissionAlert();

      case LocationFailure(statusCode: final code):
        return LocationAlert(code: code);

      case LocationFakeGpsFailure(statusCode: final code):
        return LocationAlertFakeGps(code: code);

      case NotificationFailure(statusCode: final code):
        return NotificationAlert(code: code);

      default:
        return GeneralAlert();
    }
  }
}

class UnauthenticatedAlert implements Alert {}

class NetworkAlert implements Alert {}

class GeneralAlert implements Alert {}

class PermissionAlert implements Alert {}

class LocationAlert implements Alert {
  LocationAlert({this.code});

  /// code 0 => *Service Unavailable*
  /// code 1 => *Permission Needed*
  final int? code;
}

class LocationAlertFakeGps implements Alert {
  LocationAlertFakeGps({this.code});

  ///code 0 => *Service Unavailable*
  ///code 1 => *Permission Needed*
  final int? code;
}

class NotificationAlert implements Alert {
  NotificationAlert({this.code});

  ///code 0 => *Service Unavailable*
  ///code 1 => *Permission Needed*
  final int? code;
}
