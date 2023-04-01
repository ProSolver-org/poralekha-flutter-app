import 'dart:async';
import 'dart:developer' as developer;

import 'package:poralekha_flutter_app/poralekha/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PoralekhaEvent {
  Stream<PoralekhaState> applyAsync(
      {PoralekhaState currentState, PoralekhaBloc bloc});
}

class UnPoralekhaEvent extends PoralekhaEvent {
  @override
  Stream<PoralekhaState> applyAsync(
      {PoralekhaState? currentState, PoralekhaBloc? bloc}) async* {
    yield UnPoralekhaState();
  }
}

class LoadPoralekhaEvent extends PoralekhaEvent {
  @override
  Stream<PoralekhaState> applyAsync(
      {PoralekhaState? currentState, PoralekhaBloc? bloc}) async* {
    try {
      yield UnPoralekhaState();
      await Future.delayed(const Duration(seconds: 1));
      yield InPoralekhaState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadPoralekhaEvent', error: _, stackTrace: stackTrace);
      yield ErrorPoralekhaState(_.toString());
    }
  }
}
