// Code affected by package upgrade - NEW deprecations not in baseline
import 'package_apis.dart';

class PostUpgradeService {
  // ❌ NEW deprecation after upgrade - should be caught
  Future<String> getData() async {
    return fetchData('/api/data');
  }

  // ❌ NEW deprecation after upgrade - should be caught
  Map<String, dynamic> parse(String json) {
    return parseJson(json);
  }
}

// ✅ GOOD: Using new recommended APIs
class ModernService {
  final HttpClient _client = HttpClient();

  Future<String> getData() async {
    return _client.get('/api/data');
  }

  Map<String, dynamic> parse(String json) {
    return JsonParser.decode(json);
  }
}
