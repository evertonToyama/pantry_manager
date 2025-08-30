import 'package:equatable/equatable.dart';

class UpdateProductInfoParams extends Equatable {
  final int id;
  final String name;
  final String category;

  const UpdateProductInfoParams({
    required this.id,
    required this.name,
    required this.category,
  });

  @override
  List<Object?> get props => [id, name, category];
}
