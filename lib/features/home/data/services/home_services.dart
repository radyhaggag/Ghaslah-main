import 'package:dartz/dartz.dart';
import 'package:ghaslah/core/error/failures.dart';
import 'package:ghaslah/features/home/data/models/car_model.dart';
import 'package:ghaslah/features/home/data/models/reservation_model.dart';
import 'package:ghaslah/features/home/data/models/service_model.dart';
import 'package:ghaslah/features/home/data/models/work_day_model.dart';

import '../../../../core/api/api_service.dart';

// TODO : HANDLE THIS SERVICES WHEN CONNECTION RETURN
class HomeServices {
  final ApiService apiService;

  HomeServices(this.apiService);

  Future<Either<Failure, List<ServiceModel>>> getServices() async {
    try {
      final res = await apiService.get(endpoint: '');
      final services = res['services']
          .map(
            (e) => ServiceModel.fromMap(e),
          )
          .toList;
      return right(services);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, List<ServiceModel>>> getReservations() async {
    try {
      final res = await apiService.get(endpoint: '');
      final reservations = res['reservations']
          .map(
            (e) => ServiceModel.fromMap(e),
          )
          .toList;
      return right(reservations);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, ServiceModel>> getReservationById(int id) async {
    try {
      final res = await apiService.get(endpoint: '');
      final reservation = ServiceModel.fromMap(res['reservation']);
      return right(reservation);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, List<CarModel>>> getCars() async {
    try {
      final res = await apiService.get(endpoint: '');
      final cars = res['cars']
          .map(
            (e) => ServiceModel.fromMap(e),
          )
          .toList;
      return right(cars);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, CarModel>> getCarById(int id) async {
    try {
      final res = await apiService.get(endpoint: '');
      final car = CarModel.fromMap(res['car']);
      return right(car);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, bool>> addCar(CarModel carModel) async {
    try {
      final res = await apiService.post(endpoint: '', data: carModel.toMap());
      return right(true);
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
        endpoint: '',
        data: reservationModel.toMap(),
      );
      return right(true);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, List<WorkDayModel>>> getWorkDays() async {
    try {
      final res = await apiService.get(endpoint: '');
      final days = res['days']
          .map(
            (e) => ServiceModel.fromMap(e),
          )
          .toList;
      return right(days);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, WorkDayModel>> getWorkDayById(int id) async {
    try {
      final res = await apiService.get(endpoint: '');
      final day = WorkDayModel.fromMap(res['day']);
      return right(day);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
