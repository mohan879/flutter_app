import '../types.dart';

// ❌ Bad: Raw SQL outside database layer

class UserRepository {
  Future<List<Map<String, dynamic>>> findUsers() async {
    // LINT: Raw SQL queries are only allowed in the database layer.
    return await rawQuery('SELECT * FROM users');
  }

  Future<void> deleteUser(String id) async {
    // LINT: Raw SQL queries are only allowed in the database layer.
    await rawQuery('DELETE FROM users WHERE id = "$id"');
  }
}
