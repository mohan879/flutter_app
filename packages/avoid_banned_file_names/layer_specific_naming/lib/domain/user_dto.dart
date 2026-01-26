// ❌ DTO in domain layer - should be in data/
class UserDto {
  final String id;
  final String name;

  UserDto({required this.id, required this.name});

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
