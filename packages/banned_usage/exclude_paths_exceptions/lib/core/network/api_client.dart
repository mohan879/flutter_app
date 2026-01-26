import '../types.dart';

// ✅ Good: Network layer can use Dio directly

class ApiClient {
  final Dio _dio = Dio();

  Future<Response<T>> get<T>(String path) async {
    // Allowed in core/network folder (excluded from ban)
    return await _dio.get(path) as Response<T>;
  }

  Future<Response<T>> post<T>(String path, {dynamic data}) async {
    // Also allowed
    return await _dio.post(path, data: data) as Response<T>;
  }
}
