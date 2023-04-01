import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ff_bloc/ff_bloc.dart';

import 'package:poralekha_flutter_app/poralekha/index.dart';

@immutable
abstract class PoralekhaEvent
    implements FFBlocEvent<PoralekhaState, PoralekhaBloc> {}

class LoadPoralekhaEvent extends PoralekhaEvent {
  LoadPoralekhaEvent({required this.id});
  final String? id;

  static const String _name = 'LoadPoralekhaEvent';

  @override
  String toString() => _name;

  @override
  Stream<PoralekhaState> applyAsync({required PoralekhaBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    final result = await bloc.provider.fetchAsync(id);
    yield bloc.state.copyWithoutError(
      isLoading: false,
      data: PoralekhaViewModel(items: result),
    );
  }
}

class AddPoralekhaEvent extends PoralekhaEvent {
  static const String _name = 'AddPoralekhaEvent';

  @override
  String toString() => _name;

  @override
  Stream<PoralekhaState> applyAsync({required PoralekhaBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    final result = await bloc.provider.addMore(bloc.state.data?.items);
    yield bloc.state.copyWithoutError(
      isLoading: false,
      data: PoralekhaViewModel(items: result),
    );
  }
}

class ErrorPoralekhaEvent extends PoralekhaEvent {
  static const String _name = 'ErrorYouAwesomeEvent';

  @override
  String toString() => _name;

  @override
  Stream<PoralekhaState> applyAsync({required PoralekhaBloc bloc}) async* {
    throw Exception('Test error');
  }
}

class ClearPoralekhaEvent extends PoralekhaEvent {
  static const String _name = 'ClearPoralekhaEvent';

  @override
  String toString() => _name;

  @override
  Stream<PoralekhaState> applyAsync({required PoralekhaBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    yield bloc.state.copyWithoutData(
      isLoading: false,
    );
  }
}
