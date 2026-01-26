import 'http_types.dart';

// ❌ Bad: Scattered HTTP calls without centralized handling

class UserRepository {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchUser(String id) async {
    // LINT: Use ApiClient.get() for consistent error handling and interceptors.
    final response = await _dio.get('/users/$id');
    return response.data;
  }

  Future<void> updateUser(String id, Map<String, dynamic> data) async {
    // LINT: Use ApiClient.post() for consistent error handling and interceptors.
    await _dio.post('/users/$id', data: data);
  }
}

class ProductService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchProducts() async {
    // LINT: Use ApiClient.get() for consistent error handling and interceptors.
    final response = await _dio.get('/products');
    return response.data;
  }
}

void parseData(String jsonString) {
  // LINT: Use SafeJson.decode() with error handling.
  final data = jsonDecode(jsonString);
  print(data);
}

void serializeData(Map<String, dynamic> data) {
  // LINT: Use SafeJson.encode() with error handling.
  final json = jsonEncode(data);
  print(json);
}
