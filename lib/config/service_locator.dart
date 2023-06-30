import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ghaslah/features/gifts/data/services/gifts_services.dart';
import 'package:ghaslah/features/profile/data/services/profile_services.dart';
import '../features/reservation/data/services/booking_services.dart';
import '../features/reservation/data/services/maps_services.dart';
import '../features/auth/data/services/auth_services.dart';
import '../features/home/data/services/home_services.dart';

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
  // init dio service
  sl.registerLazySingleton<ApiService>(() => DioApiService(sl<Dio>()));
  // Init Auth
  sl.registerLazySingleton<AuthServices>(() => AuthServices(sl()));
  // Init Home
  sl.registerLazySingleton<HomeServices>(() => HomeServices(sl()));
  // Init Reservation
  sl.registerLazySingleton<ReservationServices>(
      () => ReservationServices(sl()));
  sl.registerLazySingleton<MapsServices>(() => MapsServices(sl()));
  // Init Reservation
  sl.registerLazySingleton<ProfileServices>(() => ProfileServices(sl()));
  // Init Gift Services
  sl.registerLazySingleton<GiftsServices>(() => GiftsServices(sl()));
}
