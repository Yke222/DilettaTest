import 'package:hive/hive.dart';

abstract class LocalDb {
  Future<List<T>> getAllItems<T>({required Future<Box<T>> box});

  Future<bool> contains<T>({required dynamic id, required Future<Box<T>> box});

  Future<void> insertItem<T>({required dynamic key, required T item, required Future<Box<T>> box});

  Future<void> deleteItem<T>({required dynamic key, required Future<Box<T>> box});

  Future<void> clear<T>({required Future<Box<T>> box});
}
