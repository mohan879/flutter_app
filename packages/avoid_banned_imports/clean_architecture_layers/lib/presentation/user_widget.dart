// ✅ CORRECT: Presentation can import from domain
import '../domain/user_entity.dart';

/// User widget - presentation layer
class UserWidget {
  final UserEntity user;

  UserWidget(this.user);

  void render() {
    print('User: ${user.name}');
  }
}
