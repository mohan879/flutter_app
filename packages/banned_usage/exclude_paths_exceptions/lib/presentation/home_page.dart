import '../types.dart';

// ❌ Bad: Presentation layer must use wrappers

class HomePage extends Widget {
  Widget build() {
    return Column([
      // LINT: Use DSButton.primary() from design system.
      ElevatedButton(onPressed: () {}, child: Text('Click me')),

      // LINT: Use DSButton.primary() from design system.
      ElevatedButton(onPressed: () {}, child: Text('Another button')),
    ]);
  }
}

class Column extends Widget {
  Column(this.children);
  final List<Widget> children;
}

class UserRepository {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchUser(String id) async {
    // LINT: Use ApiClient methods for consistent error handling.
    final response = await _dio.get('/users/$id');
    return response.data;
  }

  Future<void> createUser(Map<String, dynamic> data) async {
    // LINT: Use ApiClient methods for consistent error handling.
    await _dio.post('/users', data: data);
  }
}
