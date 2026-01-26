# Clean Architecture Type Boundaries

Demonstrates enforcing type boundaries in Clean Architecture layers.

## Rule Configuration

- Domain layer cannot use Flutter types (Widget, BuildContext, Color, State,
  Bloc, Cubit)
- Presentation layer cannot use data layer types (Dto, DataSource, ApiClient,
  Database)

## Violations

- `lib/domain/bad_entity_widget.dart` - Uses Widget, BuildContext, Color in
  domain
- `lib/presentation/bad_screen.dart` - Uses UserDto data type in presentation

## Run Analysis

```bash
dcm analyze lib
```
