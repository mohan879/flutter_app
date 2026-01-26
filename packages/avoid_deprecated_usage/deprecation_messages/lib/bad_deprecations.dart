// ❌ BAD: Poorly documented deprecations

// ❌ Bad: No replacement mentioned
@deprecated
void oldFunction() {}

// ❌ Bad: Vague message, no version
@Deprecated('Do not use')
void anotherOldFunction() {}

// ❌ Bad: No migration path
@Deprecated('This is old')
class OldClass {
  void doWork() {}
}
