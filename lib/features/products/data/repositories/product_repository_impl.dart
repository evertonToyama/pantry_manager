import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/products/data/datasources/product_local_data_source.dart';
import 'package:pantry_manager/features/products/data/repositories/product_mapper.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/create_product_params.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_info_params.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_pantry_params.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> createProduct(
      CreateProductParams params) async {
    try {
      await localDataSource.createProduct(
        name: params.name,
        category: params.category,
        inPantry: params.inPantry,
        minQuantity: params.minQuantity,
      );
      return const Right(null);
    } on DatabaseException catch (ex) {
      return Left(
          DatabaseFailure(message: ex.message, statusCode: ex.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    try {
      await localDataSource.deleteProduct(id: id);
      return const Right(null);
    } on DatabaseException catch (ex) {
      return Left(
          DatabaseFailure(message: ex.message, statusCode: ex.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final list = await localDataSource.getAllProducts();
      return Right(list.toEntityList());
    } on DatabaseException catch (ex) {
      return Left(
          DatabaseFailure(message: ex.message, statusCode: ex.statusCode));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(int id) async {
    try {
      final product = await localDataSource.getProduct(id: id);
      return Right(product.toEntity());
    } on DatabaseException catch (ex) {
      return Left(
          DatabaseFailure(message: ex.message, statusCode: ex.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> updateProductInfo(
      UpdateProductInfoParams params) async {
    try {
      final product = await localDataSource.getProduct(id: params.id)
        ..copyWith(
          name: params.name,
          category: params.category,
        );
      await localDataSource.updateProduct(product: product);
      return const Right(null);
    } on DatabaseException catch (ex) {
      return Left(
          DatabaseFailure(message: ex.message, statusCode: ex.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> updateProductPantry(
      UpdateProductPantryParams params) async {
    try {
      if (params.minQuantity < 0) {
        return const Left(DatabaseFailure(
          message: "Min Quantity is out of range",
          statusCode: 503,
        ));
      }
      final product = await localDataSource.getProduct(id: params.id)
        ..copyWith(
          inPantry: params.isPantry,
          minQuantity: params.minQuantity,
        );
      await localDataSource.updateProduct(product: product);
      return const Right(null);
    } on DatabaseException catch (ex) {
      return Left(
          DatabaseFailure(message: ex.message, statusCode: ex.statusCode));
    }
  }
}
