import 'package:equatable/equatable.dart';
import 'package:pantry_manager/features/lists/domain/entities/item_entity.dart';
import 'package:pantry_manager/features/lists/domain/entities/store_entity.dart';

class ListEntity extends Equatable {
  final int id;
  final String name;
  final List<ItemEntity> products;
  final StoreEntity? store;
  final bool isFinished;

  const ListEntity({
    required this.id,
    required this.name,
    required this.products,
    required this.store,
    required this.isFinished,
  });

  @override
  List<Object?> get props => [id];
}
