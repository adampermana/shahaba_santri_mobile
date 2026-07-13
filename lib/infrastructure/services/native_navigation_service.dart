import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sahaba_mobile/presentation/routers/router.dart';

class NativeNavigationService {
  const NativeNavigationService._();

  static const MethodChannel _channel = MethodChannel('sahaba/navigation');

  static Future<void> init() async {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'openRoute') {
        _openRoute(call.arguments);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final initialRoute = await _channel.invokeMethod<String>(
          'getInitialRoute',
        );
        _openRoute(initialRoute);
      } on Exception {
        // Native route handoff is Android-only; other platforms can ignore it.
      }
    });
  }

  static void _openRoute(Object? route) {
    if (route is! String) return;
    final target = route.trim();
    if (target.isEmpty) return;
    router.go(target);
  }
}
