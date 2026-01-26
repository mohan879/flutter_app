// Simulated state management types

class Get {
  static T put<T>(T dependency) => dependency;
  static T find<T>() => throw UnimplementedError();
}

class Provider<T> {
  static T of<T>(dynamic context, {bool listen = true}) =>
      throw UnimplementedError();
}

class BlocBase<State> {
  State state;
  BlocBase(this.state);

  void emit(State newState) {
    state = newState;
  }
}

class Bloc<Event, State> extends BlocBase<State> {
  Bloc(super.state);
}

class Cubit<State> extends BlocBase<State> {
  Cubit(super.state);
}
