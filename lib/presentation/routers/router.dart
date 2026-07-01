import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/main_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: RouterPath.rootPath,

  // refreshListenable: RouterRefreshStream([
  //   sl<AuthAccountBloc>().stream,
  // ]),
  redirect: (context, state) {
    final location = state.matchedLocation;

    if (location == RouterPath.rootPath) {
      return RouterPath.mainPath;
    }

    return null;
  },

  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Tidak Ditemukan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Halaman yang Anda cari tidak tersedia'),
            ElevatedButton(
              onPressed: () => context.go(RouterPath.mainPath),
              child: const Text('Kembali ke Home'),
            ),
          ],
        ),
      ),
    );
  },
  routes: [
    GoRoute(
      path: RouterPath.mainPath,
      builder: (context, state) => MainScreen(
        key: state.pageKey,
      ),
    ),
  ],
);
