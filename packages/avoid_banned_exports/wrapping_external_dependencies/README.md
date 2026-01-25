# Wrapping Third-Party Dependencies Example

Demonstrates how
[`avoid-banned-exports`](https://dcm.dev/docs/rules/common/avoid-banned-exports/)
prevents leaking third-party types into your public API, encouraging wrapper
abstractions instead.

## What This Example Shows

This package demonstrates preventing external library leakage with two config
entries:

**Entry 1 - HTTP clients:**

- Blocks re-exporting `package:dio/*`
- Prevents `package:http/*` leakage
- Stops `package:retrofit/*` from public API

**Entry 2 - Database libraries:**

- Blocks `package:sqflite/*`
- Prevents `package:hive/*` leakage
- Stops `package:drift/*` and `package:isar/*`

## Configuration

See [`analysis_options.yaml`](./analysis_options.yaml):

```yaml
dcm:
  rules:
    - avoid-banned-exports:
        entries:
          # Don't leak HTTP client types into your public API
          - paths: ['lib/my_package\.dart']
            deny:
              - 'package:dio/.*'
              - 'package:http/.*'
              - 'package:retrofit/.*'
            message:
              'Wrap HTTP clients behind your own abstractions instead of
              re-exporting them.'
            severity: error

          # Don't leak database types
          - paths: ['lib/my_package\.dart']
            deny:
              - 'package:sqflite/.*'
              - 'package:hive/.*'
              - 'package:drift/.*'
              - 'package:isar/.*'
            message: 'Database libraries are implementation details.'
            severity: error
```

## Expected Violations

[`lib/my_package.dart`](./lib/my_package.dart) leaks third-party types:

```dart
// ❌ Entry 1: HTTP client types
export 'package:dio/dio.dart';           // Dio leakage
export 'package:http/http.dart';         // http leakage
export 'package:retrofit/retrofit.dart'; // retrofit leakage

// ❌ Entry 2: Database libraries
export 'package:sqflite/sqflite.dart';   // sqflite leakage
export 'package:hive/hive.dart';         // hive leakage
export 'package:drift/drift.dart';       // drift leakage
export 'package:isar/isar.dart';         // isar leakage
```

Instead, export your own abstraction:

```dart
export 'src/api_client.dart'; // ✅ Your abstraction
```

## Run the Example

```bash
dcm analyze lib
```

Expected output: 7 error issues

## Learn More

Read the full rule documentation at
[DCM: avoid-banned-exports](https://dcm.dev/docs/rules/common/avoid-banned-exports/)

[← Back to examples](../README.md)
