import 'state_types.dart';

// ❌ Bad: Using state management anti-patterns

class UserService {
  UserService() {
    // LINT: Use GetIt or injectable for dependency injection, not Get.put.
    Get.put(this);
  }
}

class ApiService {}

void setupDependencies() {
  // LINT: Use GetIt or injectable for dependency injection, not Get.put.
  Get.put(ApiService());

  // LINT: Use GetIt or injectable for dependency injection, not Get.put.
  Get.put(UserService());
}

void someFunction() {
  // LINT: Use GetIt.I<T>() or constructor injection instead of Get.find.
  final api = Get.find<ApiService>();

  // LINT: Use GetIt.I<T>() or constructor injection instead of Get.find.
  final user = Get.find<UserService>();
}

// Simulated context
class BuildContext {}

void widgetBuild(BuildContext context) {
  // LINT: Use context.read() or context.watch() instead of Provider.of.
  final api = Provider.of<ApiService>(context);

  // LINT: Use context.read() or context.watch() instead of Provider.of.
  final user = Provider.of<UserService>(context, listen: false);
}

// Counter state for BLoC example
class CounterState {
  final int count;
  CounterState(this.count);
}

class CounterBloc extends Bloc<String, CounterState> {
  CounterBloc() : super(CounterState(0));
}

void badBlocUsage(CounterBloc bloc) {
  // LINT: Use emitter from event handler, not direct emit calls from outside BLoC.
  bloc.emit(CounterState(5));
}
