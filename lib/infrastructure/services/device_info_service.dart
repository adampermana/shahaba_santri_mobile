import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:sahaba_mobile/domains/shared/device.dart';

import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

class DeviceInfoService {
  Future<Device> deviceInfo() async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      String deviceId;
      String deviceName;
      String platform;

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        deviceId = androidInfo.id;
        deviceName = androidInfo.model;
        platform = 'android';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? 'unknown';
        deviceName = iosInfo.model;
        platform = 'ios';
      } else {
        deviceId = 'unknown';
        deviceName = 'unknown';
        platform = 'unknown';
      }

      return Device(
        deviceId: deviceId,
        deviceName: deviceName,
        platform: platform,
      );
    } on Failure {
      return Device(
        deviceId: 'unknown',
        deviceName: 'unknown',
        platform: 'unknown',
      );
    }
  }
}
