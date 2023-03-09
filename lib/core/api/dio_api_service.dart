import 'package:dio/dio.dart';

import 'api_service.dart';

class DioApiService implements ApiService {
  DioApiService(this.dio);

  final Dio dio;

  final _baseUrl = 'http://44.213.108.46/api';

  @override
  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    var response = await dio.get(
      '$_baseUrl$endpoint',
      queryParameters: queryParams,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    var response = await dio.post(
      '$_baseUrl$endpoint',
      data: data,
    );
    return response.data;
  }
}
