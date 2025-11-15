import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/lists/domain/entities/item_entity.dart';

abstract class ItemRepository {
  Future<Either<Failure, void>> createItem(ItemEntity params);
  Future<Either<Failure, ItemEntity>> getItem(int id);
  Future<Either<Failure, List<ItemEntity>>> getAllItems();
  Future<Either<Failure, int>> updateItem(ItemEntity params);
  Future<Either<Failure, int>> deleteItem(int id);
}
