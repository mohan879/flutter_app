// ❌ VIOLATION: Importing Dio outside of network layer
import 'package:dio/dio.dart';

/// Service that incorrectly uses Dio directly
class BadUsage {
  final Dio _dio = Dio();

  Future<String> fetchData(String url) async {
    final response = await _dio.get(url);
    return response.data.toString();
  }
}
