import '../types.dart';

// ✅ Good: Raw SQL in database layer (allowed)

class DatabaseService {
  Future<List<Map<String, dynamic>>> query(String sql) async {
    // This is allowed because we're in the database layer
    return await rawQuery(sql);
  }
}
