import 'package:booki/Features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:booki/Features/authentication/domain/repositories/auth_repo.dart';
import 'package:booki/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booki/Features/home/data/repositories/home_repo_impl.dart';
import 'package:booki/core/services/api_service.dart';
import 'package:booki/core/services/firebase_auth_service.dart';
import 'package:booki/core/services/firebase_database_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  BaseOptions options = BaseOptions(
    baseUrl: ApiService.baseURL,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(minutes: 1), // 60 seconds
    receiveTimeout: const Duration(minutes: 1), // 60 seconds
  );

  getIt.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
    ),
  );

  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(options),
    ),
  );

  getIt.registerSingleton<HomeRemoteDataSourceImplementation>(
    HomeRemoteDataSourceImplementation(
      FirebaseDatabaseService(),
    ),
  );

  //  getIt.registerSingleton<HomeLocalDataSourceImplementation>(
  //   HomeLocalDataSourceImplementation(),
  // );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImplementation>(),
    ),
  );
}
