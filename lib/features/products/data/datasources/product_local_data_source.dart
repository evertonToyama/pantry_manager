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

  void error() {
    nestedError();
  }

  void nestedError() {
    throw SqliteException(2067, 'Duplicated error');
  }

  @override
  Future<int> createProduct({
    required String name,
    required String category,
    required bool inPantry,
    required int minQuantity,
  }) async {
    try {
      return await _database.createProduct(
          name, category, inPantry, minQuantity);
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
      return await _database.deleteProduct(id);
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
      return await _database.getAllProducts();
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
      final result = await _database.getProductById(id);

      if (result == null) {
        throw const DatabaseException(
            message: "Product not found", statusCode: 402);
      }

      if (result.minQuantity < 0) {
        throw const DatabaseException(
          message: "Min quantity out of bounds",
          statusCode: 503,
        );
      }

      return result;
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
      return await _database.updateProduct(
        product.id,
        product.name,
        product.category,
        product.inPantry,
        product.minQuantity,
      );
    } catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
