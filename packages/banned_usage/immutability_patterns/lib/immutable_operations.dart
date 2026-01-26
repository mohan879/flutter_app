// ✅ Good: Using immutable operations for state management

class TodoStateImmutable {
  List<String> todos = [];
  Set<String> tags = {};
  Map<String, int> counts = {};

  // ✅ Correct immutable operations

  void addTodo(String todo) {
    // Creates new list reference
    todos = [...todos, todo];
  }

  void addMultipleTodos(List<String> newTodos) {
    // Creates new list with all items
    todos = [...todos, ...newTodos];
  }

  void removeTodo(String todo) {
    // Creates new filtered list
    todos = todos.where((e) => e != todo).toList();
  }

  void clearTodos() {
    // Assigns new empty list
    todos = [];
  }

  void sortTodos() {
    // Creates new sorted list (with collection package)
    todos = [...todos]..sort();
    // Or with collection package: todos = todos.sorted();
  }

  void addTag(String tag) {
    // Creates new set with item
    tags = {...tags, tag};
  }

  void removeTag(String tag) {
    // Creates new filtered set
    tags = tags.where((e) => e != tag).toSet();
  }

  void mergeCounts(Map<String, int> newCounts) {
    // Creates new merged map
    counts = {...counts, ...newCounts};
  }

  void removeCount(String key) {
    // Creates new map without key
    counts = Map.fromEntries(counts.entries.where((e) => e.key != key));
  }
}
