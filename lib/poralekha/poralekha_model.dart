// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

class PoralekhaModel extends Equatable {
  const PoralekhaModel({
    required this.name,
  });
  final String name;

  @override
  List<Object> get props => [ name];

  Map<dynamic, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  static PoralekhaModel? fromMap(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return PoralekhaModel(
      name: map['name']!.toString(),
    );
  }

}

class PoralekhaViewModel extends Equatable {
  const PoralekhaViewModel({
    // TODO(all): add all required constructor parameters
    required this.items,
  });

  // TODO(all): declare your fields here
  final List<PoralekhaModel>? items;

  @override
  List<Object?> get props => [items /*TODO(all): List all fields here*/];

  // TODO(all): implement copyWith
  PoralekhaViewModel copyWith({
    List<PoralekhaModel>? items,
  }) {
    return  PoralekhaViewModel(
        items: items ?? this.items,
      );
  }
}
