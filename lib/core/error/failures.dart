import 'package:dio/dio.dart';
import 'error_model.dart';

abstract class Failure {
  Failure(this.message);

  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ServerFailure('انتهى وقت الاتصال بالسيرفر');
      case DioErrorType.badCertificate:
        return ServerFailure(
          'شهادة التحقق من الصحة غير صحيحة ، يرجى المحاولة مرة أخرى في وقت لاحق',
        );
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioErrorType.cancel:
        return ServerFailure('تم الغاء الاتصال بالسيرفر');
      case DioErrorType.connectionError:
        return ServerFailure('لا يوجد اتصال بالانترنت');
      case DioErrorType.unknown:
        return ServerFailure(
          'خطأ غير معروف، يبدو انه يوجد مشكلة ما ونحن نعمل على حلها الأن',
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      final ErrorModel errorModel = ErrorModel.fromMap(response);
      return ServerFailure(errorModel.description);
    } else if (statusCode == 404) {
      return ServerFailure('طلبك غير موجود!');
    } else if (statusCode == 500) {
      return ServerFailure('خطا في الخادم، حاول مجددا فى وقت لاحق!');
    } else {
      return ServerFailure(
        'خطأ غير معروف، يبدو انه يوجد مشكلة ما ونحن نعمل على حلها الأن',
      );
    }
  }
}

class ErrorHandler {
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = ServerFailure.fromDioError(error);
    } else {
      failure = ServerFailure(error.toString());
    }
  }

  late Failure failure;
}
