// ❌ VIOLATION: Data layer importing state management
import 'package:riverpod/riverpod.dart';

/// Data source that incorrectly uses Riverpod
final userDataSourceProvider = Provider((ref) => UserDataSource());

class UserDataSource {
  Future<Map<String, dynamic>> fetchUser(String id) async {
    return {'id': id, 'name': 'John Doe'};
  }
}
