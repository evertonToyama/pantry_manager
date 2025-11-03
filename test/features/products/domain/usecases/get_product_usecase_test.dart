import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/get_product_usecase.dart';

import 'product_repository.mock.dart';

void main() {
  late ProductRepository productRepository;
  late GetProductUsecase usecase;

  const int tId = 0;
  const ProductEntity tUser = ProductEntity(
    id: tId,
    name: "name",
    category: "category",
    inPantry: true,
    minQuantity: 1,
  );
  const DatabaseFailure tFailure = DatabaseFailure(
    message: "Database error",
    statusCode: 500,
  );

  setUp(() {
    productRepository = MockProductRepository();
    usecase = GetProductUsecase(productRepository);
  });

  test("get user success", () async {
    when(() => productRepository.getProduct(tId))
        .thenAnswer((_) async => const Right(tUser));

    final result = await usecase(tId);

    expect(result, equals(const Right<dynamic, ProductEntity>(tUser)));
    verify(() => productRepository.getProduct(tId));
    verifyNoMoreInteractions(productRepository);
  });

  test("get user fail", () async {
    when(() => productRepository.getProduct(tId))
        .thenAnswer((_) async => const Left(tFailure));

    final result = await usecase(tId);

    expect(result, equals(const Left<DatabaseFailure, dynamic>(tFailure)));
    verify(() => productRepository.getProduct(tId));
    verifyNoMoreInteractions(productRepository);
  });
}
