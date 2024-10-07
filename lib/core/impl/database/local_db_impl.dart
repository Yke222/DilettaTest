import 'package:hive/hive.dart';

import 'local_db.dart';

class LocalDbImpl implements LocalDb {
  @override
  Future<List<T>> getAllItems<T>({required Future<Box<T>> box}) async {
    var mBox = await box;
    return mBox.values.toList();
  }

  @override
  Future<bool> contains<T>({required dynamic id, required Future<Box<T>> box}) async{
    var mBox = await box;
    return mBox.containsKey(id);
  }

  @override
  Future<void> insertItem<T>({required dynamic key, required T item, required Future<Box<T>> box}) async {
    var mBox = await box;
    await mBox.put(key, item);
  }

  @override
  Future<void> deleteItem<T>({required key, required Future<Box<T>> box}) async {
    var mBox = await box;
    await mBox.deleteAt(key);
  }

  @override
  Future<void> clear<T>({required Future<Box<T>> box}) async {
    var mBox = await box;
    await mBox.clear();
  }


}
