import 'package:ff_bloc/ff_bloc.dart';

import 'package:poralekha_flutter_app/poralekha/index.dart';

class PoralekhaBloc extends FFBloc<PoralekhaEvent, PoralekhaState> {
  PoralekhaBloc({
    required this.provider,
    super.initialState = const PoralekhaState(),
  });

  final PoralekhaProvider provider;

  @override
  PoralekhaState onErrorState(Object error) =>
      state.copy(error: error, isLoading: false);
}
