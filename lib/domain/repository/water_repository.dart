import 'package:hive/hive.dart';
import 'package:water_tracking/domain/entity/water_entity.dart';

import '../../core/constants/box_const.dart';

class WaterRepository {
  Box<WaterEntity> get waterBox => Hive.box<WaterEntity>(BoxConst.water);

  Future<void> save(WaterEntity water) async {
    await waterBox.add(water);
  }

  Future<void> delete(String id) async {
    await waterBox.delete(id);
  }

  Future<WaterEntity?> get(String id) async {
    return waterBox.get(id);
  }

  Future<void> update(WaterEntity water) async {
    await waterBox.put(water.id, water);
  }

  Future<List<WaterEntity>> getAll() async {
    try {
      return waterBox.values.toList();
    } catch (e) {
      print('Error getting all water entities: $e');
      return [];
    }
  }
}
