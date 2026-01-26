// ❌ BAD: BLoC types used in data layer
import 'package:flutter_bloc/flutter_bloc.dart';

class BadUserRepository {
  // ❌ Violation: Cubit in data layer
  final Cubit userCubit;

  BadUserRepository(this.userCubit);

  // ❌ Violation: Bloc type reference in data layer
  void updateBloc(Bloc bloc) {
    // Data layer shouldn't know about BLoC
  }
}
