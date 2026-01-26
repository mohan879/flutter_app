// Code that will fail CI due to deprecated usage
import 'deprecated_apis.dart';

class CiFailingCode {
  // ❌ Will cause CI to fail
  final OldService _service = OldService();

  // ❌ Will cause CI to fail
  final OldRepository _repo = OldRepository();

  void run() {
    _service.execute();
    _repo.getAll();
  }
}
