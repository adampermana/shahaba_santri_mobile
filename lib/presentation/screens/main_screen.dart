import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/home/new_home_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/quran_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/bottom_navigation_bar.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key});

  @override
  Widget build(BuildContext context) {
    // final lastReadCubit = sl<LastReadCubit>();
    // unawaited(lastReadCubit.load());

    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (_) => sl<LocationCubit>()..loadSavedCity(),
        // ),
        // BlocProvider(
        //   create: (_) => sl<PrayerScheduleCubit>(),
        // ),
        // BlocProvider(
        //   create: (_) => sl<StreakCubit>(),
        // ),
        BlocProvider(
          create: (_) => sl<QuranBloc>()
            ..add(const QuranEvent.loadSurahs())
            ..add(const QuranEvent.loadJuz()),
        ),
        BlocProvider.value(value: sl<LastReadCubit>()..load()),
      ],
      child: const _MainScreen(),
    );
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen();

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  int _selectedIndex = 0;

  List<Widget> get _screens => [
    // NewHomeScreen(onPrayerScheduleTap: () => _onTabChanged(1)),
    const NewHomeScreen(),
    const SizedBox.shrink(), // placeholder jadwal sholat (featured item)
    const QuranScreen(),
  ];

  void _onTabChanged(int index) {
    unawaited(HapticFeedback.selectionClick());
    setState(() => _selectedIndex = index);
  }

  // void _onLocationChanged(
  //   BuildContext context,
  //   LocationState state,
  // ) {
  //   if (state is LocationLoaded) {
  //     final cityId = state.city.id;
  //     if (cityId != null) {
  //       final now = DateTime.now();
  //       context.read<PrayerScheduleCubit>().loadSchedule(cityId, now);
  //       context.read<StreakCubit>().loadStreak(now);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    const navigationColor = Color(0xFF111A30);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: navigationColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: navigationColor,
        systemNavigationBarContrastEnforced: false,
      ),
      child: Scaffold(
        backgroundColor: ColorPalette.scaffoldBackground,

        // Konten boleh terlihat di belakang bagian atas navbar.
        extendBody: true,

        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),

        // Jangan dibungkus SafeArea lagi.
        bottomNavigationBar: BottomNavigationItemsBar(
          initialIndex: _selectedIndex,
          backgroundColor: navigationColor,
          featuredColor: ColorPalette.primaryColor,
          items: const [
            NavBarItem(
              defaultSvgPath: AppIcons.homeUnselected,
              selectedSvgPath: AppIcons.homeSelected,
              title: 'Beranda',
            ),
            NavBarItem(
              defaultSvgPath: AppIcons.searchScan,
              selectedSvgPath: AppIcons.searchScan,
              title: 'Jadwal Sholat',
              isFeatured: true,
            ),
            NavBarItem(
              defaultSvgPath: AppIcons.quranUnselected,
              selectedSvgPath: AppIcons.quranSelected,
              title: "Qur'an",
            ),
          ],
          onChanged: (index) {
            if (index == 1) {
              // Featured item: push via router
              context.push('$currentLocation/${RouterPath.cameraPath}');
            } else {
              _onTabChanged(index);
            }
          },
        ),
      ),
    );
  }
}
