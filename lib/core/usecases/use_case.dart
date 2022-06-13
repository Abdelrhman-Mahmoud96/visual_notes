import 'package:dartz/dartz.dart';
import 'package:visual_notes/core/errors/failure.dart';

abstract class UseCase<Type, Prams>{
  Future<Either<Failure, Type>> call(Prams params);
}

// we would make a constant constructor to ensure that we will get
// the same instance or implement equatable to ensure that
// the new instance is the same as the old one so
// it won't make our test fail
class NoParams{
  const NoParams();
}
