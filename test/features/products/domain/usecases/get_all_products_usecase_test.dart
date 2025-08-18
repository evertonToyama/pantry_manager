import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';
import 'package:pantry_manager/features/products/domain/repositories/product_repository.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late final ProductRepository productRepository;
  const ProductEntity tProduct = ProductEntity(
    id: 1,
    name: "name",
    category: "category",
    inPantry: false,
    minQuantity: 0,
  );

  setUp(() {
    productRepository = MockProductRepository();
  });

  test('Get Product', () async {
    when(() => productRepository.getProduct(tProduct.id))
        .thenAnswer((_) async => const Right(tProduct));

    final result = await productRepository.getProduct(tProduct.id);

    expect(result, equals(const Right<dynamic, ProductEntity>(tProduct)));
    verify(
      () => productRepository.getProduct(tProduct.id),
    ).called(1);
    verifyNoMoreInteractions(productRepository);
  });
}
