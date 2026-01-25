// ✅ Valid exports - domain entities only
export 'entities/user.dart';

// ❌ Violations: Domain layer cannot export data, presentation, or Flutter code
export '../data/dtos/user_dto.dart'; // expect lint: data leakage
export '../presentation/pages/user_page.dart'; // expect lint: presentation leakage
export 'package:flutter/widgets.dart'; // expect lint: flutter dependency
