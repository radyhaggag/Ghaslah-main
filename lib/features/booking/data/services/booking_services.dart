import 'package:dartz/dartz.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/error/failures.dart';
import '../../../home/data/models/car_model.dart';
import '../../../home/data/models/work_day_model.dart';

class BookingServices {
  final ApiService apiService;

  BookingServices(this.apiService);
  Future<Either<Failure, List<CarModel>>> getCars() async {
    try {
      final res = await apiService.get(endpoint: '/v1/cars');
      final cars = res['cars'].map((e) => CarModel.fromMap(e)).toList();
      return right(cars);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, CarModel>> getCarById(int id) async {
    try {
      final res = await apiService.get(
        endpoint: '/v1/cars/:id',
        queryParams: {'id': id},
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
      final res = await apiService.post(
        endpoint: '/v1/cars',
        data: carModel.toMap(),
      );
      return right(true);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, List<WorkDayModel>>> getWorkDays() async {
    try {
      final res = await apiService.get(endpoint: '/v1/work/days');
      final days = res['days'].map((e) => WorkDayModel.fromMap(e)).toList();
      return right(days);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, WorkDayModel>> getWorkDayById(int id) async {
    try {
      final res = await apiService.get(
        endpoint: '/v1/work/days/:id',
        queryParams: {'id': id},
      );
      final day = WorkDayModel.fromMap(res['day']);
      return right(day);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
