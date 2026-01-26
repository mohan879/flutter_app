import '../services/api_service.dart';

/// User entity.
class User {
  final String id;
  final String name;
  final String email;

  const User({required this.id, required this.name, required this.email});
}

/// Abstract user repository interface.
abstract class UserRepository {
  Future<User?> getUser(String id);
  Future<List<User>> getAllUsers();
}

/// User repository implementation.
class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService;

  UserRepositoryImpl(this._apiService);

  @override
  Future<User?> getUser(String id) async {
    final response = await _apiService.get('/users/$id');
    if (response['status'] == 'success') {
      return User(id: id, name: 'User $id', email: 'user$id@example.com');
    }
    return null;
  }

  @override
  Future<List<User>> getAllUsers() async {
    await _apiService.get('/users');
    return [
      const User(id: '1', name: 'User 1', email: 'user1@example.com'),
      const User(id: '2', name: 'User 2', email: 'user2@example.com'),
    ];
  }
}
