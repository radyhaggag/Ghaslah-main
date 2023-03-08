import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/api/dio_api_service.dart';
import '../core/api/interceptors.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  initCore();
}

void initCore() {
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
  sl.registerLazySingleton<DioApiService>(() => DioApiService(sl<Dio>()));
}
