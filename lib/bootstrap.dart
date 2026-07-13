import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/firebase_options.dart';
import 'package:sahaba_mobile/infrastructure/core/api/hayuwe_http_overrides.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/services/adzan_service.dart';
import 'package:sahaba_mobile/infrastructure/services/firebase_messaging_service.dart';
import 'package:sahaba_mobile/infrastructure/services/local_notifications_service.dart';
import 'package:sahaba_mobile/infrastructure/services/native_navigation_service.dart';
import 'package:sahaba_mobile/injector.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// Background message handler for Firebase Cloud Messaging
/// This runs in a separate isolate when app is terminated/background
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize Firebase in background isolate
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  debugPrint('Background FCM message received: ${message.messageId}');
  debugPrint('Message data: ${message.data}');

  // Initialize LocalNotificationsService in background isolate
  final localNotif = LocalNotificationsService.instance();
  await localNotif.init();

  // Extract title and body
  final title = message.notification?.title;
  final body = message.notification?.body;

  // Show notification
  await localNotif.showNotification(
    message.messageId.hashCode,
    title,
    body,
    jsonEncode(message.data),
  );
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  try {
    await HttpOverrides.runWithHttpOverrides(() async {
      // Ensure flutter binding has been initialized
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize environment configuration
      // await Env.init(flavor);

      // Setup Firebase Messaging background handler
      // FirebaseMessaging.onBackgroundMessage(
      //   firebaseMessagingBackgroundHandler,
      // );

      // Initialize Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Initialize Google Sign-In (singleton — harus dipanggil tepat sekali)
      // serverClientId: Web Client ID (type 3) dari Firebase Console
      // await GoogleSignIn.instance.initialize(
      //   serverClientId: Env.googleServerClientId,
      // );

      // Inject classes & dependencies
      await initApp();
      await Alarm.init();
      await AdzanService.instance().init(sl());
      await NativeNavigationService.init();

      // Setup BLoC observer for debugging
      if (kDebugMode) Bloc.observer = const AppBlocObserver();

      // ========== NOTIFICATION SERVICES SETUP ==========
      // Initialize Local Notifications Service
      final localNotificationsService = LocalNotificationsService.instance();
      await localNotificationsService.init();

      // Initialize Firebase Messaging Service
      final firebaseMessagingService = FirebaseMessagingService.instance();
      await firebaseMessagingService.init(
        localNotificationsService: localNotificationsService,
      );

      debugPrint('Notification services initialized successfully');

      // Build and run the app
      final app = await builder();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      runApp(app);
      // runApp(
      //   kDebugMode ? DevicePreview(builder: (_) => app) : app,
      // );

      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };
    }, SahabaHttpOvverides());
  } on Failure catch (e, stackTrace) {
    debugPrint('Error during bootstrap: $e, $stackTrace');

    // if (kReleaseMode) {
    //   await FirebaseCrashlytics.instance.recordError(
    //     e,
    //     stackTrace,
    //     fatal: true,
    //   );
    // }
  } finally {
    debugPrint('\x1B[32m');
    debugPrint('┌=======================================');
    debugPrint('|    🎉 WELCOME TO Sahaba 🎉    ');
    debugPrint('├=======================================');
    debugPrint('├ ✅ Bootstrap completed successfully! ');
    debugPrint('├ ✅ App is running...                 ');
    debugPrint('└=======================================');
    debugPrint('\x1B[0m');
  }
}
