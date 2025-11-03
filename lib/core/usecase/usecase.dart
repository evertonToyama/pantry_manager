import 'package:dartz/dartz.dart';
import 'package:pantry_manager/core/errors/failures.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  Future<Either<Failure, Type>> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  Future<Either<Failure, Type>> call();
}
