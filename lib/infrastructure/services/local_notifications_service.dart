import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  //Factory constructor to return singleton instance
  factory LocalNotificationsService.instance() => _instance;
  LocalNotificationsService._internal();

  //Singleton instance
  static final LocalNotificationsService _instance =
      LocalNotificationsService._internal();

  //Flag to track initialization status
  bool _isInitialized = false;

  //Main plugin instance for handling notifications
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  //Android-specific initialization settings using app launcher icon
  final _androidInitializationSettings = const AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  // iOS permission requests are handled by FirebaseMessagingService.
  final _iosInitializationSettings = const DarwinInitializationSettings(
    requestAlertPermission: false,
    requestSoundPermission: false,
    requestBadgePermission: false,
  );

  //Android notification channel configuration
  final _androidChannel = const AndroidNotificationChannel(
    'channel_id',
    'Channel name',
    description: 'Android push notification channel',
    importance: Importance.high,
  );

  Future<void> init() async {
    // Check if already initialized to prevent redundant setup
    if (_isInitialized) {
      debugPrint('LocalNotificationsService already initialized, skipping...');
      return;
    }

    // Create plugin instance
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Combine platform-specific settings
    final initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
      iOS: _iosInitializationSettings,
    );

    // Initialize plugin with settings and callback for notification taps
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create Android notification channel
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidChannel);

    // Mark as initialized
    _isInitialized = true;
    debugPrint('===LocalNotificationsService initialized successfully');
  }

  /// Handle notification tap - navigate to TugaskuScreen with incident_id
  Future<void> _onNotificationTapped(NotificationResponse response) async {
    try {
      final payload = response.payload;

      if (payload != null) {
        debugPrint('=== notification payload: $payload');
      }

      debugPrint('=== Notification has been tapped: ${response.payload}');
    } on Exception catch (e) {
      debugPrint('rror handling notification tap: $e');
    }
  }

  /// Show a local notification with the given title, body, and payload.
  ///   /// Show a local notification with the given title, body, and payload.
  Future<void> showNotification(
    int? id,
    String? title,
    String? body,
    String? payload,
  ) async {
    // Android-specific notification details
    final androidDetails = AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      importance: Importance.max,
      priority: Priority.high,
    );

    // iOS-specific notification details
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
      presentList: true,
    );

    // Combine platform-specific details
    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    return _flutterLocalNotificationsPlugin.show(
      id ?? 0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
