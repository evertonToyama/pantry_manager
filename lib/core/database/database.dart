import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:pantry_manager/features/lists/data/models/item_model.dart';
import 'package:pantry_manager/features/lists/data/models/list_model.dart';
import 'package:pantry_manager/features/lists/data/models/store_model.dart';
import 'package:pantry_manager/features/products/data/models/product_model.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

abstract class Database {
  Future<int> createProduct(
      String name, String category, bool inPantry, int minQuantity);
  Future<ProductModel?> getProductById(int id);
  Future<List<ProductModel>> getAllProducts();
  Future<int> updateProduct(
      int id, String name, String category, bool inPantry, int minQuantity);
  Future<int> deleteProduct(int id);

  Future<int> createStore(String name);
  Future<StoreModel?> getStoreById(int id);
  Future<List<StoreModel>> getAllStores();
  Future<int> updateStore(int id, String name);
  Future<int> deleteStore(int id);

  Future<int> createShoppingList(
      {required String name, bool isFinished, int? idStore});
  Future<ListModel?> getShoppingListById(int id);
  Future<List<ListModel>> getAllShoppingLists();
  Future<int> updateShoppingList(
      int id, String name, bool isFinished, int idStore);
  Future<int> deleteShoppingList(int id);

  Future<int> createItem(int quantity, int price, bool isPurchased,
      int idProduct, int idShoppingList);
  Future<ItemModel?> getItemById(int id);
  Future<List<ItemModel>> getAllItemns();
  Future<List<ItemModel>> getItemsOfList(int idList);
  Future<int> updateItem(int id, int quantity, int price, bool isPurchased,
      int idProduct, int idShoppingList);
  Future<int> deleteItem(int id);
}

@DriftDatabase(include: {"sql/schema.drift"})
class AppDatabase extends _$AppDatabase implements Database {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: "Pantry",
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  // Product
  @override
  Future<int> createProduct(
      String name, String category, bool inPantry, int minQuantity) {
    return _insertProduct(name, category, inPantry ? 1 : 0, minQuantity);
  }

  @override
  Future<int> deleteProduct(int id) {
    return _deleteProduct(id);
  }

  @override
  Future<ProductModel?> getProductById(int id) {
    return _getProductById(id).getSingleOrNull().then((r) => r != null
        ? ProductModel(
            id: r.id,
            name: r.name,
            category: r.category,
            inPantry: r.inPantry == 1,
            minQuantity: r.minQuantity,
          )
        : null);
  }

  @override
  Future<List<ProductModel>> getAllProducts() {
    return _getAllProducts().get().then((l) => l
        .map((p) => ProductModel(
              id: p.id,
              name: p.name,
              category: p.category,
              inPantry: p.inPantry == 1,
              minQuantity: p.minQuantity,
            ))
        .toList());
  }

  @override
  Future<int> updateProduct(
      int id, String name, String category, bool inPantry, int minQuantity) {
    return _updateProduct(name, category, inPantry ? 1 : 0, minQuantity, id);
  }

  // Item
  @override
  Future<int> createItem(int quantity, int price, bool isPurchased,
      int idProduct, int idShoppingList) {
    return _insertItem(
        quantity, price, isPurchased ? 1 : 0, idProduct, idShoppingList);
  }

  @override
  Future<int> deleteItem(int id) {
    return _deleteItem(id);
  }

  @override
  Future<List<ItemModel>> getAllItemns() async {
    var result = _getAllItems();
    var items = await result.get().then((l) => l.map((a) {
          var productModel = ProductModel(
            id: a.idProduct,
            name: a.nameProduct,
            category: a.category,
            inPantry: a.inPantry == 1,
            minQuantity: a.minQuantity,
          );
          var itemModel = ItemModel(
            id: a.idItem,
            product: productModel,
            quantity: a.quantity,
            price: a.price! * 100.0,
            isPurchased: a.isPurchased == 1,
          );

          return itemModel;
        }).toList());

    return items;
  }

  @override
  Future<List<ItemModel>> getItemsOfList(int idList) {
    return _getItemsOfList(idList).get().then((l) => l
        .map((i) => ItemModel(
              id: i.idItem,
              product: ProductModel(
                id: i.idProduct,
                name: i.nameProduct,
                category: i.category,
                inPantry: i.inPantry == 1,
                minQuantity: i.minQuantity,
              ),
              quantity: i.quantity,
              price: i.price! * 100.0,
              isPurchased: i.isPurchased == 1,
            ))
        .toList());
  }

  @override
  Future<ItemModel?> getItemById(int id) async {
    return _getItemById(id).getSingleOrNull().then((r) => r != null
        ? ItemModel(
            id: r.idItem,
            price: r.price! * 100.0,
            isPurchased: r.isPurchased == 1,
            quantity: r.quantity,
            product: ProductModel(
              id: r.idProduct,
              name: r.nameProduct,
              category: r.category,
              inPantry: r.inPantry == 1,
              minQuantity: r.minQuantity,
            ))
        : null);
  }

  @override
  Future<int> updateItem(int id, int quantity, int price, bool isPurchased,
      int idProduct, int idShoppingList) {
    return _updateItem(
        quantity, price, isPurchased ? 1 : 0, idProduct, idShoppingList, id);
  }

  // Shopping List
  @override
  Future<int> createShoppingList(
      {required String name, bool isFinished = false, int? idStore}) {
    return _insertList(name, isFinished ? 1 : 0, idStore);
  }

  @override
  Future<int> deleteShoppingList(int id) {
    return _deleteList(id);
  }

  @override
  Future<List<ListModel>> getAllShoppingLists() async {
    final rawLists = await _getAllLists().get();

    final lists = rawLists
        .map((sl) async => ListModel(
              id: sl.idList,
              name: sl.nameList,
              isFinished: sl.isFinished == 1,
              products: await getItemsOfList(sl.idList),
              store: StoreModel(id: sl.idStore, name: sl.nameStore),
            ))
        .toList();

    return await Future.wait(lists);
  }

  @override
  Future<ListModel?> getShoppingListById(int id) {
    return _getListById(id).getSingleOrNull().then((r) async => r != null
        ? ListModel(
            id: r.idList,
            name: r.nameList,
            isFinished: r.isFinished == 1,
            store: StoreModel(id: r.idStore, name: r.nameStore),
            products: await getItemsOfList(r.idList),
          )
        : null);
  }

  @override
  Future<int> updateShoppingList(
      int id, String name, bool isFinished, int idStore) {
    return _updateList(name, isFinished ? 1 : 0, idStore, id);
  }

  // Store
  @override
  Future<int> createStore(String name) {
    return _insertStore(name);
  }

  @override
  Future<int> deleteStore(int id) {
    return _deleteStore(id);
  }

  @override
  Future<List<StoreModel>> getAllStores() {
    return _getAllStores().get().then((r) => r
        .map((s) => StoreModel(
              id: s.id,
              name: s.name,
            ))
        .toList());
  }

  @override
  Future<StoreModel?> getStoreById(int id) {
    return _getStoreById(id).getSingleOrNull().then((r) => r != null
        ? StoreModel(
            id: r.id,
            name: r.name,
          )
        : null);
  }

  @override
  Future<int> updateStore(int id, String name) {
    return _updateStore(name, id);
  }
}
