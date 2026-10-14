import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_account_bloc/auth_account_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/business_logic/core_cubit/core_cubit.dart';
import 'package:sahaba_mobile/business_logic/kisah_bloc/kisah_bloc.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/news_bloc/news_bloc.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_cubit.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_cubit.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/domains/news/news_response.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/routers/router_refresh_stream.dart';
import 'package:sahaba_mobile/presentation/screens/auth/auth_screen.dart';
import 'package:sahaba_mobile/presentation/screens/auth/greeting_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/calendar/calendar_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/chat/sahaba_ai_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/kisah/detail_kisah_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/kisah/kisah_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/news/detail_news_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/news/list_all_news_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/jadwal_sholat_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/qibla_screen/qibla_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/select_city_screen.dart';
import 'package:sahaba_mobile/presentation/screens/main_screen.dart';
import 'package:sahaba_mobile/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/detail_quran_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/history_collection_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/search_quran_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

final _refreshStream = RouterRefreshStream([
  sl<AuthAccountBloc>().stream,
  sl<CoreCubit>().stream,
]);
final GoRouter router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  refreshListenable: _refreshStream,
  initialLocation: RouterPath.rootPath,
  redirect: (context, state) {
    final authState = sl<AuthAccountBloc>().state;

    final isAuthUser = authState.maybeWhen(
      authenticatedUser: (authData, [aiData]) => true,
      orElse: () => false,
    );

    final isAuthGuest = authState.maybeWhen(
      authenticatedGuest: (_) => true,
      orElse: () => false,
    );

    final isOnBoarded = sl<CoreCubit>().state.isBoarding;
    final location = state.matchedLocation;

    // 1. Belum onboarding — paksa ke onboarding
    if (!isOnBoarded) {
      if (location == RouterPath.onboardingPath) return null;
      return RouterPath.onboardingPath;
    }

    final isPublic =
        location.startsWith(RouterPath.loginPath) ||
        location.startsWith(RouterPath.registerPath) ||
        location.startsWith(RouterPath.greetingPath);

    // 2. Belum login (unauthenticated) — hanya boleh akses area publik
    if (!isAuthUser && !isAuthGuest) {
      if (isPublic) return null;
      return RouterPath.loginPath;
    }

    // 3. Sudah login sebagai guest atau user — cegah akses kembali ke onboarding/auth/greeting/root
    final isAuthArea =
        location == RouterPath.onboardingPath ||
        location == RouterPath.rootPath ||
        location.startsWith(RouterPath.loginPath) ||
        location.startsWith(RouterPath.registerPath) ||
        location.startsWith(RouterPath.greetingPath);
    if (isAuthArea) return RouterPath.mainPath;

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
      path: RouterPath.onboardingPath,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: RouterPath.loginPath,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<AuthBloc>(),
        child: const AuthScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.registerPath,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<AuthBloc>(),
        child: const AuthScreen(initialMode: AuthMode.register),
      ),
    ),
    GoRoute(
      path: RouterPath.greetingPath,
      builder: (context, state) => const GreetingScreen(),
    ),
    // GoRoute(
    //   path: RouterPath.forgotPasswordPath,
    //   builder: (context, state) => const Forg(),
    // ),
    GoRoute(
      // Main path
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
        // GoRoute(
        //   path: RouterPath.productDetailPath,
        //   builder: (context, state) {
        //     final extra = state.extra as Map<String, dynamic>?;
        //     return DetailProductScreen(
        //       id: extra?['id'] as int? ?? 0,
        //       ad: extra?['ad'] as ProductData?,
        //       isAds: extra?['isAds'] as bool? ?? false,
        //     );
        //   },
        // ),
        GoRoute(
          path: RouterPath.listAllNewsPath,
          builder: (context, state) => const ListAllNewsScreen(),
          routes: [
            // Detail News
            GoRoute(
              path: RouterPath.detailNewsPath,
              builder: (context, state) {
                final extra = state.extra;
                final newsData = extra is NewsData ? extra : null;
                return BlocProvider.value(
                  value: sl<NewsBloc>(),
                  child: DetailNewsScreen(
                    newsId: newsData?.id ?? 0,
                    initialData: newsData,
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: RouterPath.qiblaPath,
          builder: (context, state) => const QiblaScreen(),
        ),
        // GoRoute(
        //   path: RouterPath.sahabaAiPath,
        //   builder: (context, state) => BlocProvider(
        //     create: (_) => sl<AiChatBloc>(),
        //     child: const SahabaAiScreen(),
        //   ),
        // ),
        GoRoute(
          path: RouterPath.kisahPath,
          builder: (context, state) => BlocProvider(
            create: (_) =>
                sl<KisahBloc>()..add(const KisahEvent.fetchKisahList()),
            child: const KisahScreen(),
          ),
          routes: [
            GoRoute(
              path: RouterPath.detailKisahPath,
              builder: (context, state) {
                final extra = state.extra;
                if (extra is KisahData) {
                  return DetailKisahScreen(kisahId: extra.id ?? 0);
                }
                return const DetailKisahScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: RouterPath.calendarPath,
          builder: (context, state) => const CalendarScreen(),
        ),
        // GoRoute(
        //   path: RouterPath.productHalalPath,
        //   builder: (context, state) => const ProductHalalScreen(),
        //   routes: [
        //     GoRoute(
        //       path: RouterPath.productDetailPath,
        //       builder: (context, state) {
        //         final extra = state.extra as Map<String, dynamic>?;
        //         return DetailProductScreen(
        //           id: extra?['id'] as int? ?? 0,
        //           ad: extra?['ad'] as ProductData?,
        //           isAds: extra?['isAds'] as bool? ?? false,
        //         );
        //       },
        //     ),
        //     GoRoute(
        //       path: RouterPath.historyProductPath,
        //       builder: (context, state) {
        //         final extra = state.extra as Map<String, dynamic>?;
        //         return HistoryProductDetailScreen(
        //           id: extra?['id'] as int? ?? 0,
        //           lat: extra?['lat'] as double?,
        //           long: extra?['long'] as double?,
        //           eventTime: extra?['eventTime'] as String?,
        //         );
        //       },
        //     ),

        //     GoRoute(
        //       path: RouterPath.cameraPath,
        //       builder: (context, state) => BlocProvider.value(
        //         value: sl<LocationBloc>(),
        //         child: const CameraScanScreen(),
        //       ),
        //       routes: [
        //         GoRoute(
        //           path: RouterPath.productDetailPath,
        //           builder: (context, state) {
        //             final extra = state.extra as Map<String, dynamic>?;
        //             return DetailProductScreen(
        //               id: extra?['id'] as int? ?? 0,
        //               ad: extra?['ad'] as ProductData?,
        //               isAds: extra?['isAds'] as bool? ?? false,
        //             );
        //           },
        //         ),
        //       ],
        //     ),

        //     //  Global Search Product Halal
        //     GoRoute(
        //       path: RouterPath.searchProductHalalPath,
        //       builder: (context, state) => const SearchProductHalalScreen(),
        //     ),

        //     GoRoute(
        //       path: RouterPath.listDetailBrandByProductPath,
        //       builder: (context, state) {
        //         final extra = state.extra as Map<String, dynamic>?;
        //         return ListDetailBrandByProductScreen(
        //           id: extra?['id'] as int? ?? 0,
        //           brandId: extra?['brand_id'] as int?,
        //           partnerName: extra?['partner_name'] as String?,
        //           imageUrl: extra?['image'] as String?,
        //         );
        //       },
        //       routes: [
        //         GoRoute(
        //           path: RouterPath.productDetailPath,
        //           builder: (context, state) {
        //             final extra = state.extra as Map<String, dynamic>?;
        //             return DetailProductScreen(
        //               id: extra?['id'] as int? ?? 0,
        //             );
        //           },
        //         ),
        //       ],
        //     ),

        //     // Category Product
        //     GoRoute(
        //       path: RouterPath.categoryProductPath,
        //       builder: (context, state) {
        //         final extra = state.extra as Map<String, dynamic>?;
        //         return CategoryProductScreen(
        //           key: state.pageKey,
        //           id: extra?['id'] as int? ?? 0,
        //           name: extra?['name'] as String? ?? '',
        //         );
        //       },

        //       routes: [
        //         GoRoute(
        //           path: RouterPath.productDetailPath,
        //           builder: (context, state) {
        //             final extra = state.extra as Map<String, dynamic>?;
        //             return DetailProductScreen(
        //               id: extra?['id'] as int? ?? 0,
        //               ad: extra?['ad'] as ProductData?,
        //               isAds: extra?['isAds'] as bool? ?? false,
        //             );
        //           },
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        GoRoute(
          path: RouterPath.jadwalSholatPath,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) {
                  final cubit = sl<LocationCubit>();
                  unawaited(cubit.loadSavedCity());
                  return cubit;
                },
              ),
              BlocProvider.value(value: sl<StreakCubit>()),
            ],
            child: const JadwalSholatScreen(),
          ),
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
          path: RouterPath.sahabaAiPath,
          builder: (context, state) => BlocProvider(
            create: (_) => sl<AiChatBloc>(),
            child: const SahabaAiScreen(),
          ),
        ),

        // Camera
        // GoRoute(
        //   path: RouterPath.cameraPath,
        //   builder: (context, state) => BlocProvider.value(
        //     value: sl<LocationBloc>(),
        //     child: const CameraScanScreen(),
        //   ),
        //   routes: [
        //     GoRoute(
        //       path: RouterPath.productDetailPath,
        //       builder: (context, state) {
        //         final extra = state.extra as Map<String, dynamic>?;
        //         return DetailProductScreen(
        //           id: extra?['id'] as int? ?? 0,
        //           ad: extra?['ad'] as ProductData?,
        //           isAds: extra?['isAds'] as bool? ?? false,
        //         );
        //       },
        //     ),
        //   ],
        // ),
        // Detail News
        GoRoute(
          path: RouterPath.detailNewsPath,
          builder: (context, state) {
            final extra = state.extra;
            final newsData = extra is NewsData ? extra : null;
            return BlocProvider.value(
              value: sl<NewsBloc>(),
              child: DetailNewsScreen(
                newsId: newsData?.id ?? 0,
                initialData: newsData,
              ),
            );
          },
        ),

        // Detail Quran
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

        // History Collection (Bookmark & Catatan)
        GoRoute(
          path: '${RouterPath.quranPath}/${RouterPath.historyCollectionPath}',
          builder: (context, state) {
            return const HistoryCollectionScreen();
          },
        ),
      ],
    ),
  ],
);
