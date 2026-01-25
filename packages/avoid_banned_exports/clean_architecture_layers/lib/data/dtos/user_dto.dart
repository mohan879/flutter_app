class UserDto {
  final String id;
  final String name;

  const UserDto({required this.id, required this.name});

  factory UserDto.fromJson(Map<String, Object?> json) => UserDto(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
      );
}
