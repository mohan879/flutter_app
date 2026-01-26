import 'dart:async';

// ❌ BAD: Using Object loses type safety
void processAnything(Object value) {
  // No compile-time checks, must use runtime checks
  if (value is String) {
    print(value.toUpperCase());
  }
}

// ❌ BAD: Object as return type
Object getData() {
  return 'could be anything';
}

// ❌ BAD: FutureOr is confusing and rarely needed
FutureOr<String> maybeAsync() {
  return 'sync result';
}

// ❌ BAD: FutureOr as parameter
void consumeResult(FutureOr<int> result) {
  // Consumers don't know if they need to await
}
