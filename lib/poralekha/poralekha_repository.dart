import 'package:poralekha_flutter_app/poralekha/index.dart';

class PoralekhaRepository {
  final PoralekhaProvider _poralekhaProvider = PoralekhaProvider();

  PoralekhaRepository();

  void test(bool isError) {
    _poralekhaProvider.test(isError);
  }
}
