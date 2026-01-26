// ignore_for_file: max-imports
// DI setup file - intentionally imports all dependencies to register them.
// This is a valid exception: DI containers must know about all dependencies.

import 'package:get_it/get_it.dart';

// Services
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import '../services/analytics_service.dart';
import '../services/logging_service.dart';

// Repositories
import '../repositories/user_repository.dart';
import '../repositories/product_repository.dart';

final getIt = GetIt.instance;

/// Sets up all dependency injection bindings.
/// This file legitimately needs many imports to register all dependencies.
void setupDI() {
  // Services
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  getIt.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  getIt.registerLazySingleton<AnalyticsService>(() => AnalyticsServiceImpl());
  getIt.registerLazySingleton<LoggingService>(() => LoggingServiceImpl());

  // Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt<ApiService>()),
  );
}
