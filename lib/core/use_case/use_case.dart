import 'package:dartz/dartz.dart';
import 'package:lomaTV/core/errors/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failures, Type>> call([Param param]);
}

class NoParam {}
