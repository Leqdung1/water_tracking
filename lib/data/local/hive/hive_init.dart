import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/constants/box_const.dart';
import '../../../domain/entity/water_entity.dart';

class HiveInit {
  static Future<void> init() async {
    await Hive.initFlutter();
    await registerAdapters();
    await openBoxes();
  }

  static Future<void> registerAdapters() async {
    Hive.registerAdapter(WaterEntityAdapter());
  }

  static Future<void> openBoxes() async {
    await Hive.openBox<WaterEntity>(BoxConst.water);
  }

  static Future<void> closeBoxes() async {
    await Hive.deleteFromDisk();
    await Hive.close();
  }
}
