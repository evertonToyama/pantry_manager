import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pantry_manager/core/database/database.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/features/lists/data/datasources/list_local_data_source.dart';
import 'package:pantry_manager/features/lists/data/models/list_model.dart';
import 'package:pantry_manager/features/lists/domain/entities/item_entity.dart';
import 'package:pantry_manager/features/lists/domain/entities/store_entity.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';

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
      database.store.insertOne(const StoreData(id: 1, name: "name"));
      database.shoppingList.insertOne(const ShoppingListData(
        id: 1,
        name: "name",
        isFinished: 0,
        idStore: 1,
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
      database.store.insertOne(const StoreData(id: 1, name: "name"));
      database.shoppingList.insertOne(const ShoppingListData(
        id: 1,
        name: "name",
        isFinished: 0,
        idStore: 1,
      ));
      database.product.insertOne(const ProductData(
        id: 1,
        name: "name",
        category: "category",
        inPantry: 1,
        minQuantity: 1,
      ));
      database.item.insertOne(const ItemData(
        id: 1,
        quantity: 1,
        idProduct: 1,
        idList: 1,
        price: 1,
        isPurchased: 1,
      ));

      // ACT
      var result = await datasource.getList(id: 1);

      // ASSERT
      expect(
          result,
          const ListModel(
            id: 1,
            name: "name",
            products: [
              ItemEntity(
                id: 1,
                product: ProductEntity(
                    id: 1,
                    name: "name",
                    category: "category",
                    inPantry: true,
                    minQuantity: 1),
                quantity: 1,
                price: 10,
                isPurchased: true,
              )
            ],
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
        throwsA(const NotFoundDatabaseException()),
      );
    });
  });

  group("update list", () {
    test("success", () async {
      // ARRANGE
      database.store.insertOne(const StoreData(id: 1, name: "name"));
      database.shoppingList.insertOne(const ShoppingListData(
        id: 1,
        name: "name",
        isFinished: 0,
      ));

      // ACT
      var store = const StoreEntity(id: 1, name: "name");
      var list = ListModel(
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
      database.shoppingList.insertOne(const ShoppingListData(
        id: 1,
        name: "name",
        isFinished: 0,
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
