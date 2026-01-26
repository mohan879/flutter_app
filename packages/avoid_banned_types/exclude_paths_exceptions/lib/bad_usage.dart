// ❌ BAD: Using Dio types outside network layer
import 'package:dio/dio.dart';

class BadService {
  // ❌ Violation: Dio type outside network layer
  final Dio _dio = Dio();

  // ❌ Violation: Response type outside network layer
  Future<Response> fetchData() async {
    return _dio.get('/api/data');
  }

  // ❌ Violation: DioException type outside network layer
  void handleError(DioException error) {
    print(error.message);
  }
}
