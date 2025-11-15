import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';
import 'package:pantry_manager/features/lists/data/datasources/list_local_data_source.dart';
import 'package:pantry_manager/features/lists/domain/entities/list_entity.dart';
import 'package:pantry_manager/features/lists/domain/repositories/list_repository.dart';

class ListRepositoryImpl extends ListRepository {
  final ListLocalDataSource _localDataSource;

  ListRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, void>> createList(String name) {
    // TODO: implement createList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteList(int id) {
    // TODO: implement deleteList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ListEntity>>> getAllLists() {
    // TODO: implement getAllLists
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ListEntity>> getList(int id) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> updateList(ListEntity list) {
    // TODO: implement updateList
    throw UnimplementedError();
  }
}
