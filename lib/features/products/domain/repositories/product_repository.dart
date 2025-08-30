import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/failures/failures.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';
import 'package:pantry_manager/features/products/domain/usecases/create_product_params.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_info_params.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_pantry_params.dart';

abstract class ProductRepository {
  Future<Either<Failure, void>> createProduct(CreateProductParams params);
  Future<Either<Failure, ProductEntity>> getProduct(int id);
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, void>> updateProductInfo(
      UpdateProductInfoParams params);
  Future<Either<Failure, void>> updateProductPantry(
      UpdateProductPantryParams params);
  Future<Either<Failure, void>> deleteProduct(int id);
}
