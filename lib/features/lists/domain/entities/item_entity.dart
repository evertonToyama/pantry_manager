import 'package:equatable/equatable.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';

class ItemEntity extends Equatable {
  final int id;
  final ProductEntity product;
  final int quantity;
  final double price;
  final bool isPurchased;

  const ItemEntity({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.isPurchased,
  });

  @override
  List<Object?> get props => [id];
}
