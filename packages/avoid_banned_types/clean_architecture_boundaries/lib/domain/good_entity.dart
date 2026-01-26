// ✅ GOOD: Pure Dart domain entity
class UserEntity {
  final String name;
  final int age;

  UserEntity({required this.name, required this.age});

  bool get isAdult => age >= 18;

  // Pure business logic, no Flutter dependencies
  String getDisplayName() => name.toUpperCase();
}
