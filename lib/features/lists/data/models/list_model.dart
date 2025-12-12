import 'package:pantry_manager/features/lists/domain/entities/list_entity.dart';

class ListModel extends ListEntity {
  const ListModel({
    required super.id,
    required super.name,
    required super.products,
    required super.store,
    required super.isFinished,
  });
}
