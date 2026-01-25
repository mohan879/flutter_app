// ✅ Valid exports - shared UI components
export 'src/button.dart';

// ❌ Violation: Shared UI must not depend on feature packages
export 'package:feature_auth/feature_auth.dart'; // expect lint: feature dependency
