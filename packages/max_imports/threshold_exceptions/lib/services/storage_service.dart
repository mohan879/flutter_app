/// Abstract storage service interface.
abstract class StorageService {
  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
}

/// Storage service implementation.
class StorageServiceImpl implements StorageService {
  final Map<String, String> _store = {};

  @override
  Future<void> write(String key, String value) async {
    await Future.delayed(const Duration(milliseconds: 10));
    _store[key] = value;
  }

  @override
  Future<String?> read(String key) async {
    await Future.delayed(const Duration(milliseconds: 10));
    return _store[key];
  }

  @override
  Future<void> delete(String key) async {
    await Future.delayed(const Duration(milliseconds: 10));
    _store.remove(key);
  }
}
