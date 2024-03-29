import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Options? options,
  });
  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Options? options,
  });
}
