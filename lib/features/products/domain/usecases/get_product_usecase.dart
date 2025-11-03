import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/core/usecase/usecase.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';

class GetProductUsecase extends UsecaseWithParams<ProductEntity, int> {
  final ProductRepository _productRepository;

  const GetProductUsecase(this._productRepository);

  @override
  Future<Either<Failure, ProductEntity>> call(int params) {
    return _productRepository.getProduct(params);
  }
}
