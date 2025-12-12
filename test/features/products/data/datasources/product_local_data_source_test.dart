import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pantry_manager/core/database/database.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/features/products/data/datasources/product_local_data_source.dart';
import 'package:pantry_manager/features/products/data/models/product_model.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';

void main() {
  late AppDatabase database;
  late ProductLocalDataSource datasource;

  const int tId = 1;
  const String tName = "Test name";
  const String tCategory = "Test category";
  const bool tInPantry = false;
  const int tMinQuantity = 0;

  const ProductEntity tProduct = ProductEntity(
    id: tId,
    name: tName,
    category: tCategory,
    inPantry: tInPantry,
    minQuantity: tMinQuantity,
  );

  const ProductModel tModel = ProductModel(
    id: tId,
    name: tName,
    category: tCategory,
    inPantry: tInPantry,
    minQuantity: tMinQuantity,
  );

  const ProductData tData = ProductData(
    id: tId,
    name: tName,
    category: tCategory,
    inPantry: 1,
    minQuantity: tMinQuantity,
  );

  const DatabaseException tException = DatabaseException(
    message: "Database error",
    statusCode: 500,
  );

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    datasource = ProductLocalDataSourceImpl(database);
  });

  tearDown(() {
    database.close();
  });

  group("create product", () {
    test("should create product successfully and return id", () async {
      final result = await datasource.createProduct(
        name: tName,
        category: tCategory,
        inPantry: tInPantry,
        minQuantity: tMinQuantity,
      );

      expect(result, equals(1));
    });

    test("fail duplicated product", () async {
      // ARRANGE
      // ACT
      await datasource.createProduct(
        name: tName,
        category: tCategory,
        inPantry: tInPantry,
        minQuantity: tMinQuantity,
      );

      // ASSERT
      expect(
          () => datasource.createProduct(
                name: tName,
                category: tCategory,
                inPantry: tInPantry,
                minQuantity: tMinQuantity,
              ),
          throwsA(const DatabaseException(
            message: 'Duplicated name',
            statusCode: 502,
          )));
    });
  });

  group("get all products", () {
    test("should return an empty list when no products exist", () async {
      final result = await datasource.getAllProducts();

      expect(result, isEmpty);
    });

    test("should return all products when they exist", () async {
      database.product.insertOne(tData);
      final result = await datasource.getAllProducts();

      expect(result, hasLength(1));
      expect(result[0].id, 1);
    });
  });

  group("get product", () {
    test("success", () async {
      await database.createProduct(
          tData.name, tData.category, tData.inPantry == 1, tData.minQuantity);
      final result = await datasource.getProduct(id: tId);

      expect(result.id, equals(tId));
    });

    test("fail", () async {
      // ACT
      database.product.insertOne(tData);

      // ASSERT
      expect(
          () => datasource.getProduct(id: 2),
          throwsA(const DatabaseException(
            message: "Product not found",
            statusCode: 402,
          )));
    });
  });

  group("update product", () {
    test("success", () async {
      database.product.insertOne(tData);
      final result = await datasource.updateProduct(
          product: tModel.copyWith(category: "New Category"));

      expect(result, equals(1));
    });

    test("fail", () async {
      database.product.insertOne(tData);
      const newModel = ProductModel(
        id: 2,
        name: "New Name",
        category: "New Category",
        inPantry: false,
        minQuantity: 0,
      );
      final result = await datasource.updateProduct(product: newModel);

      expect(result, equals(0));
    });
  });

  group("delete product", () {
    test("success", () async {
      // ARRANGE
      database.product.insertOne(tData);

      // ACT
      var result = await datasource.deleteProduct(id: tData.id);

      // ASSERT
      expect(result, 1);
    });

    test("fail", () async {
      // ACT
      var result = await datasource.deleteProduct(id: tId);

      // ASSERT
      expect(result, 0);
    });
  });
}
