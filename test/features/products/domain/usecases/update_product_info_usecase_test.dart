import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_info_params.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_info_usecase.dart';

import 'product_repository.mock.dart';

void main() {
  late ProductRepository productRepository;
  late UpdateProductInfoUsecase usecase;

  const UpdateProductInfoParams tParams = UpdateProductInfoParams(
    id: 0,
    name: "name",
    category: "category",
  );
  const DatabaseFailure tFailure = DatabaseFailure(message: "Database error");

  setUp(() {
    productRepository = MockProductRepository();
    usecase = UpdateProductInfoUsecase(productRepository);
  });

  test("update product info success", () async {
    when(() => productRepository.updateProductInfo(tParams))
        .thenAnswer((_) async => const Right(null));

    final result = await usecase(tParams);

    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => productRepository.updateProductInfo(tParams));
    verifyNoMoreInteractions(productRepository);
  });

  test("update product info fail", () async {
    when(() => productRepository.updateProductInfo(tParams))
        .thenAnswer((_) async => const Left(tFailure));

    final result = await usecase(tParams);

    expect(result, equals(const Left<DatabaseFailure, dynamic>(tFailure)));
    verify(() => productRepository.updateProductInfo(tParams));
    verifyNoMoreInteractions(productRepository);
  });
}
