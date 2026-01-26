# Platform-Specific Imports Example

Demonstrates isolating platform-specific code (dart:io, dart:html) using naming
conventions.

## Rule Configuration

- dart:html/dart:js only allowed in \*\_web.dart files
- dart:io not allowed in \*\_web.dart files

## Violations

- `lib/bad_shared_code.dart` - imports dart:html ❌
- `lib/file_picker_web.dart` - imports dart:io ❌

## Run

```bash
dcm analyze lib
```
