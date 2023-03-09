abstract class ApiService {
  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  });
  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
  });
}
