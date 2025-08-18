import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

mixin TableMixin on Table {
  IntColumn get id => integer().autoIncrement()();
}

@DataClassName("ProductData")
class ProductDB extends Table with TableMixin {
  TextColumn get name => text().withLength(min: 1, max: 32)();
  TextColumn get category => text().withLength(min: 1, max: 16)();
  BoolColumn get inPantry => boolean()();
  IntColumn get minQuantity => integer()();
}

@DataClassName("ItemData")
class ItemDB extends Table with TableMixin {
  RealColumn get price => real()();
  IntColumn get quantity => integer()();
  BoolColumn get isPurchased => boolean()();
  IntColumn get product => integer().references(ProductDB, #id)();
  IntColumn get list => integer().references(ListDB, #id)();
}

@DataClassName("StoreData")
class StoreDB extends Table with TableMixin {
  TextColumn get name => text().withLength(min: 1, max: 32)();
}

@DataClassName("ListData")
class ListDB extends Table with TableMixin {
  TextColumn get name => text().withLength(min: 1, max: 32)();
  BoolColumn get isFinished => boolean()();
  IntColumn get store => integer().references(StoreDB, #id)();
}

@DriftDatabase(tables: [ProductDB, ItemDB, StoreDB, ListDB])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: "Pantry",
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
