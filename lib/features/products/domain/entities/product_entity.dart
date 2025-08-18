import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String category;
  final bool? inPantry;
  final int? minQuantity;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.inPantry,
    required this.minQuantity,
  });

  @override
  List<Object?> get props => [id];
}
