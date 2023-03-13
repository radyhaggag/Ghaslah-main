import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../models/book_model.dart';

import '../../../../config/app_shared.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/error/failures.dart';
import '../models/car_model.dart';
import '../models/work_day_model.dart';

class BookingServices {
  final ApiService apiService;

  BookingServices(this.apiService);
  Future<Either<Failure, List<CarModel>>> getCars() async {
    try {
      final token = AppShared.getString(key: 'token');
      final res = await apiService.get(
        endpoint: '/v1/cars',
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      final cars = List<CarModel>.from(
        res['cars'].map((e) => CarModel.fromMap(e)),
      );
      return right(cars);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, CarModel>> getCarById(int id) async {
    try {
      final token = AppShared.getString(key: 'token');

      final res = await apiService.get(
        endpoint: '/v1/cars/:id',
        queryParams: {'id': id},
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      final car = CarModel.fromMap(res['car']);
      return right(car);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, bool>> addCar(CarModel carModel) async {
    try {
      final token = AppShared.getString(key: 'token');

      final res = await apiService.post(
        endpoint: '/v1/cars',
        data: carModel.toMap(),
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      return right(res['success'] as bool);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, List<WorkDayModel>>> getWorkDays() async {
    try {
      final res = await apiService.get(endpoint: '/v1/work/days');
      final days = List<WorkDayModel>.from(
        res['worksDays'].map((e) => WorkDayModel.fromMap(e)),
      );
      return right(days);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, WorkDayModel>> getWorkDayById(int id) async {
    try {
      final res = await apiService.get(
        endpoint: '/v1/work/days/$id',
      );
      final day = WorkDayModel.fromMap(res['workDay']);
      return right(day);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, bool>> addReservation(BookModel bookModel) async {
    try {
      final token = AppShared.getString(key: 'token');
      await apiService.post(
        endpoint: '/v1/reservations',
        data: bookModel.toMap(),
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      return right(true);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
