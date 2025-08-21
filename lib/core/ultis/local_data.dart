import 'package:hive/hive.dart';

class LocalData {
  final String boxName;

  LocalData({required this.boxName});
  Box<dynamic> get _box => Hive.box(boxName);

  Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<dynamic> getData(String key) async {
    return _box.get(key);
  }

  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }

  Future<List<dynamic>> getAllData() async {
    return _box.values.toList();
  }

  Future<void> clearAllData() async {
    await _box.clear();
  }
}
