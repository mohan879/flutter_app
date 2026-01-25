// ✅ Valid exports - data layer implementations
export 'dtos/user_dto.dart';

// ❌ Violation: Data layer cannot export presentation code
export '../presentation/pages/user_page.dart'; // expect lint: presentation leakage
