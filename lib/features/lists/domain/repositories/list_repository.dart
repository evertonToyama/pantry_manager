import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/lists/domain/entities/list_entity.dart';

abstract class ListRepository {
  Future<Either<Failure, void>> createList();
  Future<Either<Failure, ListEntity>> getList(int id);
  Future<Either<Failure, List<ListEntity>>> getAllLists();
  Future<Either<Failure, void>> updateList();
  Future<Either<Failure, void>> deleteList(int id);
}
