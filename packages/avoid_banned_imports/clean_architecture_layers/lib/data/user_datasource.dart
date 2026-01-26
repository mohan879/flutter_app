// ❌ VIOLATION: Data layer importing from presentation layer
import '../presentation/user_widget.dart';

import 'user_dto.dart';

/// User data source
class UserDatasource {
  Future<UserDto> fetchUser(String id) async {
    // Simulated API call
    return UserDto(
      id: id,
      name: 'John Doe',
      email: 'john@example.com',
      raw: {},
    );
  }

  // ❌ This method references presentation types
  Type getWidgetType() => UserWidget;
}
