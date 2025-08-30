import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/failures/failures.dart';
import 'package:pantry_manager/core/usecase/usecase.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_info_params.dart';

class UpdateProductInfoUsecase
    extends UsecaseWithParams<void, UpdateProductInfoParams> {
  final ProductRepository _productRepository;

  const UpdateProductInfoUsecase(this._productRepository);

  @override
  Future<Either<Failure, void>> call(UpdateProductInfoParams params) {
    return _productRepository.updateProductInfo(params);
  }
}
