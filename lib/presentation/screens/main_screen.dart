import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_state.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_cubit.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/home/home_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/jadwal_sholat_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/quran_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/bottom_navigation_bar.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<LocationCubit>()..loadSavedCity(),
        ),
        BlocProvider(
          create: (_) => sl<PrayerScheduleCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<StreakCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<QuranBloc>()
            ..add(const QuranEvent.loadSurahs())
            ..add(const QuranEvent.loadJuz()),
        ),
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
    HomeScreen(onPrayerScheduleTap: () => _onTabChanged(1)),
    const JadwalSholatScreen(),
    const QuranScreen(),
  ];

  void _onTabChanged(int index) {
    unawaited(HapticFeedback.selectionClick());
    setState(() => _selectedIndex = index);
  }

  void _onLocationChanged(
    BuildContext context,
    LocationState state,
  ) {
    if (state is LocationLoaded) {
      final cityId = state.city.id;
      if (cityId != null) {
        final now = DateTime.now();
        context.read<PrayerScheduleCubit>().loadSchedule(cityId, now);
        context.read<StreakCubit>().loadStreak(now);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: _onLocationChanged,
      child: Scaffold(
        backgroundColor: ColorPalette.scaffoldBackground,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: BottomNavigationItemsBar(
            initialIndex: _selectedIndex,
            items: const [
              NavBarItem(
                defaultSvgPath: AppIcons.home9Line,
                selectedSvgPath: AppIcons.home9Line,
                title: 'Beranda',
              ),
              NavBarItem(
                defaultSvgPath: AppIcons.timeLine,
                selectedSvgPath: AppIcons.timeLine,
                title: 'Jadwal Solat',
              ),
              NavBarItem(
                defaultSvgPath: AppIcons.bookOpenLine,
                selectedSvgPath: AppIcons.bookOpenLine,
                title: "Qur'an",
              ),
            ],
            onChanged: _onTabChanged,
          ),
        ),
      ),
    );
  }
}
