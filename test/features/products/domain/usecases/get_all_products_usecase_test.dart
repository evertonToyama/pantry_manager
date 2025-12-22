import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/get_all_products_usecase.dart';

import 'product_repository.mock.dart';

void main() {
  late ProductRepository productRepository;
  late GetAllProductsUsecase usecase;

  const ProductEntity tProduct = ProductEntity(
    id: 1,
    name: "name",
    category: "category",
    inPantry: false,
    minQuantity: 0,
  );
  const List<ProductEntity> tProducts = [tProduct];
  const DatabaseFailure tFailure = DatabaseFailure(message: "Database Error");

  setUp(() {
    productRepository = MockProductRepository();
    usecase = GetAllProductsUsecase(productRepository);
  });

  test("Get products success", () async {
    when(() => productRepository.getAllProducts())
        .thenAnswer((_) async => const Right(tProducts));

    final result = await usecase();

    expect(result, equals(const Right(tProducts)));
    verify(
      () => productRepository.getAllProducts(),
    ).called(1);
    verifyNoMoreInteractions(productRepository);
  });

  test("Get products fail", () async {
    when(() => productRepository.getAllProducts())
        .thenAnswer((_) async => const Left(tFailure));

    final result = await productRepository.getAllProducts();

    expect(result, equals(const Left<Failure, dynamic>(tFailure)));
    verify(
      () => productRepository.getAllProducts(),
    ).called(1);
    verifyNoMoreInteractions(productRepository);
  });
}
