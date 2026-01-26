// ✅ GOOD: Using specific types

// Use specific types instead of Object
void processString(String value) {
  print(value.toUpperCase());
}

void processInt(int value) {
  print(value * 2);
}

// Use sealed classes for union types
sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final String error;
  Failure(this.error);
}

Result<String> getData() {
  return Success('specific result');
}

// Use clear async/sync signatures
Future<String> alwaysAsync() async {
  return 'async result';
}

String alwaysSync() {
  return 'sync result';
}
