import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '11_prefer_immutable_provider_arguments.g.dart';

/// --- prefer-immutable-provider-arguments ---
///
/// Warns when a Provider's argument does not have a consistent `==`.
/// If you pass a value that doesn't support stable equality checks, Riverpod
/// can't know whether the "new" argument is logically the same as the old one.
///
/// Issues this rule prevents:
/// - Unnecessary rebuilds – widget rebuilds even if nothing meaningful changed
/// - Lost caching – Riverpod thinks you're asking for "new" data every time
/// - Stale data – providers don't reuse results across identical inputs

// Single family provider generated via riverpod_generator (matches DCM example)
@riverpod
String someProvider(SomeProviderRef ref, Object arg) {
  return 'Data for $arg';
}

// Class WITHOUT proper equality — BAD to use as argument
class SomeClassWithoutEquals {
  SomeClassWithoutEquals();
  // No == or hashCode override! (unstable equality)
}

// Class WITH proper equality — GOOD to use as argument
class SomeClassWithEquals {
  const SomeClassWithEquals();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other.runtimeType == runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

// -------------------------------------------------------------------------
// BAD: Arguments without consistent '==' — triggers lint violations!
// -------------------------------------------------------------------------
void badUsage(WidgetRef ref) {
  // 💥 LINT: Avoid passing arguments without consistent '=='.
  ref.watch(someProvider(SomeClassWithoutEquals()));

  // 💥 LINT: Avoid passing arguments without consistent '=='.
  ref.watch(someProvider([42]));

  // 💥 LINT: Avoid passing arguments without consistent '=='.
  ref.watch(someProvider(() {}));
}

// -------------------------------------------------------------------------
// GOOD: Arguments with stable equality — no lint violations
// -------------------------------------------------------------------------
void goodUsage(WidgetRef ref) {
  // ✅ Class with proper equality
  ref.watch(someProvider(const SomeClassWithEquals()));

  // ✅ const class instance
  ref.watch(someProvider(const SomeClassWithEquals()));

  // ✅ const Object
  ref.watch(someProvider(const Object()));

  // ✅ const list
  ref.watch(someProvider(const [42]));

  // ✅ const map
  ref.watch(someProvider(const {'string': 42}));

  // ✅ Variable (already evaluated)
  final variable = const SomeClassWithEquals();
  ref.watch(someProvider(variable));
}
