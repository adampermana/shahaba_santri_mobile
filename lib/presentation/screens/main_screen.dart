import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/product_bloc/product_bloc.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_cubit.dart';
import 'package:sahaba_mobile/domains/ads/ads_response.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/home/home_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/quran_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/bottom_navigation_bar.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_dialogs_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final cubit = sl<LocationCubit>();
            unawaited(cubit.loadSavedCity());
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) => sl<LocationBloc>()
            ..add(const LocationEvent.getCurrentLocation(isGetPosition: true)),
        ),
        BlocProvider(
          create: (_) => sl<PrayerScheduleCubit>(),
        ),
        BlocProvider(
          create: (_) {
            final cubit = sl<StreakCubit>();
            unawaited(cubit.loadStreak(DateTime.now()));
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) => sl<QuranBloc>()
            ..add(const QuranEvent.loadSurahs())
            ..add(const QuranEvent.loadJuz()),
        ),
        BlocProvider.value(
          value: (() {
            final cubit = sl<LastReadCubit>();
            unawaited(cubit.load());
            return cubit;
          })(),
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
  static const Duration _exitConfirmationWindow = Duration(seconds: 2);

  int _selectedIndex = 0;
  DateTime? _lastBackPressedAt;
  AdResponseData? _pendingSplashAd;
  bool _isLocationAlertShowing = false;
  bool _isSplashDialogShowing = false;

  List<Widget> get _screens => [
    HomeScreen(isActive: _selectedIndex == 0),
    const SizedBox.shrink(),
    const QuranScreen(),
  ];

  void _onTabChanged(int index) {
    unawaited(HapticFeedback.selectionClick());
    setState(() => _selectedIndex = index);
  }

  void _onRootBackPressed() {
    final now = DateTime.now();
    final shouldExit =
        _lastBackPressedAt != null &&
        now.difference(_lastBackPressedAt!) <= _exitConfirmationWindow;

    final messenger = ScaffoldMessenger.of(context);

    if (shouldExit) {
      messenger.hideCurrentSnackBar();
      unawaited(SystemNavigator.pop());
      return;
    }

    _lastBackPressedAt = now;

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(_buildExitSnackBar(context));
  }

  Future<void> _refreshLocation(BuildContext context) async {
    final locationBloc = context.read<LocationBloc>();
    final result = locationBloc.stream.firstWhere((state) => !state.isLoading);

    locationBloc.add(
      const LocationEvent.getCurrentLocation(isGetPosition: true),
    );

    await result;
  }

  Future<void> _maybeShowSplashAd(
    BuildContext context, {
    bool ignoreLocationAlert = false,
  }) async {
    if (_pendingSplashAd == null ||
        _isSplashDialogShowing ||
        !context.mounted) {
      return;
    }

    final locationState = context.read<LocationBloc>().state;

    if (locationState.isLoading || _isLocationAlertShowing) {
      return;
    }

    if (!ignoreLocationAlert && locationState.alert != null) {
      return;
    }

    final addSplash = _pendingSplashAd!;
    _pendingSplashAd = null;
    _isSplashDialogShowing = true;

    try {
      await _showSplashAdDialog(context, addSplash);
    } finally {
      _isSplashDialogShowing = false;
    }
  }

  Map<String, double>? _splashAdCoordinates(BuildContext context) {
    final locationState = context.read<LocationBloc>().state;
    final lat = locationState.latitude;
    final long = locationState.longitude;

    if (lat == 0.0 && long == 0.0) {
      return null;
    }

    return {'latitude': lat, 'longitude': long};
  }

  Future<void> _showSplashAdDialog(
    BuildContext context,
    AdResponseData addSplash,
  ) async {
    final coordinates = _splashAdCoordinates(context);
    final productBloc = context.read<ProductBloc>();

    if (coordinates != null) {
      productBloc.add(
        ProductEvent.logAd(
          addSplash.productId ?? 0,
          addSplash.campaignId ?? 0,
          addSplash.id ?? 0,
          coordinates,
          'Impression',
        ),
      );
    }

    await showDialog<void>(
      context: context,
      builder: (_) => PopScope(
        canPop: false,
        child: BlocProvider.value(
          value: productBloc,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: GestureDetector(
                      onTap: () async {
                        final messenger = ScaffoldMessenger.of(context);
                        final navigator = Navigator.of(context);

                        try {
                          final clickCoordinates = _splashAdCoordinates(
                            context,
                          );

                          if (clickCoordinates != null) {
                            productBloc.add(
                              ProductEvent.logAd(
                                addSplash.productId ?? 0,
                                addSplash.campaignId ?? 0,
                                addSplash.id ?? 0,
                                clickCoordinates,
                                'Click',
                              ),
                            );
                          }

                          switch (addSplash.type?.toUpperCase()) {
                            case 'PRODUCT':
                              final productId = addSplash.productId;
                              if (productId == null || productId <= 0) {
                                navigator.pop();
                                return;
                              }

                              final currentLocation = GoRouterState.of(
                                context,
                              ).uri.toString();
                              navigator.pop();
                              if (!mounted) return;
                              await context.push(
                                '$currentLocation/'
                                '${RouterPath.productHalalPath}/'
                                '${RouterPath.productDetailPath}',
                                extra: {'id': productId, 'isAds': true},
                              );
                              return;
                            case 'URL':
                              final target = addSplash.target?.trim();
                              if (target == null || target.isEmpty) {
                                navigator.pop();
                                return;
                              }

                              final uri = Uri.tryParse(target);
                              if (uri == null) {
                                navigator.pop();
                                return;
                              }

                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                              navigator.pop();
                              return;
                          }
                        } on Exception catch (e) {
                          messenger.showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      },
                      child: Image.network(
                        addSplash.image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.white, width: 4),
                      ),
                    ),
                    child: CacheImageOrSvg(
                      source: 'assets/svg/close-circle-line.svg',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SnackBar _buildExitSnackBar(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white.withValues(alpha: 0.08),
      elevation: 0,
      padding: EdgeInsets.zero,
      duration: _exitConfirmationWindow,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      content: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Color(0x12000000),
              offset: Offset(0, 6),
              blurRadius: 6,
            ),
            BoxShadow(
              color: Color(0x0A000000),
              offset: Offset(0, 14),
              blurRadius: 9,
            ),
            BoxShadow(
              color: Color(0x03000000),
              offset: Offset(0, 26),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              const Positioned.fill(
                child: ColoredBox(color: ColorPalette.scaffoldBackground),
              ),
              const Positioned.fill(
                child: ColoredBox(color: ColorPalette.surfaceTranslucent),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Tekan sekali lagi untuk keluar dari aplikasi',
                  style: textTheme.bodyLarge?.copyWith(
                    color: ColorPalette.kWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
      child: PopScope<void>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          _onRootBackPressed();
        },
        child: Scaffold(
          backgroundColor: ColorPalette.scaffoldBackground,

          // Konten boleh terlihat di belakang bagian atas navbar.
          extendBody: true,

          body: MultiBlocListener(
            listeners: [
              // Location Alert Dialog
              BlocListener<LocationBloc, LocationState>(
                listenWhen: (previous, current) =>
                    previous.alert != current.alert ||
                    previous.isLoading != current.isLoading ||
                    previous.latitude != current.latitude ||
                    previous.longitude != current.longitude,
                listener: (context, state) async {
                  if (state.alert != null) {
                    if (_isLocationAlertShowing) return;

                    _isLocationAlertShowing = true;

                    await showAlertDialog(
                      context,
                      alert: state.alert,
                      titleColor: ColorPalette.kWhite,
                      messageColor: ColorPalette.kWhite,
                      iconColor: const Color(0xffB39164),
                      backgroundColor: ColorPalette.scaffoldBackground,
                      title: state.titleError,
                      message: state.messageError,
                      onRefresh: () => _refreshLocation(context),
                    );

                    _isLocationAlertShowing = false;
                    if (!context.mounted) return;
                    await _maybeShowSplashAd(
                      context,
                      ignoreLocationAlert: true,
                    );
                    return;
                  }

                  await _maybeShowSplashAd(context);
                },
              ),
              // Add Splash Ad Dialog
              BlocListener<ProductBloc, ProductState>(
                listenWhen: (previous, current) =>
                    previous.addSplash != current.addSplash &&
                    previous.addSplash == null,
                listener: (context, state) async {
                  final addSplash = state.addSplash;

                  if (addSplash == null) return;

                  _pendingSplashAd = addSplash;
                  await _maybeShowSplashAd(context);
                },
              ),
            ],
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
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
                title: 'Pindai Produk',
                isFeatured: true,
              ),
              NavBarItem(
                defaultSvgPath: AppIcons.quranUnselected,
                selectedSvgPath: AppIcons.quranSelected,
                title: "Qur'an",
              ),
            ],
            onChanged: (index) async {
              if (index == 1) {
                // Featured item (Pindai): push route only, don't change index
                await context.push('$currentLocation/${RouterPath.cameraPath}');
              } else {
                _onTabChanged(index);
              }
            },
          ),
        ),
      ),
    );
  }
}
