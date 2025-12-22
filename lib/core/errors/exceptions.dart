import 'package:equatable/equatable.dart';

class DatabaseException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const DatabaseException({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

class NotFoundDatabaseException extends DatabaseException {
  const NotFoundDatabaseException()
      : super(
          message: 'Resource not found',
          statusCode: 404,
        );
}

class ConflictDatabaseException extends DatabaseException {
  const ConflictDatabaseException()
      : super(
          message: 'Resource duplicated',
          statusCode: 409,
        );
}

class OutOfBoundsDatabaseException extends DatabaseException {
  const OutOfBoundsDatabaseException()
      : super(
          message: 'Min quantity out of bounds',
          statusCode: 422,
        );
}

class LocalDatabaseException extends DatabaseException {
  const LocalDatabaseException()
      : super(
          message: 'Database Error',
          statusCode: 400,
        );
}
