// Code written before package upgrade - would be in baseline
import 'package_apis.dart';

class PreUpgradeService {
  // ❌ Uses deprecated class (known, in baseline)
  final OldApiClient _client = OldApiClient();

  Future<String> getData() async {
    return _client.fetch('/api/data');
  }
}
