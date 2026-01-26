// ✅ CORRECT: Widget test using flutter_test
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('widget test can use flutter_test', (tester) async {
    // Widget tests are allowed to use flutter_test
    expect(true, isTrue);
  });
}
