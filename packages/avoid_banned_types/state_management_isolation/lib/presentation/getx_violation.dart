// ❌ BAD: Using GetX when team standardized on BLoC
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ❌ Violation: GetxController when using BLoC
class BadController extends GetxController {
  var count = 0.obs;

  void increment() => count++;
}

class BadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ❌ Violation: GetX widget when using BLoC
    return GetX<BadController>(
      init: BadController(),
      builder: (controller) => Text('${controller.count}'),
    );
  }
}
