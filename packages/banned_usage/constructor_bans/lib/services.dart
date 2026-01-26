// Types that should only be accessed through DI

class ApiClient {
  ApiClient({required this.baseUrl});
  final String baseUrl;

  Future<dynamic> get(String path) async => {};
}

class Singleton {
  Singleton._();
  static final instance = Singleton._();

  void doSomething() {}
}

class Clock {
  static DateTime now() => DateTime.now();
}
