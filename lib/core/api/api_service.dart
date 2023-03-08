abstract class ApiService {
  Future<Map<String, dynamic>> get({required String endpoint});
  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
  });
}
