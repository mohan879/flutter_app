// ❌ Mock file in lib/ - should be in test/mocks/
class ApiClientMock {
  Future<Map<String, dynamic>> get(String url) async {
    return {'mock': 'data'};
  }
}
