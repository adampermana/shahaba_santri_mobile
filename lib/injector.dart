import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/business_logic/calendar_bloc/calendar_bloc.dart';
import 'package:sahaba_mobile/business_logic/category_product/category_product_bloc.dart';
import 'package:sahaba_mobile/business_logic/city_search_bloc/city_search_bloc.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/product_bloc/product_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_detail/product_detail_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_form/product_form_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_search/product_search_bloc.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_cubit.dart';
import 'package:sahaba_mobile/business_logic/special_product/special_product_bloc.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_cubit.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/i_auth_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/auth/repositories/i_auth_repositories.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/calendar_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/calendar_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/i_calendar_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/calendar/datasources/i_calendar_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/calendar/repository/calendar_repository.dart';
import 'package:sahaba_mobile/infrastructure/calendar/repository/i_calendar_repository.dart';
import 'package:sahaba_mobile/infrastructure/core/api/dio_api.dart';
import 'package:sahaba_mobile/infrastructure/core/datasources/i_core_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/core/repository/i_core_repository.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/i_prayer_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/i_prayer_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/prayer_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/datasources/prayer_remote_datasource.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/i_prayer_repository.dart';
import 'package:sahaba_mobile/infrastructure/prayer_schedule/repository/prayer_repository.dart';
import 'package:sahaba_mobile/infrastructure/product/datasources/product_remote_datasources.dart';
import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';
import 'package:sahaba_mobile/infrastructure/product/repository/product_repository.dart';
import 'package:sahaba_mobile/infrastructure/qibla/repository/i_qibla_repository.dart';
import 'package:sahaba_mobile/infrastructure/qibla/repository/qibla_repository.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/i_quran_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/quran_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/quran/repository/i_quran_repository.dart';
import 'package:sahaba_mobile/infrastructure/quran/repository/quran_repository.dart';
import 'package:sahaba_mobile/infrastructure/services/device_info_service.dart';
import 'package:sahaba_mobile/infrastructure/services/location_permission_service.dart';
import 'package:sahaba_mobile/infrastructure/streak/datasources/i_streak_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/streak/datasources/streak_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/streak/repository/i_streak_repository.dart';
import 'package:sahaba_mobile/infrastructure/streak/repository/streak_repository.dart';
import 'package:sahaba_mobile/local_data_storage.dart';

final GetIt sl = GetIt.instance;
Future<void> initApp() async {
  await initHiveStorage();
  await _initCoreFeature();
  await _initLocationFeature();
  await _initL10nFeature();
  await _initAuthFeature();
  await _initQuranFeature();
  await _initProductFeature();
  await _initPrayerFeature();
  await _initQiblaFeature();
  await _initStreakFeature();
  await _initCalendarFeature();
}

Future<void> _initCoreFeature() async {
  sl
    ..registerLazySingleton<Dio>(DioApi.init, instanceName: 'main')
    ..registerLazySingleton<Dio>(DioApi.initMyQuran, instanceName: 'myquran')
    ..registerLazySingleton(Connectivity.new)
    ..registerLazySingleton(() => FirebaseMessaging.instance)
    ..registerLazySingleton(DeviceInfoService.new)
    ..registerLazySingleton<Dio>(DioApi.initCalendar, instanceName: 'calendar');
}

Future<void> _initL10nFeature() async {
  sl
    ..registerLazySingleton<ICoreLocalDatasource>(
      HiveCoreLocalDatasource.new,
    )
    ..registerLazySingleton<ICoreRepository>(() => CoreRepositories(sl()));
}

Future<void> _initLocationFeature() async {
  sl
    ..registerFactory(LocationPermissionService.new)
    ..registerFactory(() => LocationBloc(sl()));
}

Future<void> _initAuthFeature() async {
  sl
    ..registerLazySingleton<IAuthLocalDatasource>(
      HiveAuthLocalDatasource.new,
    )
    ..registerLazySingleton<IAuthRemoteDatasource>(
      () => AuthRemoteDatasource(sl<Dio>(instanceName: 'main')),
    )
    ..registerLazySingleton<IAuthRepositories>(
      () => AuthRepositories(sl(), sl()),
    )
    ..registerFactory(() => AuthBloc(sl(), sl()));
}

Future<void> _initQuranFeature() async {
  sl
    ..registerLazySingleton<IQuranLocalDatasource>(
      QuranLocalDatasource.new,
    )
    ..registerLazySingleton<IQuranRepository>(
      () => QuranRepository(sl()),
    )
    ..registerFactory(() => QuranBloc(sl()))
    ..registerFactory(() => QuranDetailCubit(sl()))
    ..registerLazySingleton(() => LastReadCubit(sl()));
}

Future<void> _initProductFeature() async {
  sl
    ..registerLazySingleton<IProductRemoteDatasource>(
      () => ProductRemoteDatasource(sl<Dio>(instanceName: 'main')),
    )
    ..registerLazySingleton<IProductRepository>(
      () => ProductRepository(sl(), sl()),
    )
    ..registerFactory(() => ProductFormBloc(sl(), sl(), sl()))
    // ..registerFactory(() => PersonalDataFormBloc(sl()))
    ..registerFactory(() => ProductDetailBloc(sl()))
    ..registerFactory(() => ProductSearchBloc(sl(), sl(), sl()))
    ..registerFactory(() => SpecialProductBloc(sl(), sl(), sl()))
    ..registerFactory(() => CategoryProductBloc(sl(), sl(), sl()))
    ..registerFactory(() => ProductBloc(sl(), sl(), sl()));
}

Future<void> _initPrayerFeature() async {
  sl
    ..registerLazySingleton<IPrayerRemoteDatasource>(
      () => PrayerRemoteDatasource(sl<Dio>(instanceName: 'myquran')),
    )
    ..registerLazySingleton<IPrayerLocalDatasource>(
      PrayerLocalDatasource.new,
    )
    ..registerLazySingleton<IPrayerRepository>(
      () => PrayerRepository(sl(), sl(), sl()),
    )
    ..registerFactory(() => LocationCubit(sl(), sl()))
    ..registerFactory(() => PrayerScheduleCubit(sl()))
    ..registerFactory(() => CitySearchBloc(sl()));
}

Future<void> _initQiblaFeature() async {
  sl
    ..registerLazySingleton<IQiblaRepository>(
      () => QiblaRepository(sl(), sl()),
    )
    ..registerFactory(() => QiblaCubit(sl(), sl()));
}

Future<void> _initStreakFeature() async {
  sl
    ..registerLazySingleton<IStreakLocalDatasource>(
      StreakLocalDatasource.new,
    )
    ..registerLazySingleton<IStreakRepository>(
      () => StreakRepository(sl()),
    )
    ..registerLazySingleton(() => StreakCubit(sl()));
}

Future<void> _initCalendarFeature() async {
  sl
    ..registerLazySingleton<ICalendarRemoteDatasource>(
      () => CalendarRemoteDatasource(sl<Dio>(instanceName: 'calendar')),
    )
    ..registerLazySingleton<ICalendarLocalDatasource>(
      CalendarLocalDatasource.new,
    )
    ..registerLazySingleton<ICalendarRepository>(
      () => CalendarRepository(sl(), sl()),
    )
    ..registerFactory(() => CalendarBloc(sl()));
}
