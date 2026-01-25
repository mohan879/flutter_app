// ✅ Valid exports - feature's own code
export 'src/auth_page.dart';

// ❌ Violation: Features should not re-export other feature packages
export 'package:feature_home/feature_home.dart'; // expect lint: cross-feature leak
