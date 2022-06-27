// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:visual_notes/core/errors/failure.dart';

abstract class IUseCaseWithStream<Type, Prams>{
  Stream<Either<Failure, Type>> call(Prams prams);
}
