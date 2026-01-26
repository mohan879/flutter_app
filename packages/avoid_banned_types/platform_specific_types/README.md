# Platform-Specific Type Control

Demonstrates isolating platform-specific types to appropriate files.

## Rule Configuration

- `MethodChannel`, `EventChannel`, `BasicMessageChannel` only allowed in
  `lib/platform/`
- Cupertino widgets only allowed in `*_ios.dart` files

## Violations

- `lib/platform_usage.dart` - Uses MethodChannel outside platform folder
- `lib/bad_button.dart` - Uses CupertinoButton outside iOS-specific file

## Run Analysis

```bash
dcm analyze lib
```
