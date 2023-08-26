import 'package:get_it/get_it.dart';
import 'package:test_project/core/singleton/dio.dart';
import 'package:test_project/core/storage/storage_repo.dart';
import 'package:test_project/features/auth/data/repositories/login_repo_impl.dart';

import '../../features/auth/data/datasource/login_datasource.dart';

final serviceLocator = GetIt.instance;

Future<void> setupDependency() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(() => DioSettings());

  serviceLocator.registerLazySingleton(() => LoginRepositoryImpl());
  serviceLocator.registerLazySingleton(() => LoginDataSourceImpl());
}
