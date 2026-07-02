import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/infrastructure/core/api/hayuwe_http_overrides.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
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
      // await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );
      // Initialize Google Sign-In (singleton — harus dipanggil tepat sekali)
      // serverClientId: Web Client ID (type 3) dari Firebase Console
      // await GoogleSignIn.instance.initialize(
      //   serverClientId: Env.googleServerClientId,
      // );

      // Inject classes & dependencies
      await initApp();

      // Setup BLoC observer for debugging
      if (kDebugMode) Bloc.observer = const AppBlocObserver();

      // ========== NOTIFICATION SERVICES SETUP ==========
      // Initialize Local Notifications Service
      // final localNotificationsService = LocalNotificationsService.instance();
      // await localNotificationsService.init();

      // // Initialize Firebase Messaging Service
      // final firebaseMessagingService = FirebaseMessagingService.instance();
      // await firebaseMessagingService.init(
      //   localNotificationsService: localNotificationsService,
      // );

      debugPrint('Notification services initialized successfully');
      // =================================================

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
