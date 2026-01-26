// Code using deprecated APIs
// Will be ERROR in CI, WARNING in local development
import 'deprecated_apis.dart';

class MyService {
  // ❌ Uses deprecated class
  final DeprecatedService _service = DeprecatedService();

  void run() {
    _service.doWork();
    // ❌ Uses deprecated function
    oldProcess();
  }
}
