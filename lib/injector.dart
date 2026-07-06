import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:sahaba_mobile/business_logic/calendar_bloc/calendar_bloc.dart';
import 'package:sahaba_mobile/business_logic/city_search_bloc/city_search_bloc.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/prayer_schedule_cubit/prayer_schedule_cubit.dart';
import 'package:sahaba_mobile/business_logic/qibla_cubit/qibla_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/business_logic/streak_cubit/streak_cubit.dart';
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
import 'package:sahaba_mobile/infrastructure/qibla/repository/i_qibla_repository.dart';
import 'package:sahaba_mobile/infrastructure/qibla/repository/qibla_repository.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/i_quran_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/quran/datasources/quran_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/quran/repository/i_quran_repository.dart';
import 'package:sahaba_mobile/infrastructure/quran/repository/quran_repository.dart';
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
  await _initL10nFeature();
  await _initPrayerFeature();
  await _initQiblaFeature();
  await _initStreakFeature();
  await _initQuranFeature();
  await _initCalendarFeature();
}

Future<void> _initCoreFeature() async {
  sl
    ..registerLazySingleton(DioApi.initMyQuran)
    ..registerLazySingleton(Connectivity.new)
    ..registerLazySingleton(() => FirebaseMessaging.instance)
    ..registerLazySingleton(LocationPermissionService.new)
    ..registerLazySingleton(DioApi.initCalendar, instanceName: 'calendarDio');
}

Future<void> _initL10nFeature() async {
  sl
    ..registerLazySingleton<ICoreLocalDatasource>(
      HiveCoreLocalDatasource.new,
    )
    ..registerLazySingleton<ICoreRepository>(() => CoreRepositories(sl()));
}

Future<void> _initPrayerFeature() async {
  sl
    ..registerLazySingleton<IPrayerRemoteDatasource>(
      () => PrayerRemoteDatasource(sl()),
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
    ..registerFactory(() => StreakCubit(sl()));
}

Future<void> _initQuranFeature() async {
  sl
    ..registerLazySingleton<IQuranLocalDatasource>(
      QuranLocalDatasource.new,
    )
    ..registerLazySingleton<IQuranRepository>(
      () => QuranRepository(sl()),
    )
    ..registerFactory(() => QuranBloc(sl()));
}

Future<void> _initCalendarFeature() async {
  sl
    ..registerLazySingleton<ICalendarRemoteDatasource>(
      () => CalendarRemoteDatasource(sl(instanceName: 'calendarDio')),
    )
    ..registerLazySingleton<ICalendarLocalDatasource>(
      CalendarLocalDatasource.new,
    )
    ..registerLazySingleton<ICalendarRepository>(
      () => CalendarRepository(sl(), sl()),
    )
    ..registerFactory(() => CalendarBloc(sl()));
}
