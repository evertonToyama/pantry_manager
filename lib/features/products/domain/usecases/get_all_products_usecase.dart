import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/core/usecase/usecase.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';

class GetAllProductsUsecase extends UsecaseWithoutParams {
  final ProductRepository _productRepository;

  const GetAllProductsUsecase(this._productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call() {
    return _productRepository.getAllProducts();
  }
}
