import 'services.dart';

// ❌ Bad: Direct instantiation bypassing DI

class UserRepository {
  // LINT: Use GetIt to get ApiClient instance instead of direct instantiation.
  final client = ApiClient(baseUrl: 'https://api.example.com');

  Future<Map<String, dynamic>> fetchUser(String id) async {
    return await client.get('/users/$id');
  }
}

class ProductService {
  // LINT: Use GetIt to get ApiClient instance instead of direct instantiation.
  late final ApiClient _client;

  ProductService() {
    // LINT: Use GetIt to get ApiClient instance instead of direct instantiation.
    _client = ApiClient(baseUrl: 'https://api.example.com');
  }
}

void useSingleton() {
  // LINT: Use dependency injection instead of singleton pattern.
  Singleton.instance.doSomething();

  // LINT: Use dependency injection instead of singleton pattern.
  final singleton = Singleton.instance;
  singleton.doSomething();
}

class EventLogger {
  void logEvent(String name) {
    // LINT: Use Clock.now() for testable current time.
    final timestamp = DateTime.now();
    print('[$timestamp] Event: $name');
  }

  void logWithDuration(String name, Duration duration) {
    // LINT: Use Clock.now() for testable current time.
    final start = DateTime.now();
    // ... do work
    // LINT: Use Clock.now() for testable current time.
    final end = DateTime.now();
    print('$name took ${end.difference(start)}');
  }
}
