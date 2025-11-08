import 'package:pantry_manager/features/products/data/models/product_model.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';

extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      category: category,
      inPantry: inPantry,
      minQuantity: minQuantity,
    );
  }
}

extension ProductModelListX on List<ProductModel> {
  List<ProductEntity> toEntityList() {
    return map((model) => model.toEntity()).toList();
  }
}
