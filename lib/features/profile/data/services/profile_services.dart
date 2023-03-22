import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ghaslah/config/app_shared.dart';
import 'package:ghaslah/core/api/api_service.dart';

import '../../../../core/error/failures.dart';
import '../models/profile_model.dart';

class ProfileServices {
  final ApiService apiService;

  ProfileServices(this.apiService);

  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final token = AppShared.getString(key: 'token');
      final res = await apiService.get(
        endpoint: '/v1/customers/auth/profile',
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      final profile = ProfileModel.fromMap(res['profile']);
      return right(profile);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
