// Data layer DTO - this is fine in data layer
class UserDto {
  final String name;
  final int age;

  UserDto({required this.name, required this.age});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(name: json['name'] as String, age: json['age'] as int);
  }

  Map<String, dynamic> toJson() => {'name': name, 'age': age};
}
