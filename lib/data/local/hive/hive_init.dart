import 'package:hive_flutter/hive_flutter.dart';
import 'package:water_tracking/domain/entity/history_entity.dart';

import '../../../core/constants/box_const.dart';
import '../../../core/enum/app_enum.dart';
import '../../../domain/entity/water_entity.dart';

class HiveInit {
  static Future<void> init() async {
    await Hive.initFlutter();
    await registerAdapters();
    await openBoxes();
  }

  static Future<void> registerAdapters() async {
    Hive.registerAdapter(WaterEntityAdapter());
    Hive.registerAdapter(CupSizeAdapter());
    Hive.registerAdapter(TypeDrinkAdapter());
    Hive.registerAdapter(HistoryEntityAdapter());
  }

  static Future<void> openBoxes() async {
    await Hive.openBox<WaterEntity>(BoxConst.water);
    await Hive.openBox<HistoryEntity>(BoxConst.drinkEntries);
  }

  static Future<void> closeBoxes() async {
    await Hive.deleteFromDisk();
    await Hive.close();
  }
}
