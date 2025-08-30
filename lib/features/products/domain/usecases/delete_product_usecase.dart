import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/failures/failures.dart';
import 'package:pantry_manager/core/usecase/usecase.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';

class DeleteProductUsecase extends UsecaseWithParams<void, int> {
  final ProductRepository _productRepository;

  const DeleteProductUsecase(this._productRepository);

  @override
  Future<Either<Failure, void>> call(int params) {
    return _productRepository.deleteProduct(params);
  }
}
