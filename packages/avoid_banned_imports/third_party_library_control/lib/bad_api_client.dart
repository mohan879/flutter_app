// ❌ VIOLATION: Using http instead of Dio
import 'package:http/http.dart' as http;

/// API client using non-standard HTTP library
class BadApiClient {
  Future<String> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    return response.body;
  }
}
