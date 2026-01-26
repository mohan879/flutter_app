// ❌ VIOLATION: Using built_value instead of freezed
import 'package:built_value/built_value.dart';

/// Model using non-standard serialization library
abstract class BadModel {
  String get name;
  int get age;
}
