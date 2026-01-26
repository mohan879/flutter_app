import 'package:flutter_riverpod/flutter_riverpod.dart';

/// --- prefer-immutable-provider-arguments ---
///
/// Family provider arguments need stable equality for proper caching.
/// If you pass objects that don't implement proper equality,
/// Riverpod can't cache properly, leading to unnecessary rebuilds,
/// lost caching, or stale data.

// Example providers
final dataProvider = FutureProvider.family<String, int>((ref, id) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 'Data for $id';
});

final objectProvider = FutureProvider.family<String, SomeClassWithEquals>((
  ref,
  param,
) async {
  return 'Data for ${param.value}';
});

final listProvider = FutureProvider.family<String, List<int>>((
  ref,
  items,
) async {
  return 'Items: $items';
});

// Class without proper equality
class SomeClassWithoutEquals {
  final int value;
  SomeClassWithoutEquals(this.value);
  // No == or hashCode override!
}

// Class with proper equality
class SomeClassWithEquals {
  final int value;
  const SomeClassWithEquals(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SomeClassWithEquals &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

// This provider accepts objects without proper equality
final badObjectProvider = FutureProvider.family<String, SomeClassWithoutEquals>(
  (ref, param) async {
    return 'Data for ${param.value}';
  },
);

// BAD: Arguments without consistent equality
void badUsage(WidgetRef ref) {
  // 💥 New instance every time — Riverpod can't cache properly!
  ref.watch(badObjectProvider(SomeClassWithoutEquals(42)));

  // 💥 Lists don't have value equality by default!
  ref.watch(listProvider([42]));

  // 💥 Functions are never equal!
  // ref.watch(someProvider(() { })); // This would be very bad
}

// GOOD: Arguments with stable equality
void goodUsage(WidgetRef ref) {
  // ✅ Class with proper equality
  ref.watch(objectProvider(const SomeClassWithEquals(42)));

  // ✅ Primitive types have value equality
  ref.watch(dataProvider(42));

  // ✅ const lists have value equality
  ref.watch(listProvider(const [42]));

  // ✅ const maps also work
  // ref.watch(mapProvider(const {'key': 42}));
}

// GOOD: Use records for multiple parameters (Dart 3+)
final multiParamProvider = FutureProvider.family<String, (int, String)>((
  ref,
  params,
) async {
  final (id, name) = params;
  return 'User $id: $name';
});

void usingRecords(WidgetRef ref) {
  // ✅ Records have value equality
  ref.watch(multiParamProvider((1, 'John')));
}

// GOOD: Use freezed or equatable for complex classes
// With freezed:
// @freezed
// class UserParams with _$UserParams {
//   const factory UserParams({
//     required int id,
//     required String name,
//   }) = _UserParams;
// }

// Example showing the caching problem
void demonstrateCachingProblem(WidgetRef ref) {
  // These are considered DIFFERENT by Riverpod (bad):
  final a1 = SomeClassWithoutEquals(42);
  final a2 = SomeClassWithoutEquals(42);
  print('Without equals: ${a1 == a2}'); // false!

  // These are considered THE SAME by Riverpod (good):
  final b1 = const SomeClassWithEquals(42);
  final b2 = const SomeClassWithEquals(42);
  print('With equals: ${b1 == b2}'); // true!

  // For lists:
  print('Non-const lists: ${[42] == [42]}'); // false!
  print('Const lists: ${const [42] == const [42]}'); // true!
}
