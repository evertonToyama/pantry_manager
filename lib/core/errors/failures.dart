import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;

  const Failure({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [statusCode, message];

  @override
  String toString() {
    return "$statusCode - Error: $message";
  }
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message, required super.statusCode});
}
