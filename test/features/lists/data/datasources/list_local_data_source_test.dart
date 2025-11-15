import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pantry_manager/core/database/database.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/features/lists/data/datasources/list_local_data_source.dart';
import 'package:pantry_manager/features/lists/domain/entities/list_entity.dart';
import 'package:pantry_manager/features/lists/domain/entities/store_entity.dart';

/*
create
- success
- fail

get all
- success
- fail: empty
- fail

get
- success
- fail: id not found
- fail

update
- success
- fail: id not found
- fail

delete
- success
- fail: id not found
*/

void main() {
  late AppDatabase database;
  late ListLocalDataSourceImpl datasource;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    datasource = ListLocalDataSourceImpl(database);
  });

  tearDown(() {
    database.close();
  });

  group("create list", () {
    test("success", () async {
      // ARRANGE
      // ACT
      var result = await datasource.createList(name: "name");

      // ASSERT
      expect(result, 1);
    });
  });

  group("get all lists", () {
    test("success", () async {
      // ARRANGE
      database.listDB.insertOne(const ListData(
        id: 1,
        name: "name",
        isFinished: false,
        store: 1,
      ));

      // ACT
      var result = await datasource.getAllLists();

      // ASSERT
      expect(result, hasLength(1));
      expect(result[0].id, 1);
    });
    test("success - empty", () async {
      // ARRANGE
      // ACT
      var result = await datasource.getAllLists();

      // ASSERT
      expect(result, isEmpty);
    });
  });

  group("get list", () {
    test("success", () async {
      // ARRANGE
      database.listDB.insertOne(const ListData(
        id: 1,
        name: "name",
        isFinished: false,
        store: 1,
      ));
      database.storeDB.insertOne(const StoreData(id: 1, name: "name"));

      // ACT
      var result = await datasource.getList(id: 1);

      // ASSERT
      expect(
          result,
          const ListEntity(
            id: 1,
            name: "name",
            products: [],
            store: StoreEntity(id: 1, name: "name"),
            isFinished: false,
          ));
    });
    test("fail - id not found", () async {
      // ARRANGE
      // ACT
      // ASSERT
      expect(
          () => datasource.getList(id: 1),
          throwsA(const DatabaseException(
            message: "List not found",
            statusCode: 402,
          )));
    });
  });

  group("update list", () {
    test("success", () async {
      // ARRANGE
      database.storeDB.insertOne(const StoreData(id: 1, name: "name"));
      database.listDB.insertOne(const ListData(
        id: 1,
        name: "name",
        isFinished: false,
        store: 1,
      ));

      // ACT
      var store = const StoreEntity(id: 1, name: "name");
      var list = ListEntity(
        id: 1,
        name: "name",
        products: const [],
        store: store,
        isFinished: false,
      );
      var result = await datasource.updateList(list);

      // ASSERT
      expect(result, 1);
    });
  });

  group("delete list", () {
    test("success", () async {
      // ARRANGE
      database.listDB.insertOne(const ListData(
        id: 1,
        name: "name",
        isFinished: false,
        store: 1,
      ));

      // ACT
      var result = await datasource.deleteList(1);

      // ASSERT
      expect(result, 1);
    });
    test("fail", () async {
      // ARRANGE
      // ACT
      var result = await datasource.deleteList(1);

      // ASSERT
      expect(result, 0);
    });
  });
}
