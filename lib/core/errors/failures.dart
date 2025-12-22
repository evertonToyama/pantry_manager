import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({
    required this.message,
  });

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return "Error: $message";
  }
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
}

class NotFoundDatabaseFailure extends DatabaseFailure {
  const NotFoundDatabaseFailure() : super(message: 'Resource not found');
}

class DuplicatedItemDatabaseFailure extends DatabaseFailure {
  const DuplicatedItemDatabaseFailure() : super(message: 'Duplicated item');
}

class MinQuantityDatabaseFailure extends DatabaseFailure {
  const MinQuantityDatabaseFailure()
      : super(message: 'Min quantity is out of bounds');
}

class LocalDatabaseFailure extends DatabaseFailure {
  const LocalDatabaseFailure({super.message = 'Database Error'});
}
