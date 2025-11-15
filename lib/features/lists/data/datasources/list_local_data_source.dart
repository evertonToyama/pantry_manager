import 'package:drift/native.dart';
import 'package:pantry_manager/core/database/database.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/features/lists/domain/entities/list_entity.dart';

abstract class ListLocalDataSource {
  Future<int> createList({required String name});
  Future<ListEntity> getList({required int id});
  Future<List<ListEntity>> getAllLists();
  Future<int> updateList(ListEntity list);
  Future<int> deleteList(int id);
}

class ListLocalDataSourceImpl extends ListLocalDataSource {
  final AppDatabase _database;

  ListLocalDataSourceImpl(this._database);

  @override
  Future<int> createList({required String name}) async {
    try {
      return _database.into(_database.listDB).insert(ListDBCompanion.insert(
            name: name,
          ));
    } on SqliteException catch (ex) {
      throw const DatabaseException(
        message: "Error",
        statusCode: 403,
      );
    }
  }

  @override
  Future<int> deleteList(int id) async {
    try {
      ((_database.delete(_database.listDB))..where((l) => l.id.equals(id)))
          .go();
      return 1;
    } on SqliteException catch (ex) {
      print(ex);
      return 0;
    }
  }

  @override
  Future<List<ListEntity>> getAllLists() {
    // TODO: implement getAllLists
    throw UnimplementedError();
  }

  @override
  Future<ListEntity> getList({required int id}) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<int> updateList(ListEntity list) {
    // TODO: implement updateList
    throw UnimplementedError();
  }
}
