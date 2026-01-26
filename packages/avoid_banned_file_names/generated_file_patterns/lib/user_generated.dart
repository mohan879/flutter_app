// ❌ Non-standard pattern - should be user.g.dart
// This breaks tooling and .gitignore rules

class UserGenerated {
  final String id;

  UserGenerated({required this.id});

  Map<String, dynamic> toJson() => {'id': id};
}
