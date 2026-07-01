import 'dart:async';

import 'package:flutter/material.dart';

/* Customized refresh stream for router to notify if there is any update data
that might occurs routes. */

class RouterRefreshStream extends ChangeNotifier {
  RouterRefreshStream(List<Stream<dynamic>> streams) {
    for (final stream in streams) {
      // Hold stream subscriptions with handle onto an array
      _subscriptions.add(
        stream.asBroadcastStream().listen((dynamic _) => notifyListeners()),
      );
    }
  }

  final List<StreamSubscription<dynamic>> _subscriptions = [];

  @override
  Future<void> dispose() async {
    for (final subs in _subscriptions) {
      // Stop stream subscriptions on each streams on dispose
      await subs.cancel();
    }
    super.dispose();
  }
}
