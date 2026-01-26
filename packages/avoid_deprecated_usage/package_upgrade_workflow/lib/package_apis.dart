// Simulated package APIs - v1 (pre-upgrade)
@deprecated
class OldApiClient {
  Future<String> fetch(String url) async => 'data';
}

// Simulated package APIs - v2 (post-upgrade, more deprecations)
@Deprecated('Use HttpClient.get() instead - deprecated in v2.0')
Future<String> fetchData(String url) async => 'data';

@Deprecated('Use JsonParser.decode() instead - deprecated in v2.0')
Map<String, dynamic> parseJson(String json) => {};

// New recommended APIs
class HttpClient {
  Future<String> get(String url) async => 'data';
}

class JsonParser {
  static Map<String, dynamic> decode(String json) => {};
}
