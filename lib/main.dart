import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:poralekha_flutter_app/counter_observer.dart';
import 'package:poralekha_flutter_app/app.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
