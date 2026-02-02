/// Data layer - should not be imported by presentation

class UserRepository {
  final Map<String, dynamic> _cache = {};

  Future<Map<String, dynamic>> fetchUser(String id) async {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }

    // Simulate API call
    final data = {'id': id, 'name': 'User $id'};
    _cache[id] = data;
    return data;
  }

  Future<void> saveUser(Map<String, dynamic> user) async {
    final id = user['id'] as String;
    _cache[id] = user;
  }
}
