import 'dart:async';
import 'package:poralekha_flutter_app/poralekha/index.dart';

class PoralekhaProvider {
  Future<List<PoralekhaModel>?> fetchAsync(String? id) async {
    if (id == null) {
      return null;
    }
    return [PoralekhaModel(name: id)];
  }

  Future<List<PoralekhaModel>?> addMore(List<PoralekhaModel>? now) async {
    final result = [
      ...(now ?? <PoralekhaModel>[]),
      PoralekhaModel(name: now?.length.toString() ?? '0')
    ];
    return result;
  }
}
