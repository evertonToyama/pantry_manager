import 'package:drift/native.dart';
import 'package:pantry_manager/core/database/database.dart';
import 'package:pantry_manager/core/errors/exceptions.dart';
import 'package:pantry_manager/features/lists/data/models/list_model.dart';

abstract class ListLocalDataSource {
  Future<int> createList({required String name});
  Future<ListModel> getList({required int id});
  Future<List<ListModel>> getAllLists();
  Future<int> updateList(ListModel list);
  Future<int> deleteList(int id);
}

class ListLocalDataSourceImpl extends ListLocalDataSource {
  final AppDatabase _database;

  ListLocalDataSourceImpl(this._database);

  @override
  Future<int> createList({required String name}) async {
    try {
      return await _database.createShoppingList(name: name);
    } on SqliteException catch (ex) {
      throw DatabaseException(
        message: ex.toString(),
        statusCode: 403,
      );
    }
  }

  @override
  Future<int> deleteList(int id) async {
    try {
      return await _database.deleteShoppingList(id);
    } on SqliteException catch (ex) {
      throw DatabaseException(
        message: ex.toString(),
        statusCode: 400,
      );
    }
  }

  @override
  Future<List<ListModel>> getAllLists() async {
    try {
      return await _database.getAllShoppingLists();
    } catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 400,
      );
    }
  }

  @override
  Future<ListModel> getList({required int id}) async {
    try {
      final result = await _database.getShoppingListById(id);

      if (result == null) {
        throw const NotFoundDatabaseException();
      }

      return result;
    } on SqliteException catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 400,
      );
    }
  }

  @override
  Future<int> updateList(ListModel list) async {
    try {
      return await _database.updateShoppingList(
        list.id,
        list.name,
        list.isFinished,
        list.store!.id,
      );
    } catch (e) {
      throw DatabaseException(
        message: e.toString(),
        statusCode: 400,
      );
    }
  }
}
