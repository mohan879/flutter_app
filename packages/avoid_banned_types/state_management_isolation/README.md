# State Management Type Isolation

Demonstrates isolating state management types to presentation layer and
enforcing a single solution.

## Rule Configuration

- BLoC types (Bloc, Cubit, BlocProvider, etc.) only allowed in
  `lib/presentation/`
- GetX is banned when using BLoC (pick one solution)

## Violations

- `lib/data/bad_repository.dart` - Uses BLoC types in data layer
- `lib/presentation/getx_violation.dart` - Uses GetX when team standardized on
  BLoC

## Run Analysis

```bash
dcm analyze lib
```
