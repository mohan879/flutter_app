// ✅ Valid exports - public API
export 'src/models/user.dart';
export 'src/models/product.dart';

// ❌ Entry 1: Internal implementations (paths: lib/my_package.dart)
export 'src/internal/helpers.dart'; // expect lint: internal folder
export 'src/internal/utils_impl.dart'; // expect lint: _impl implementation detail

// ❌ Entry 2: Test utilities and generated files (paths: lib/*.dart)
export 'src/testing/mock_api_test.dart'; // expect lint: test utility leak
export 'src/models/user.g.dart'; // expect lint: generated file
export 'src/models/product.freezed.dart'; // expect lint: freezed generated file
