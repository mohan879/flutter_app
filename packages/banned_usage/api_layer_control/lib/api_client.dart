// ✅ Good: Centralized ApiClient with interceptors

import 'http_types.dart';

class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    // Add interceptors for auth, logging, retry
  }

  Future<Response<T>> get<T>(String path) async {
    try {
      // Consistent error handling
      return await _dio.get(path) as Response<T>;
    } catch (e) {
      // Centralized error handling
      rethrow;
    }
  }

  Future<Response<T>> post<T>(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data) as Response<T>;
    } catch (e) {
      rethrow;
    }
  }
}

class SafeJson {
  static T? decode<T>(String source) {
    try {
      return jsonDecode(source) as T?;
    } catch (e) {
      return null;
    }
  }

  static String encode(Object? object) {
    try {
      return jsonEncode(object);
    } catch (e) {
      return '{}';
    }
  }
}
