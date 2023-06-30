import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ghaslah/core/api/api_service.dart';
import 'package:ghaslah/features/gifts/data/models/send_gift_model.dart';

import '../../../../config/app_shared.dart';
import '../../../../core/error/failures.dart';
import '../models/gift_model.dart';

class GiftsServices {
  final ApiService apiService;

  GiftsServices(this.apiService);

  Future<Either<Failure, bool>> sendGift(SendGiftModel sendGiftModel) async {
    try {
      final token = AppShared.getString(key: 'token');
      await apiService.post(
        endpoint: '/v1/gifts',
        data: sendGiftModel.toMap(),
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

  Future<Either<Failure, List<GiftModel>>> getAllGifts() async {
    try {
      final token = AppShared.getString(key: 'token');
      final res = await apiService.get(
        endpoint: '/v1/gifts',
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      final gifts = List<GiftModel>.from(
        res['gifts'].map((e) => GiftModel.fromMap(e)),
      ).toList();
      return right(gifts);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }

  Future<Either<Failure, bool>> deleteGift(int giftId) async {
    try {
      final token = AppShared.getString(key: 'token');
      final res = await apiService.get(
        endpoint: '/v1/gifts/:$giftId',
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      return right(res['success']);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return left(failure);
    }
  }
}
