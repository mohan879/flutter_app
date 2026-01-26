# Design System Widget Enforcement Example

Demonstrates banning raw Flutter widgets to enforce design system usage.

## What This Example Shows

- Banning `ElevatedButton()` to enforce `DSButton.primary()`
- Banning `TextButton()` to enforce `DSButton.text()`
- Banning `TextField()` to enforce `DSTextField`
- Banning `Text()` to enforce `DSText` (warning severity)
- Banning `Image.network()` to enforce `DSImage.network()`

## Run Analysis

```bash
dcm analyze lib
```

## Why Design System Enforcement Matters

Raw Flutter widgets lack:

- Brand colors and consistent styling
- Loading states and error handling
- Accessibility defaults
- Analytics integration

## Expected Violations

The `raw_widgets.dart` file contains violations for using raw Flutter widgets
instead of design system components.
