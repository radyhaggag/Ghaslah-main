import 'package:dartz/dartz.dart';

import '../../../../config/app_shared.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/error/failures.dart';
import '../models/register_model.dart';

class AuthServices {
  final ApiService apiService;

  AuthServices(this.apiService);

  Future<Either<Failure, String>> sendOtpCode(
    String phoneNumber,
  ) async {
    try {
      final res = await apiService.post(
        endpoint: '/v1/customers/auth/login',
        data: {"phoneNumber": "01030096242"},
      );
      final otpCode = res['newRandomVerificatioCode'];
      return right(otpCode.toString());
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, bool>> verifyOtpCode(
    String otpCode,
    String phoneNumber,
  ) async {
    try {
      final res = await apiService
          .post(endpoint: '/v1/customers/auth/login/verify', data: {
        "phoneNumber": phoneNumber,
        "code": otpCode,
      });
      if (res['success'] == true) {
        await AppShared.setString(
          key: 'token',
          value: res['newAccessToken'],
        );
        print(res['newAccessToken']);
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, bool>> register(
    RegisterModel registerModel,
  ) async {
    try {
      final res = await apiService.post(
        endpoint: '/v1/customers/auth/register',
        data: registerModel.toMap(),
      );
      return right(true);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
