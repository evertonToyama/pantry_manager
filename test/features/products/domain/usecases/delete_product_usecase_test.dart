import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';
import 'package:pantry_manager/features/products/domain/usecases/delete_product_usecase.dart';

import 'product_repository.mock.dart';

void main() {
  late ProductRepository productRepository;
  late DeleteProductUsecase usecase;

  const int tId = 0;
  const DatabaseFailure tFailure = DatabaseFailure(
    message: "Database error",
    statusCode: 500,
  );

  setUp(() {
    productRepository = MockProductRepository();
    usecase = DeleteProductUsecase(productRepository);
  });

  test("delete success", () async {
    when(() => productRepository.deleteProduct(tId))
        .thenAnswer((_) async => const Right(null));

    final result = await usecase(tId);

    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => productRepository.deleteProduct(tId));
    verifyNoMoreInteractions(productRepository);
  });

  test("delete fail", () async {
    when(() => productRepository.deleteProduct(tId))
        .thenAnswer((_) async => const Left(tFailure));

    final result = await usecase(tId);

    expect(result, equals(const Left<DatabaseFailure, dynamic>(tFailure)));
    verify(() => productRepository.deleteProduct(tId));
    verifyNoMoreInteractions(productRepository);
  });
}
