import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../config/app_shared.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/error/failures.dart';
import '../models/home_services_model.dart';
import '../models/reservation_model.dart';
import '../models/service_model.dart';

class HomeServices {
  final ApiService apiService;

  HomeServices(this.apiService);

  Future<Either<Failure, HomeServicesModel>> getServices() async {
    try {
      final res = await apiService.get(endpoint: '/v1/services');
      final services = HomeServicesModel.fromMap(res);
      return right(services);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, ServiceModel>> getServiceById(int id) async {
    try {
      final res = await apiService.get(
        endpoint: '/v1/services/:id',
        queryParams: {'id': id},
      );
      final service = ServiceModel.fromMap(res['service']);

      return right(service);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, List<ReservationModel>>> getReservations() async {
    try {
      final token = AppShared.getString(key: 'token');
      final res = await apiService.get(
        endpoint: '/v1/reservations',
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      final reservations = List<ReservationModel>.from(res['reservations'].map(
        (e) => ReservationModel.fromMap(e),
      ));
      return right(reservations);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
