import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/failures/failures.dart';
import 'package:pantry_manager/core/usecase/usecase.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_pantry_params.dart';

class UpdateProductPantryUsecase
    extends UsecaseWithParams<void, UpdateProductPantryParams> {
  final ProductRepository _productRepository;

  const UpdateProductPantryUsecase(this._productRepository);

  @override
  Future<Either<Failure, void>> call(UpdateProductPantryParams params) {
    return _productRepository.updateProductPantry(params);
  }
}
