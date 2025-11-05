import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/products/data/datasources/product_local_data_source.dart';
import 'package:pantry_manager/features/products/data/repositories/product_repository_impl.dart';
import 'package:pantry_manager/features/products/domain/usecases/create_product_params.dart';

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
    test("success", () async {});
    test("fail empty list", () async {});
    test("fail", () async {});
  });

  group("get product", () {
    test("success", () async {});
    test("fail ID not found", () async {});
    test("fail", () async {});
  });

  group("update product info", () {
    test("success", () async {});
    test("fail out of bounds", () async {});
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
