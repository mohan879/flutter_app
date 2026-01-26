# State Management Boundaries Example

Demonstrates keeping state management (BLoC, Riverpod, Provider) in the
presentation layer only.

## Rule Configuration

Ban all state management packages from domain and data layers.

## Violations

- `lib/domain/use_case.dart` - imports `package:flutter_bloc/flutter_bloc.dart`
  ❌
- `lib/data/source.dart` - imports `package:riverpod/riverpod.dart` ❌

## Run

```bash
dcm analyze lib
```
