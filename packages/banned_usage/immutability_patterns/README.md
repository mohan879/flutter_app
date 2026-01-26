# Immutability Patterns Example

Demonstrates banning mutable collection methods to enforce immutable state
management patterns.

## What This Example Shows

- Banning `List.add/addAll/remove/clear/sort` to enforce immutable operations
- Banning `Set.add/remove` to enforce spread operator usage
- Banning `Map.addAll/remove` to enforce immutable map operations

## Run Analysis

```bash
dcm analyze lib
```

## Why Immutability Matters

Mutable collection methods modify data in place, breaking state management
equality checks:

```dart
// ❌ Mutable - BLoC's == comparison sees same reference, UI doesn't rebuild
list.add(item);

// ✅ Immutable - New reference, state change detected
final newList = [...list, item];
```

## Expected Violations

The `mutable_operations.dart` file contains violations for using mutable
collection methods.
