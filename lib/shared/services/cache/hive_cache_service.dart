import 'package:diletta_shop/shared/services/cache/cache_service.dart';
import 'package:hive/hive.dart';

class HiveCacheService implements CacheService {
  final Box _box;

  HiveCacheService({required Box box}) : _box = box;

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  @override
  Future<T?> get<T>(String key) async {
    return _box.get(key) as T?;
  }

  @override
  Future<void> put<T>(String key, T value) async {
    await _box.put(key, value);
  }
}