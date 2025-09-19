
import 'package:hive/hive.dart';
import 'package:water_tracking/core/constants/box_const.dart';
import 'package:water_tracking/domain/entity/history_entity.dart';

class HistoryRepository {
  final Box<HistoryEntity> drinkEntryBox = Hive.box<HistoryEntity>(BoxConst.drinkEntries);

  Future<void> save(HistoryEntity drinkEntry) async {
    await drinkEntryBox.add(drinkEntry);
  }

  Future<void> delete(String id) async {
    await drinkEntryBox.delete(id);
  }

  Future<HistoryEntity?> get(String id) async {
    return drinkEntryBox.get(id);
  }

  Future<void> update(HistoryEntity drinkEntry) async {
    await drinkEntryBox.put(drinkEntry.id, drinkEntry);
  }

  Future<List<HistoryEntity>> getAll() async {
    return drinkEntryBox.values.toList();
  }

  Future<List<HistoryEntity>> getByDate(DateTime date) async {
    final allEntries = await getAll();
    return allEntries.where((entry) {
      return entry.date.year == date.year &&
             entry.date.month == date.month &&
             entry.date.day == date.day;
    }).toList();
  }

  Future<List<HistoryEntity>> getByDateRange(DateTime startDate, DateTime endDate) async {
    final allEntries = await getAll();
    return allEntries.where((entry) {
      return entry.date.isAfter(startDate.subtract(const Duration(days: 1))) &&
             entry.date.isBefore(endDate.add(const Duration(days: 1)));
    }).toList();
  }
}