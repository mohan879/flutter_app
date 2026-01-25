// ✅ Valid exports - core utilities
export 'logging.dart';

// ❌ Violations: Core must not export feature or app packages
export 'package:feature_home/feature_home.dart'; // expect lint: feature package
export 'package:app/main.dart'; // expect lint: app package
