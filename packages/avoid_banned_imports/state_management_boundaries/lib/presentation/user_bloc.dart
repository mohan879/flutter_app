// ✅ CORRECT: Presentation layer can use state management
import 'package:flutter_bloc/flutter_bloc.dart';

/// User BLoC - state management belongs here
class UserBloc extends Cubit<UserState> {
  UserBloc() : super(UserInitial());

  void loadUser(String id) {
    emit(UserLoaded(id: id, name: 'John Doe'));
  }
}

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final String id;
  final String name;

  UserLoaded({required this.id, required this.name});
}
