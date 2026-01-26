// ❌ VIOLATION: Unit test importing Flutter
import 'package:flutter_test/flutter_test.dart';

import '../../lib/good_service.dart';

void main() {
  // Unit tests should use package:test, not flutter_test
  testWidgets('should fetch data', (tester) async {
    final service = GoodService();
    final result = await service.fetchData();
    expect(result, 'Real data');
  });
}
