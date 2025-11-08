import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/products/data/datasources/product_local_data_source.dart';
import 'package:pantry_manager/features/products/data/models/product_model.dart';
import 'package:pantry_manager/features/products/data/repositories/product_mapper.dart';
import 'package:pantry_manager/features/products/data/repositories/product_repository_impl.dart';
import 'package:pantry_manager/features/products/domain/usecases/create_product_params.dart';
import 'package:pantry_manager/features/products/domain/usecases/update_product_info_params.dart';

class MockProductLocalDataSource extends Mock
    implements ProductLocalDataSource {}

class MockProductRepositoryImpl extends Mock implements ProductRepositoryImpl {}

void main() {
  late ProductLocalDataSource localDataSource;
  late ProductRepositoryImpl repository;

  setUp(() {
    localDataSource = MockProductLocalDataSource();
    repository = ProductRepositoryImpl(localDataSource: localDataSource);
  });

  group("create product", () {
    CreateProductParams params = const CreateProductParams(
      id: 0,
      name: "name",
      category: "category",
      inPantry: true,
      minQuantity: 0,
    );
    test(
        "Given a 'Product' when it's created then it should be inserted successfully",
        () async {
      // ARRANGE
      when(() => localDataSource.createProduct(
            name: params.name,
            category: params.category,
            inPantry: params.inPantry,
            minQuantity: params.minQuantity,
          )).thenAnswer((_) async => 1);

      // ACT
      var result = await repository.createProduct(params);

      // ASSERT
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => localDataSource.createProduct(
          name: any(named: "name"),
          category: any(named: "category"),
          inPantry: any(named: "inPantry"),
          minQuantity: any(named: "minQuantity"),
        ),
      ).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
    test(
        "Given a 'Product' creation when there's a error on data source then it should throw an exception",
        () async {
      // ARRANGE
      when(() => localDataSource.createProduct(
            name: params.name,
            category: params.category,
            inPantry: params.inPantry,
            minQuantity: params.minQuantity,
          )).thenThrow(const DatabaseException(
        message: "message",
        statusCode: 500,
      ));

      // ACT
      var result = await repository.createProduct(params);

      // ASSERT
      expect(
        result,
        equals(const Left(DatabaseFailure(
          message: "message",
          statusCode: 500,
        ))),
      );
      verify(
        () => localDataSource.createProduct(
          name: params.name,
          category: params.category,
          inPantry: params.inPantry,
          minQuantity: params.minQuantity,
        ),
      ).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
    test("Duplicate product", () async {
      // ARRANGE
      when(() => localDataSource.createProduct(
            name: params.name,
            category: params.category,
            inPantry: params.inPantry,
            minQuantity: params.minQuantity,
          )).thenThrow(const DatabaseException(
        message: "Duplicated name",
        statusCode: 502,
      ));

      // ACT
      var result = await repository.createProduct(params);

      // ASSERT
      expect(
          result,
          equals(const Left(DatabaseFailure(
            message: "Duplicated name",
            statusCode: 502,
          ))));
    });
  });

  group("delete product", () {
    test("success", () async {
      // ARRANGE
      when(() => localDataSource.deleteProduct(id: any(named: "id")))
          .thenAnswer((_) async => 1);

      // ACT
      var result = await repository.deleteProduct(1);

      // ASSERT
      expect(result, const Right(null));
      verify(
        () => localDataSource.deleteProduct(id: any(named: "id")),
      ).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
    test("fail", () async {
      // ARRANGE
      when(() => localDataSource.deleteProduct(id: any(named: "id")))
          .thenThrow(const DatabaseException(
        message: "error",
        statusCode: 505,
      ));

      // ACT
      var result = await repository.deleteProduct(1);

      // ASSERT
      expect(
          result,
          const Left(DatabaseFailure(
            message: "error",
            statusCode: 505,
          )));
    });
  });

  group("get all products", () {
    var products = [const ProductModel.empty(), const ProductModel.empty()];
    var empty = [];
    test("success", () async {
      // ARRANGE
      when(
        () => localDataSource.getAllProducts(),
      ).thenAnswer((_) async => products);

      // ACT
      var result = await repository.getAllProducts();

      // ASSERT
      result.fold(
        (failure) => fail("Expected Right but got Left - $failure"),
        (actual) => expect(actual, products.toEntityList()),
      );
    });

    test("fail empty list", () async {
      // ARRANGE
      when(
        () => localDataSource.getAllProducts(),
      ).thenAnswer((_) async => []);

      // ACT
      var result = await repository.getAllProducts();

      // ASSERT
      result.fold(
        (failure) => fail("Expected Right but got Left - $failure"),
        (actual) => expect(actual, []),
      );
    });
    test("fail", () async {
      // ARRANGE
      when(() => localDataSource.getAllProducts())
          .thenThrow(const DatabaseFailure(
        message: "Error",
        statusCode: 505,
      ));

      // ACT
      // ASSERT
      expect(
          () => repository.getAllProducts(),
          throwsA(const DatabaseFailure(
            message: "Error",
            statusCode: 505,
          )));
    });
  });

  group("get product", () {
    const productModel = ProductModel.empty();
    test("success", () async {
      // ARRANGE
      when(
        () => localDataSource.getProduct(id: any(named: "id")),
      ).thenAnswer((_) async => productModel);

      // ACT
      var result = await repository.getProduct(1);

      // ASSERT
      expect(result, Right(productModel.toEntity()));
    });
    test("fail ID not found", () async {
      // ARRANGE
      when((() => localDataSource.getProduct(id: any(named: "id"))))
          .thenThrow(const Left(DatabaseFailure(
        message: "Product not found",
        statusCode: 402,
      )));

      // ACT
      // ASSERT
      expect(
          () => repository.getProduct(1),
          throwsA(const Left(DatabaseFailure(
            message: "Product not found",
            statusCode: 402,
          ))));
      verify(() => localDataSource.getProduct(id: any(named: "id"))).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
    test("fail", () async {
      // ARRANGE
      when(
        () => localDataSource.getProduct(id: any(named: "id")),
      ).thenThrow(const Left(
        DatabaseFailure(
          message: "error",
          statusCode: 500,
        ),
      ));

      // ACT
      // ASSERT
      expect(
          () => repository.getProduct(0),
          throwsA(const Left(DatabaseFailure(
            message: "error",
            statusCode: 500,
          ))));
      verify(() => localDataSource.getProduct(
            id: any(named: "id"),
          )).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
  });

  group("update product info", () {
    const productModel = ProductModel.empty();
    const params =
        UpdateProductInfoParams(id: 0, name: "name", category: "category");
    test("success", () async {
      // ARRANGE
      when(
        () => localDataSource.updateProduct(
            product: ProductModel(
          id: any(named: "id"),
          name: any(named: "name"),
          category: any(named: "category"),
          inPantry: any(named: "inPantry"),
          minQuantity: any(named: "minQuantity"),
        )),
      ).thenAnswer((_) async => 1);

      // ACT
      final result = await repository.updateProductInfo(params);

      // ASSERT
      expect(result, equals(const Right(1)));
    });
    test("fail out of bounds", () async {
      // ARRANGE
      when(
        () => localDataSource.updateProduct(
            product: ProductModel(
          id: any(named: "id"),
          name: any(named: "name"),
          category: any(named: "category"),
          inPantry: any(named: "inPantry"),
          minQuantity: any(named: "minQuantity"),
        )),
      ).thenAnswer((_) async => 1);

      // ACT

      // ASSERT
    });
    test("fail id not found", () async {});
    test("fail", () async {});
  });

  group("update product pantry", () {
    test("success", () async {});
    test("fail out of bounds", () async {});
    test("fail id not found", () async {});
    test("fail", () async {});
  });
}
