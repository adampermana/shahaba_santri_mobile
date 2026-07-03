import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/home/calendar_hijriah.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/qibla_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/select_city_screen.dart';
import 'package:sahaba_mobile/presentation/screens/main_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: RouterPath.rootPath,

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
      builder: (context, state) => MainProvider(
        key: state.pageKey,
      ),
      routes: [
        GoRoute(
          path: RouterPath.selectCityPath,
          builder: (context, state) {
            final locationCubit = state.extra;
            if (locationCubit is LocationCubit) {
              return BlocProvider.value(
                value: locationCubit,
                child: const SelectCityScreen(),
              );
            }

            return BlocProvider(
              create: (_) => sl<LocationCubit>(),
              child: const SelectCityScreen(),
            );
          },
        ),
        GoRoute(
          path: RouterPath.qiblaPath,
          builder: (context, state) => const QiblaScreen(),
        ),
        GoRoute(
          path: RouterPath.calendarPath,
          builder: (context, state) => const CalendarHijriahScreen(),
        ),
      ],
    ),
  ],
);
