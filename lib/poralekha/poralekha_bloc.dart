import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:poralekha_flutter_app/poralekha/index.dart';

class PoralekhaBloc extends Bloc<PoralekhaEvent, PoralekhaState> {
  PoralekhaBloc(PoralekhaState initialState) : super(initialState) {
    on<PoralekhaEvent>((event, emit) {
      return emit.forEach<PoralekhaState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'PoralekhaBloc', error: error, stackTrace: stackTrace);
          return ErrorPoralekhaState(error.toString());
        },
      );
    });
  }
}
