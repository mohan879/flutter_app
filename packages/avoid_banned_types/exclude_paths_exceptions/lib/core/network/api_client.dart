// ✅ GOOD: Dio types in network layer (excluded from rule)
import 'package:dio/dio.dart';

/// Network layer abstraction - Dio is allowed here
class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio}) : _dio = dio ?? Dio();

  Future<Map<String, dynamic>> get(String path) async {
    final Response response = await _dio.get(path);
    return response.data as Map<String, dynamic>;
  }

  void handleError(DioException error) {
    // Handle network errors
  }
}
