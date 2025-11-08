import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:pantry_manager/core/database/database.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/features/products/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<int> createProduct({
    required String name,
    required String category,
    required bool inPantry,
    required int minQuantity,
  });

  Future<List<ProductModel>> getAllProducts();

  Future<ProductModel> getProduct({required int id});

  Future<int> updateProduct({required ProductModel product});

  Future<int> deleteProduct({required int id});
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final AppDatabase _database;

  ProductLocalDataSourceImpl(this._database);

  @override
  Future<int> createProduct({
    required String name,
    required String category,
    required bool inPantry,
    required int minQuantity,
  }) async {
    try {
      return await _database.into(_database.productDB).insert(
          ProductDBCompanion.insert(
            name: name,
            category: category,
            inPantry: inPantry,
            minQuantity: minQuantity,
          ),
          mode: InsertMode.insert);
    } on SqliteException catch (ex) {
      if (ex.extendedResultCode == 2067) {
        throw const DatabaseException(
          message: "Duplicated name",
          statusCode: 502,
        );
      }

      throw DatabaseException(
        message: ex.message,
        statusCode: ex.extendedResultCode,
      );
    } catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  @override
  Future<int> deleteProduct({required int id}) async {
    try {
      final result = await (_database.delete(_database.productDB)
            ..where((tb) => tb.id.equals(id)))
          .go();

      return result;
    } catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final result = await _database.select(_database.productDB).get();

      return ProductMapper.fromDriftDataList(result);
    } catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  @override
  Future<ProductModel> getProduct({required int id}) async {
    try {
      final result = await (_database.select(_database.productDB)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (result == null) {
        throw const DatabaseException(
            message: "Product not found", statusCode: 402);
      }

      if (result.minQuantity <= 0) {
        throw const DatabaseException(
          message: "Min quantity out of bounds",
          statusCode: 503,
        );
      }

      return ProductMapper.fromDriftData(result);
    } on SqliteException catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  @override
  Future<int> updateProduct({required ProductModel product}) async {
    try {
      final result = (_database.update(_database.productDB)
            ..where((tbl) => tbl.id.equals(product.id)))
          .write(ProductMapper.toDriftCompanion(product));

      return result;
    } catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
