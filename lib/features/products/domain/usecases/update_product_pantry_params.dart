import 'package:equatable/equatable.dart';

class UpdateProductPantryParams extends Equatable {
  final int id;
  final bool isPantry;
  final int minQuantity;

  const UpdateProductPantryParams({
    required this.id,
    required this.isPantry,
    required this.minQuantity,
  });

  @override
  List<Object?> get props => [id, isPantry, minQuantity];
}
