import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/lists/domain/entities/item_entity.dart';
import 'package:pantry_manager/features/lists/domain/repositories/item_repository.dart';

class ItemRepositoryImpl extends ItemRepository {
  @override
  Future<Either<Failure, void>> createItem(ItemEntity params) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteItem(int id) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ItemEntity>>> getAllItems() {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ItemEntity>> getItem(int id) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> updateItem(ItemEntity params) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
