import 'package:equatable/equatable.dart';

abstract class PoralekhaState extends Equatable {
  PoralekhaState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnPoralekhaState extends PoralekhaState {

  UnPoralekhaState();

  @override
  String toString() => 'UnPoralekhaState';
}

/// Initialized
class InPoralekhaState extends PoralekhaState {
  InPoralekhaState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InPoralekhaState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorPoralekhaState extends PoralekhaState {
  ErrorPoralekhaState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorPoralekhaState';

  @override
  List<Object> get props => [errorMessage];
}
