/// Abstract API service interface.
abstract class ApiService {
  Future<Map<String, dynamic>> get(String path);
  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data);
}

/// API service implementation.
class ApiServiceImpl implements ApiService {
  @override
  Future<Map<String, dynamic>> get(String path) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return {'status': 'success', 'path': path};
  }

  @override
  Future<Map<String, dynamic>> post(
    String path,
    Map<String, dynamic> data,
  ) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return {'status': 'success', 'path': path, 'data': data};
  }
}
