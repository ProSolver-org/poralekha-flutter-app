import 'package:ff_bloc/ff_bloc.dart';

import 'package:poralekha_flutter_app/poralekha/index.dart';

class PoralekhaState extends FFState<PoralekhaState, PoralekhaViewModel> {
  const PoralekhaState({
    super.version = 0,
    super.isLoading = false,
    super.data,
    super.error,
  });

  @override
  StateCopyFactory<PoralekhaState, PoralekhaViewModel> getCopyFactory() =>
      PoralekhaState.new;
}
