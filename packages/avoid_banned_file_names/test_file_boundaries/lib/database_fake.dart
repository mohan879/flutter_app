// ❌ Fake file in lib/ - should be in test/fakes/
class DatabaseFake {
  final Map<String, dynamic> _data = {};

  Future<void> save(String key, dynamic value) async {
    _data[key] = value;
  }

  Future<dynamic> get(String key) async {
    return _data[key];
  }
}
