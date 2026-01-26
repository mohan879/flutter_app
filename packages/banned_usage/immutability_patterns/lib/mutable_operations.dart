// ❌ Bad: Using mutable collection methods that break state management

class TodoState {
  List<String> todos = [];
  Set<String> tags = {};
  Map<String, int> counts = {};

  // ❌ LINT violations - mutable operations

  void addTodo(String todo) {
    // LINT: Use [...list, item] for immutable list operations.
    todos.add(todo);
  }

  void addMultipleTodos(List<String> newTodos) {
    // LINT: Use [...list, ...otherList] for immutable list operations.
    todos.addAll(newTodos);
  }

  void removeTodo(String todo) {
    // LINT: Use list.where((e) => e != item).toList() for immutable operations.
    todos.remove(todo);
  }

  void clearTodos() {
    // LINT: Assign an empty list instead: list = [];
    todos.clear();
  }

  void sortTodos() {
    // LINT: Use list.sorted() from collection package for immutable sorting.
    todos.sort();
  }

  void addTag(String tag) {
    // LINT: Use {...set, item} for immutable set operations.
    tags.add(tag);
  }

  void removeTag(String tag) {
    // LINT: Use set.where((e) => e != item).toSet() for immutable operations.
    tags.remove(tag);
  }

  void mergeCounts(Map<String, int> newCounts) {
    // LINT: Use {...map, ...otherMap} for immutable map operations.
    counts.addAll(newCounts);
  }

  void removeCount(String key) {
    // LINT: Use Map.fromEntries(...) for immutable operations.
    counts.remove(key);
  }
}
