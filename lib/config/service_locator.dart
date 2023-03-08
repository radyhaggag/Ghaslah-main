import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ghaslah/features/auth/data/services/auth_services.dart';
import 'package:ghaslah/features/home/data/services/home_services.dart';

import '../core/api/api_service.dart';
import '../core/api/dio_api_service.dart';
import '../core/api/interceptors.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // Init core
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());

  sl.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  sl.registerLazySingleton<ApiService>(() => DioApiService(sl<Dio>()));
  // Init Auth
  sl.registerLazySingleton<AuthServices>(() => AuthServices(sl()));
  // Init Home
  sl.registerLazySingleton<HomeServices>(() => HomeServices(sl()));
}
