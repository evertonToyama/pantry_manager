import 'package:equatable/equatable.dart';

class CreateProductParams extends Equatable {
  final int id;
  final String name;
  final String category;
  final bool inPantry;
  final int minQuantity;

  const CreateProductParams({
    required this.id,
    required this.name,
    required this.category,
    required this.inPantry,
    required this.minQuantity,
  });

  @override
  List<Object?> get props => [id, name, category, inPantry, minQuantity];
}
