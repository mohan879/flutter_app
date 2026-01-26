# Custom Wrappers Example

Demonstrates banning raw Flutter APIs to enforce custom wrappers that add
analytics, consistent styling, and testability.

## What This Example Shows

- Banning `Navigator.push/pop/pushNamed` to enforce `AppRouter`
- Banning `showDialog` to enforce `AppDialogs.show()`
- Banning `showModalBottomSheet` to enforce `AppBottomSheet.show()`
- Banning `ScaffoldMessenger.showSnackBar` to enforce `AppSnackbar.show()`

## Run Analysis

```bash
dcm analyze lib
```

## Expected Violations

The `navigation.dart` file contains violations for using raw Flutter APIs
instead of custom wrappers.
