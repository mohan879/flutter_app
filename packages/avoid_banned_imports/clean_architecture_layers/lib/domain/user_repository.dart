// ❌ VIOLATION: Domain layer importing from data layer
import '../data/user_dto.dart';

import 'user_entity.dart';

/// Abstract repository interface
abstract class UserRepository {
  Future<UserEntity> getUser(String id);

  // This method signature leaks data layer types
  Future<UserDto> getUserDto(String id); // ❌ Should not use DTOs in domain
}
