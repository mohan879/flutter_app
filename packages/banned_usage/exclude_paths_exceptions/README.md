# Exclude Paths Exceptions Example

Demonstrates using `exclude-paths` to create targeted exceptions.

## What This Example Shows

- Banning `ElevatedButton` everywhere except `lib/design_system/`
- Banning `Dio.get/post` everywhere except network layers

## Run Analysis

```bash
dcm analyze lib
```

## When to Use exclude-paths

Use `exclude-paths` when:

- An API is fine in one specific folder but banned elsewhere
- You're creating a wrapper/abstraction layer
- Design system needs to use raw widgets internally
- Network layer needs direct HTTP access

## Project Structure

```
lib/
├── design_system/       # ✅ ElevatedButton allowed here
│   └── ds_button.dart
├── core/network/        # ✅ Dio allowed here
│   └── api_client.dart
└── presentation/        # ❌ Must use wrappers
    └── home_page.dart
```

## Expected Violations

Files in `lib/presentation/` will have violations, while `lib/design_system/`
and `lib/core/network/` are allowed.
