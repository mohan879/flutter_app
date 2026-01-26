// ✅ CORRECT: Core module with no feature dependencies
/// Network client abstraction
abstract class NetworkClient {
  Future<Map<String, dynamic>> get(String endpoint);
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data);
}
