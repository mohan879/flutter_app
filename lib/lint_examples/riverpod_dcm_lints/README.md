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

| #   | File                                                  | Rule                                          | Status               |
| --- | ----------------------------------------------------- | --------------------------------------------- | -------------------- |
| 01  | `01_avoid_ref_read_inside_build.dart`                 | `avoid-ref-read-inside-build`                 | ✅ Triggers lint     |
| 02  | `02_avoid_ref_watch_outside_build.dart`               | `avoid-ref-watch-outside-build`               | ✅ Triggers lint     |
| 03  | `03_use_ref_and_state_synchronously.dart`             | `use-ref-and-state-synchronously`             | ✅ Triggers lint     |
| 04  | `04_use_ref_read_synchronously.dart`                  | `use-ref-read-synchronously`                  | ✅ Triggers lint     |
| 05  | `05_avoid_notifier_constructors.dart`                 | `avoid-notifier-constructors`                 | ✅ Triggers lint     |
| 06  | `06_avoid_public_notifier_properties.dart`            | `avoid-public-notifier-properties`            | ✅ Triggers lint     |
| 07  | `07_avoid_assigning_notifiers.dart`                   | `avoid-assigning-notifiers`                   | ✅ Triggers lint     |
| 08  | `08_avoid_ref_inside_state_dispose.dart`              | `avoid-ref-inside-state-dispose`              | ✅ Triggers lint     |
| 09  | `09_dispose_provided_instances.dart`                  | `dispose-provided-instances`                  | ✅ Triggers lint     |
| 10  | `10_avoid_nullable_async_value_pattern.dart`          | `avoid-nullable-async-value-pattern`          | ✅ Triggers lint     |
| 11  | `11_prefer_immutable_provider_arguments.dart`         | `prefer-immutable-provider-arguments`         | ⚠️ May need code gen |
| 12  | `12_avoid_calling_notifier_members_inside_build.dart` | `avoid-calling-notifier-members-inside-build` | ✅ Triggers lint     |
| 13  | `13_avoid_unnecessary_consumer_widgets.dart`          | `avoid-unnecessary-consumer-widgets`          | ✅ Triggers lint     |

**Note:** File 11 (`prefer-immutable-provider-arguments`) may require
`riverpod_generator` code generation to detect violations properly. The example
follows DCM documentation patterns.

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
