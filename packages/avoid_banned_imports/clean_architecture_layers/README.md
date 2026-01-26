# Clean Architecture Layers Example

Demonstrates enforcing clean architecture layer boundaries with
`avoid-banned-imports`.

## Rule Configuration

- Domain layer: No Flutter/UI imports, no data layer imports
- Data layer: No presentation layer imports
- Presentation layer: Can import all layers

## Violations

- `lib/domain/user_entity.dart` - imports `package:flutter/foundation.dart` ❌
- `lib/domain/user_repository.dart` - imports from data layer ❌
- `lib/data/user_datasource.dart` - imports from presentation layer ❌

## Run

```bash
dcm analyze lib
```
