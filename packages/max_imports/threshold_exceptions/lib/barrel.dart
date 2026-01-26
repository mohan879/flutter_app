// ignore_for_file: max-imports
// Barrel file - intentionally exports all public APIs from one import.
// This is a valid exception: barrel files consolidate exports.

/// Barrel file exporting all public APIs from this package.
library;

// Services
export 'services/api_service.dart';
export 'services/auth_service.dart';
export 'services/storage_service.dart';
export 'services/analytics_service.dart';
export 'services/logging_service.dart';

// Repositories
export 'repositories/user_repository.dart';
export 'repositories/product_repository.dart';

// Features
export 'feature/feature.dart';
