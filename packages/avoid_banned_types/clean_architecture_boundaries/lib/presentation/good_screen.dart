// ✅ GOOD: Presentation layer using domain entity
import 'package:flutter/material.dart';
import '../domain/good_entity.dart';

class GoodUserScreen extends StatelessWidget {
  // ✅ Using domain entity, not data layer DTO
  final UserEntity user;

  const GoodUserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(user.getDisplayName())));
  }
}
