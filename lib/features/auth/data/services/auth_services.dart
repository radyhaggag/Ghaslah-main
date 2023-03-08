import 'package:dartz/dartz.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/error/failures.dart';
import '../models/register_model.dart';

// TODO : Handle methos when get api from back-end
class AuthServices {
  final ApiService apiService;

  AuthServices(this.apiService);

  Future<Either<Failure, String>> login(
    String phoneNumber,
  ) async {
    try {
      final res = apiService.post(endpoint: 'endpoint');
      return right(res.toString());
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, String>> register(
    RegisterModel registerModel,
  ) async {
    try {
      final res = apiService.post(endpoint: 'endpoint');
      return right(res.toString());
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, bool>> verifyOtpCode(
    String otpCode,
    String verificationId,
  ) async {
    try {
      final res = apiService.post(endpoint: 'endpoint');
      return right(true);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
