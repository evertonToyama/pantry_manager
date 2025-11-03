import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/core/usecase/usecase.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/create_product_params.dart';

class CreateProductUsecase
    extends UsecaseWithParams<void, CreateProductParams> {
  final ProductRepository _productRepository;

  const CreateProductUsecase(this._productRepository);

  @override
  Future<Either<Failure, void>> call(CreateProductParams params) {
    return _productRepository.createProduct(params);
  }
}
