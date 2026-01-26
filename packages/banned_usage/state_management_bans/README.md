# State Management Method Bans Example

Demonstrates banning anti-patterns in state management libraries.

## What This Example Shows

- Banning `Get.put` to enforce `GetIt` for dependency injection
- Banning `Get.find` to enforce proper DI patterns
- Banning `Provider.of` to enforce `context.read()/watch()`
- Banning direct `BlocBase.emit` calls from outside BLoC

## Run Analysis

```bash
dcm analyze lib
```

## Why These Bans Matter

| Anti-Pattern           | Why It's Bad              | Solution                 |
| ---------------------- | ------------------------- | ------------------------ |
| `Get.put()` everywhere | Hard to test, implicit DI | Constructor injection    |
| `Get.find()` scattered | Tight coupling            | GetIt or injectable      |
| `Provider.of()`        | Verbose, easy to misuse   | `context.read()/watch()` |
| Direct `bloc.emit()`   | Bypasses event handling   | Dispatch events          |

## Expected Violations

The `usage.dart` file contains violations for state management anti-patterns.
