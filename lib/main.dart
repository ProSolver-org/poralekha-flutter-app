import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_counter/app.dart';
//import 'package:flutter_counter/counter_observer.dart';
import './counter_observer.dart';
import 'app.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
