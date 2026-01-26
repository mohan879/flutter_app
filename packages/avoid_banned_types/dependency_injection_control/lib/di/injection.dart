// ✅ GOOD: GetIt allowed in DI configuration files
import 'package:get_it/get_it.dart';
import '../presentation/good_service.dart';

final getIt = GetIt.instance;

class UserRepositoryImpl implements UserRepository {
  @override
  Future<String> getUser() async => 'John Doe';
}

void setupDependencies() {
  // GetIt usage is fine in DI setup files
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerFactory(() => GoodUserService(getIt<UserRepository>()));
}
