import 'dart:convert';

import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.category,
    required super.inPantry,
    required super.minQuantity,
  });

  const ProductModel.empty()
      : this(id: 0, name: "", category: "", inPantry: false, minQuantity: 0);

  factory ProductModel.fromJson(String source) => jsonDecode(source);
  // factory ProductModel.fromDB(ProductData)

  ProductModel.fromMap(Map<String, dynamic> map)
      : this(
          id: int.parse(map["id"]),
          name: map["name"] as String,
          category: map["category"] as String,
          inPantry: bool.parse(map["inPantry"]),
          minQuantity: int.parse(map["minQuantity"]),
        );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "category": category,
        "inPantry": inPantry,
        "minQuantity": minQuantity,
      };

  String toJson() => jsonEncode(toMap());

  ProductModel copyWith({
    int? id,
    String? name,
    String? category,
    bool? inPantry,
    int? minQuantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      inPantry: inPantry ?? this.inPantry,
      minQuantity: minQuantity ?? this.minQuantity,
    );
  }
}
