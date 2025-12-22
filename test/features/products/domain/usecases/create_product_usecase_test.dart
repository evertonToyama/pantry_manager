import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/create_product_params.dart';
import 'package:pantry_manager/features/products/domain/usecases/create_product_usecase.dart';

import 'product_repository.mock.dart';

void main() {
  late ProductRepository productRepository;
  late CreateProductUsecase usecase;

  const CreateProductParams tParams = CreateProductParams(
    id: 0,
    name: "name",
    category: "category",
    inPantry: true,
    minQuantity: 1,
  );

  const tFailure = DatabaseFailure(message: "Database error");

  setUp(() {
    productRepository = MockProductRepository();
    usecase = CreateProductUsecase(productRepository);
  });

  test("create product success", () async {
    when(() => productRepository.createProduct(tParams))
        .thenAnswer((_) async => const Right(null));

    final result = await usecase(tParams);

    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => productRepository.createProduct(tParams)).called(1);
    verifyNoMoreInteractions(productRepository);
  });

  test("create product fail", () async {
    when(() => productRepository.createProduct(tParams))
        .thenAnswer((_) async => const Left(tFailure));

    final result = await usecase(tParams);

    expect(result, equals(const Left<DatabaseFailure, dynamic>(tFailure)));
    verify(() => productRepository.createProduct(tParams));
    verifyNoMoreInteractions(productRepository);
  });
}
