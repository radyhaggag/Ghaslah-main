import 'package:dartz/dartz.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/error/failures.dart';
import '../models/reservation_model.dart';
import '../models/service_model.dart';

// TODO : HANDLE THIS SERVICES WHEN CONNECTION RETURN
class HomeServices {
  final ApiService apiService;

  HomeServices(this.apiService);

  Future<Either<Failure, List<ServiceModel>>> getServices() async {
    try {
      final res = await apiService.get(endpoint: '/v1/services');
      final services =
          res['services'].map((e) => ServiceModel.fromMap(e)).toList();
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

  Future<Either<Failure, List<ServiceModel>>> getReservations() async {
    try {
      final res = await apiService.get(endpoint: '/v1/reservations');
      final reservations = res['reservations']
          .map(
            (e) => ServiceModel.fromMap(e),
          )
          .toList();
      return right(reservations);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, bool>> addReservation(
    ReservationModel reservationModel,
  ) async {
    try {
      final res = await apiService.post(
        endpoint: '/v1/reservations',
        data: reservationModel.toMap(),
      );
      return right(true);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
