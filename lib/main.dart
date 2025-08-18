import 'package:flutter/material.dart';
import 'package:pantry_manager/core/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  // await database.into(database.productDB).insert(ProductDBCompanion.insert(
  //       name: "Produto A",
  //       category: "Categoria",
  //       inPantry: true,
  //       minQuantity: 1,
  //     ));
  var products = await (database.select(database.productDB)
        ..where(
          (tbl) => tbl.name.equals("Produto A"),
        ))
      .get();
  // List<ProductData> products = await database.select(database.productDB).where((tbl) => tbl.id == 1,).get();
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
