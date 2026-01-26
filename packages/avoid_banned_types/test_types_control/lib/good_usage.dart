// ✅ GOOD: Using abstract interface in production
import 'repository.dart';

class GoodService {
  // ✅ Using abstract interface, not mock implementation
  final UserRepository _repository;

  GoodService(this._repository);

  Future<String> getUser() async {
    return _repository.getUser();
  }
}
