import 'package:hive/hive.dart';
import 'package:water_tracking/data/entity/water_entity.dart';

class WaterRepository {
  Future<void> updateWater(WaterEntity water) async {
    await Hive.box<WaterEntity>('water').put(water.id, water);
  }

}