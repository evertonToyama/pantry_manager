import 'package:pantry_manager/core/database/database.dart';
import 'package:pantry_manager/features/lists/data/models/item_model.dart';

abstract class ItemLocalDataSource {
  Future<int> createItem({
    required int quantity,
    required double price,
  });
  Future<List<ItemModel>> getAllItems();
  Future<ItemModel> getItem(int id);
  Future<void> updateItem({required ItemModel item});
  Future<void> deleteItem({required int id});
}

class ItemLocalDataSourceImpl extends ItemLocalDataSource {
  final AppDatabase _database;

  ItemLocalDataSourceImpl(this._database);

  @override
  Future<int> createItem({required int quantity, required double price}) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem({required int id}) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> getAllItems() {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<ItemModel> getItem(int id) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateItem({required ItemModel item}) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
