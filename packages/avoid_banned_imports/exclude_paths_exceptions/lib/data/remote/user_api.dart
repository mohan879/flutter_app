// ✅ CORRECT: Remote data layer can use Dio (excluded from rule)
import 'package:dio/dio.dart';

/// User API in the remote data layer - allowed to use Dio
class UserApi {
  final Dio _dio;

  UserApi({Dio? dio}) : _dio = dio ?? Dio();

  Future<Map<String, dynamic>> getUser(String id) async {
    final response = await _dio.get('/users/$id');
    return response.data as Map<String, dynamic>;
  }
}
