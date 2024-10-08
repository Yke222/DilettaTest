abstract class CacheService {
  Future<void> put<T>(String key, T value);
  Future<T?> get<T>(String key);
  Future<void> delete(String key);
}