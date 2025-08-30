import 'package:flutter/material.dart';
import 'package:pantry_manager/core/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  // Insert
  // await database.into(database.productDB).insert(ProductDBCompanion.insert(
  //       name: "Produto A",
  //       category: "Categoria",
  //       inPantry: true,
  //       minQuantity: 1,
  //     ));

  // Select
  var products = await (database.select(database.productDB)
        ..where(
          (tbl) => tbl.id.equals(90),
        ))
      .get();
  // List<ProductData> products = await database.select(database.productDB).where((tbl) => tbl.id == 1,).get();

  // Update
  // int rows = await (database.update(database.productDB)..where((t) => t.id.equals(0)))
  //     .write(const ProductDBCompanion(category: Value("woier")));

  // Delete
  // await (database.delete(database.productDB)..where((t) => t.id.equals(0)))
  //     .go();
  print(products);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
