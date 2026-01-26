/// Data Transfer Object for User
class UserDto {
  final String id;
  final String name;
  final String email;
  final Map<String, dynamic> raw;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.raw,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      raw: json,
    );
  }
}
