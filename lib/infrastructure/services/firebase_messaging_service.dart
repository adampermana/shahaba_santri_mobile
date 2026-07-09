import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'package:sahaba_mobile/infrastructure/services/local_notifications_service.dart';

class FirebaseMessagingService {
  factory FirebaseMessagingService.instance() => _instance;
  FirebaseMessagingService._internal();

  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();

  static const int _maxApnsTokenAttempts = 6;
  static const Duration _apnsTokenRetryDelay = Duration(milliseconds: 500);

  LocalNotificationsService? _localNotificationsService;
  StreamSubscription<RemoteMessage>? _onMessageSubscription;
  StreamSubscription<RemoteMessage>? _onMessageOpenedAppSubscription;
  StreamSubscription<String>? _onTokenRefreshSubscription;
  bool _isInitialized = false;

  Future<void> init({
    required LocalNotificationsService localNotificationsService,
  }) async {
    _localNotificationsService = localNotificationsService;
    await _localNotificationsService?.init();

    if (_isInitialized) {
      debugPrint('FirebaseMessagingService already initialized, skipping...');
      return;
    }

    await _requestPermission();
    await _handlePushNotificationsToken();
    await _setupMessageHandlers();

    _isInitialized = true;
  }

  Future<String?> getFcmToken() async {
    if (Platform.isIOS) {
      final apnsToken = await _getApnsTokenWithRetry();
      if (apnsToken == null || apnsToken.isEmpty) {
        debugPrint('APNs token unavailable. Skipping FCM token fetch for now.');
        return null;
      }

      debugPrint('APNs Token: $apnsToken');
    }

    try {
      final token = await FirebaseMessaging.instance.getToken();
      debugPrint('FCM Token: $token');
      return token;
    } on Exception catch (e) {
      debugPrint('Error getting FCM token: $e');
      return null;
    }
  }

  Future<void> _setupMessageHandlers() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      debugPrint('App opened from terminated state via notification');
      _handleMessageTap(initialMessage);
    }

    _onMessageOpenedAppSubscription ??= FirebaseMessaging.onMessageOpenedApp
        .listen((message) {
          debugPrint('App opened from background via notification');
          _handleMessageTap(message);
        });

    _onMessageSubscription ??= FirebaseMessaging.onMessage.listen((
      message,
    ) {
      debugPrint('Foreground FCM message received');
      debugPrint('========== FCM MESSAGE DEBUG ==========');
      debugPrint('Message ID: ${message.messageId}');
      debugPrint('Notification Title: ${message.notification?.title}');
      debugPrint('Notification Body: ${message.notification?.body}');
      debugPrint('Data Payload: ${message.data}');
      debugPrint('Data Keys: ${message.data.keys.toList()}');
      debugPrint('=====================================');

      final title =
          message.notification?.title ?? message.data['title'] as String?;
      final body =
          message.notification?.body ?? message.data['body'] as String?;
      final payload = jsonEncode(message.data);

      unawaited(
        _localNotificationsService?.showNotification(
              message.messageId.hashCode,
              title,
              body,
              payload,
            ) ??
            Future<void>.value(),
      );
    });
  }

  void _handleMessageTap(RemoteMessage message) {
    try {
      debugPrint('FCM notification tapped with data: ${message.data}');
    } on Exception catch (e) {
      debugPrint('Error handling FCM message tap: $e');
    }
  }

  Future<String?> _getApnsTokenWithRetry() async {
    for (var attempt = 1; attempt <= _maxApnsTokenAttempts; attempt++) {
      try {
        final token = await FirebaseMessaging.instance.getAPNSToken();
        if (token != null && token.isNotEmpty) {
          return token;
        }
      } on Exception catch (e) {
        debugPrint('APNs token attempt $attempt failed: $e');
      }

      if (attempt < _maxApnsTokenAttempts) {
        await Future<void>.delayed(_apnsTokenRetryDelay);
      }
    }

    debugPrint(
      'APNs token not available after $_maxApnsTokenAttempts attempts.',
    );
    return null;
  }

  Future<void> _handlePushNotificationsToken() async {
    final token = await getFcmToken();

    if (token != null) {
      debugPrint('Device registered for push notifications');
    } else {
      debugPrint('Failed to get FCM token');
    }

    if (_onTokenRefreshSubscription == null) {
      _onTokenRefreshSubscription = FirebaseMessaging.instance.onTokenRefresh
          .listen((fcmToken) {
            debugPrint('FCM token refreshed: $fcmToken');
          });
      _onTokenRefreshSubscription?.onError((Object e) {
        debugPrint('Error refreshing FCM token: $e');
      });
    }
  }

  Future<void> _requestPermission() async {
    final result = await FirebaseMessaging.instance.requestPermission();

    debugPrint('Notification permission: ${result.authorizationStatus}');

    if (result.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted notification permission');
    } else if (result.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint('User granted provisional notification permission');
    } else {
      debugPrint('User denied notification permission');
    }

    if (Platform.isIOS) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }
}
