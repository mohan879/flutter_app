// ✅ CORRECT: Pure Dart use case, no Flutter imports
import 'user_entity.dart';
import 'user_repository.dart';

/// Get user use case
class GetUserUseCase {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  Future<UserEntity> execute(String userId) {
    return _repository.getUser(userId);
  }
}
