import 'package:get_it/get_it.dart';
import 'package:sahaba_mobile/infrastructure/core/datasources/i_core_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/core/repository/i_core_repository.dart';
import 'package:sahaba_mobile/local_data_storage.dart';

final GetIt sl = GetIt.instance;
Future<void> initApp() async {
  await initHiveStorage();
  await _initCoreFeature();
  await _initL10nFeature();
  // await _initAuthFeature();
}

Future<void> _initCoreFeature() async {
  // sl
  // ..registerLazySingleton(DioApi.init)
  // ..registerFactory(NetworkConnectionBloc.new)
  // ..registerFactory<DeviceSources>(DeviceSources.new);
}

Future<void> _initL10nFeature() async {
  sl
    ..registerLazySingleton<ICoreLocalDatasource>(
      HiveCoreLocalDatasource.new,
    )
    ..registerLazySingleton<ICoreRepository>(() => CoreRepositories(sl()));
  // ..registerFactory(() => L10nBloc(sl()));
}
