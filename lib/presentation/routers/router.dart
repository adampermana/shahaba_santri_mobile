import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:sahaba_mobile/business_logic/kisah_bloc/kisah_bloc.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/news_bloc/news_bloc.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_cubit.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_cubit.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/domains/news/news_response.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/camera_screen/camera_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/calendar/calendar_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/chat/sahaba_ai_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/kisah/detail_kisah_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/kisah/kisah_screen.dart';
import 'package:sahaba_mobile/presentation/screens/home/news/detail_news_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/jadwal_sholat_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/qibla_screen/qibla_screen.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/select_city_screen.dart';
import 'package:sahaba_mobile/presentation/screens/main_screen.dart';
import 'package:sahaba_mobile/presentation/screens/product/category_product_screen.dart';
import 'package:sahaba_mobile/presentation/screens/product/detail_product_screen.dart';
import 'package:sahaba_mobile/presentation/screens/product/global_search_halal_screen.dart';
import 'package:sahaba_mobile/presentation/screens/product/history_product_detail_screen.dart';
import 'package:sahaba_mobile/presentation/screens/product/list_detail_brand_by_product_screen.dart';
import 'package:sahaba_mobile/presentation/screens/product/product_halal_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/detail_quran_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/list_all_news_screen.dart';
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
        GoRoute(
          path: RouterPath.productDetailPath,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            return DetailProductScreen(
              id: extra?['id'] as int? ?? 0,
              ad: extra?['ad'] as ProductData?,
              isAds: extra?['isAds'] as bool? ?? false,
            );
          },
        ),
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
        GoRoute(
          path: RouterPath.sahabaAiPath,
          builder: (context, state) => BlocProvider(
            create: (_) => sl<AiChatBloc>(),
            child: const SahabaAiScreen(),
          ),
        ),
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
        GoRoute(
          path: RouterPath.productHalalPath,
          builder: (context, state) => const ProductHalalScreen(),
          routes: [
            GoRoute(
              path: RouterPath.productDetailPath,
              builder: (context, state) {
                final extra = state.extra as Map<String, dynamic>?;
                return DetailProductScreen(
                  id: extra?['id'] as int? ?? 0,
                  ad: extra?['ad'] as ProductData?,
                  isAds: extra?['isAds'] as bool? ?? false,
                );
              },
            ),
            GoRoute(
              path: RouterPath.historyProductPath,
              builder: (context, state) {
                final extra = state.extra as Map<String, dynamic>?;
                return HistoryProductDetailScreen(
                  id: extra?['id'] as int? ?? 0,
                  lat: extra?['lat'] as double?,
                  long: extra?['long'] as double?,
                  eventTime: extra?['eventTime'] as String?,
                );
              },
            ),

            GoRoute(
              path: RouterPath.cameraPath,
              builder: (context, state) => BlocProvider.value(
                value: sl<LocationBloc>(),
                child: const CameraScanScreen(),
              ),
              routes: [
                GoRoute(
                  path: RouterPath.productDetailPath,
                  builder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;
                    return DetailProductScreen(
                      id: extra?['id'] as int? ?? 0,
                      ad: extra?['ad'] as ProductData?,
                      isAds: extra?['isAds'] as bool? ?? false,
                    );
                  },
                ),
              ],
            ),

            //  Global Search Product Halal
            GoRoute(
              path: RouterPath.searchProductHalalPath,
              builder: (context, state) => const SearchProductHalalScreen(),
            ),

            GoRoute(
              // todo:
              path: RouterPath.listDetailBrandByProductPath,
              builder: (context, state) {
                final extra = state.extra as Map<String, dynamic>?;
                return ListDetailBrandByProductScreen(
                  id: extra?['id'] as int? ?? 0,
                  brandId: extra?['brand_id'] as int?,
                  partnerName: extra?['partner_name'] as String?,
                  imageUrl: extra?['image'] as String?,
                );
              },
              routes: [
                GoRoute(
                  path: RouterPath.productDetailPath,
                  builder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;
                    return DetailProductScreen(
                      id: extra?['id'] as int? ?? 0,
                    );
                  },
                ),
              ],
            ),

            // Category Product
            GoRoute(
              path: RouterPath.categoryProductPath,
              builder: (context, state) {
                final extra = state.extra as Map<String, dynamic>?;
                return CategoryProductScreen(
                  key: state.pageKey,
                  id: extra?['id'] as int? ?? 0,
                  name: extra?['name'] as String? ?? '',
                );
              },

              routes: [
                GoRoute(
                  path: RouterPath.productDetailPath,
                  builder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;
                    return DetailProductScreen(
                      id: extra?['id'] as int? ?? 0,
                      ad: extra?['ad'] as ProductData?,
                      isAds: extra?['isAds'] as bool? ?? false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
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

        // Camera
        GoRoute(
          path: RouterPath.cameraPath,
          builder: (context, state) => BlocProvider.value(
            value: sl<LocationBloc>(),
            child: const CameraScanScreen(),
          ),
          routes: [
            GoRoute(
              path: RouterPath.productDetailPath,
              builder: (context, state) {
                final extra = state.extra as Map<String, dynamic>?;
                return DetailProductScreen(
                  id: extra?['id'] as int? ?? 0,
                  ad: extra?['ad'] as ProductData?,
                  isAds: extra?['isAds'] as bool? ?? false,
                );
              },
            ),
          ],
        ),
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
      ],
    ),
  ],
);
