// ✅ CORRECT: Network layer can use Dio (excluded from rule)
import 'package:dio/dio.dart';

/// API client in the network layer - allowed to use Dio
class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio}) : _dio = dio ?? Dio();

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await _dio.get(endpoint);
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post(endpoint, data: data);
    return response.data as Map<String, dynamic>;
  }
}
