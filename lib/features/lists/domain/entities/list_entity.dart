import 'package:equatable/equatable.dart';
import 'package:pantry_manager/features/products/domain/entities/product_entity.dart';

class ListEntity extends Equatable {
  final int id;
  final String name;
  final List<ProductEntity> unpurchasedProducts;
  final List<ProductEntity> purchaedProducts;
  final bool isFinished;

  const ListEntity({
    required this.id,
    required this.name,
    required this.unpurchasedProducts,
    required this.purchaedProducts,
    required this.isFinished,
  });

  @override
  List<Object?> get props => [id];
}
