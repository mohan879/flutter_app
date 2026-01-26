// ✅ CORRECT: Using the approved Dio library
import 'package:dio/dio.dart';

/// API client using standard HTTP library
class GoodApiClient {
  final Dio _dio = Dio();

  Future<String> fetchData(String url) async {
    final response = await _dio.get(url);
    return response.data.toString();
  }
}
