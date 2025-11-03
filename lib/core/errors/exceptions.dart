import 'package:equatable/equatable.dart';

class DatabaseException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const DatabaseException({
    required this.message,
    required this.statusCode,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [message, statusCode];
}
