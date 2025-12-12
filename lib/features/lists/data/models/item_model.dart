import 'package:pantry_manager/features/lists/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required super.id,
    required super.product,
    required super.quantity,
    required super.price,
    required super.isPurchased,
  });
}
