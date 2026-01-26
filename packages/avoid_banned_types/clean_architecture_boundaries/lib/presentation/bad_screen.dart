// ❌ BAD: Presentation layer using data layer types directly
import 'package:flutter/material.dart';
import '../data/user_dto.dart';

class BadUserScreen extends StatelessWidget {
  // ❌ Violation: Using UserDto (data layer type) in presentation
  final UserDto userDto;

  const BadUserScreen({super.key, required this.userDto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(userDto.name)));
  }
}
