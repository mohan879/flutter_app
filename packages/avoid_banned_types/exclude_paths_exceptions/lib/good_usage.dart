// ✅ GOOD: Using abstraction outside network layer
import 'core/network/api_client.dart';

class GoodService {
  // ✅ Using abstraction, not Dio directly
  final ApiClient _apiClient;

  GoodService(this._apiClient);

  Future<Map<String, dynamic>> fetchData() async {
    // Uses ApiClient abstraction instead of Dio
    return _apiClient.get('/api/data');
  }
}
