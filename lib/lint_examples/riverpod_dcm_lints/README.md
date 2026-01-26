# Riverpod DCM Lints Examples

This folder collects runnable examples (Bad + Good) that demonstrate the
Riverpod-related DCM lint rules discussed in the article:

> Read full article:
> ["Riverpod Best Practices You're Probably Missing (Road to Flutter Production-Ready State Management)"](https://dcm.dev/blog)

Use these examples to learn the lints, reproduce issues, or integrate into
AI-assisted tooling and test harnesses.

DCM MCP server integration docs: Here is how you can integrate
[DCM MCP and Dart MCP server](https://dcm.dev/docs/ide-integrations/mcp-server/)

## Files (in article order):

- `01_avoid_ref_read_inside_build.dart` — Demonstrates
  `avoid-ref-read-inside-build` (subscribe when building UI).
- `02_avoid_ref_watch_outside_build.dart` — Demonstrates
  `avoid-ref-watch-outside-build` (avoid subscriptions in callbacks).
- `03_use_ref_and_state_synchronously.dart` — Demonstrates
  `use-ref-and-state-synchronously` (check mounted after async gaps).
- `04_use_ref_read_synchronously.dart` — Demonstrates
  `use-ref-read-synchronously` (check mounted before ref.read after async).
- `05_avoid_notifier_constructors.dart` — Demonstrates
  `avoid-notifier-constructors` (use build method instead).
- `06_avoid_public_notifier_properties.dart` — Demonstrates
  `avoid-public-notifier-properties` (everything goes through state).
- `07_avoid_assigning_notifiers.dart` — Demonstrates `avoid-assigning-notifiers`
  (get fresh reference after async gaps).
- `08_avoid_ref_inside_state_dispose.dart` — Demonstrates
  `avoid-ref-inside-state-dispose` (don't use ref in dispose).
- `09_dispose_provided_instances.dart` — Demonstrates
  `dispose-provided-instances` (cleanup via onDispose).
- `10_avoid_nullable_async_value_pattern.dart` — Demonstrates
  `avoid-nullable-async-value-pattern` (use hasValue for nullable types).
- `11_prefer_immutable_provider_arguments.dart` — Demonstrates
  `prefer-immutable-provider-arguments` (stable equality for family args).
- `12_avoid_calling_notifier_members_inside_build.dart` — Demonstrates
  `avoid-calling-notifier-members-inside-build` (side effects in callbacks).
- `13_avoid_unnecessary_consumer_widgets.dart` — Demonstrates
  `avoid-unnecessary-consumer-widgets` (use StatelessWidget if ref not needed).

## Usage

- Open the examples in your editor to see the Bad vs Good code.
- The "Bad" examples intentionally trigger lints so you can test analyzer/plugin
  behavior.
- Use these files with AI-assisted tooling or the DCM MCP integration to
  generate fixes or test suggestions.

## License & Attribution

Based on the article "Riverpod Best Practices You're Probably Missing (Road to
Flutter Production-Ready State Management)" from dcm.dev/blog. Examples were
adapted to be runnable in this repository.
