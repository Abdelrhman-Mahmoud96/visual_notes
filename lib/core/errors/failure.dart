import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class Failure extends Equatable {
  abstract final String? message;

  @override
  List<Object> get props => [message!];
}


class StorageFailure extends Failure{
  StorageFailure({this.storageFailureMessage});
  final String? storageFailureMessage;

  @override
  String? get message => storageFailureMessage;



}
