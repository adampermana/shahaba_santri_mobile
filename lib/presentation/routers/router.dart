import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_cubit.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/enum/enum_widget.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/home/calendar/calendar_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/qibla_screen/qibla_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/select_city_screen.dart';
import 'package:sahaba_mobile/presentation/screens/main_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/detail_quran_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/search_quran_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

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
            SubmitButtonStylesWidget(
              style: SubmitButtonStyle.elevated,
              textButton: 'Kembali ke Home',
              onPressed: () => context.go(RouterPath.mainPath),
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
          builder: (context, state) => const CalendarScreen(),
        ),
        GoRoute(
          path: '${RouterPath.quranPath}/${RouterPath.detailQuranPath}',
          builder: (context, state) {
            final args = state.extra;
            if (args is QuranDetailArgs) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) {
                      final cubit = sl<QuranDetailCubit>();
                      unawaited(cubit.load(args));
                      return cubit;
                    },
                  ),
                  BlocProvider.value(value: sl<LastReadCubit>()),
                ],
                child: DetailQuranScreen(args: args),
              );
            }

            return const DetailQuranScreen();
          },
        ),
        GoRoute(
          path: '${RouterPath.quranPath}/${RouterPath.searchQuranPath}',
          builder: (context, state) {
            final args = state.extra;
            if (args is SearchQuranArgs) {
              return SearchQuranScreen(args: args);
            }

            return const SearchQuranScreen(
              args: SearchQuranArgs(surahs: [], juzList: []),
            );
          },
        ),
      ],
    ),
  ],
);
