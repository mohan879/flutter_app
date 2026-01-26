// ❌ VIOLATION: Domain layer importing state management
import 'package:flutter_bloc/flutter_bloc.dart';

/// Use case that incorrectly depends on BLoC
class GetUserUseCase extends Cubit<String> {
  GetUserUseCase() : super('');

  void execute(String userId) {
    emit(userId);
  }
}
