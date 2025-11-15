import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/lists/domain/entities/list_entity.dart';

abstract class ListRepository {
  Future<Either<Failure, void>> createList(String name);
  Future<Either<Failure, ListEntity>> getList(int id);
  Future<Either<Failure, List<ListEntity>>> getAllLists();
  Future<Either<Failure, int>> updateList(ListEntity list);
  Future<Either<Failure, int>> deleteList(int id);
}
