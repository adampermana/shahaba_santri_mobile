import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/home/home_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/jadwal_sholat_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/quran_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/bottom_navigation_bar.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MainScreen();
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen();

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    JadwalSholatScreen(),
    QuranScreen(),
  ];

  void _onTabChanged(int index) {
    unawaited(HapticFeedback.selectionClick());
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
