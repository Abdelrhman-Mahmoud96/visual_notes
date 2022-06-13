import 'package:dartz/dartz.dart';
import 'package:visual_notes/core/errors/failure.dart';

abstract class UseCaseWithStream<Type, Prams>{
  Stream<Either<Failure, Type>> call(Prams prams);
}
