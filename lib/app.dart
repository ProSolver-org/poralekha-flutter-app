import 'package:flutter/material.dart';
import 'package:poralekha_flutter_app/counter/counter.dart';
import 'package:poralekha_flutter_app/poralekha/index.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
/* class CounterApp extends MaterialApp {
  /// {@macro counter_app}
  const CounterApp({super.key}) : super(home: const CounterPage());
} */
class PoralekhaApp extends MaterialApp {
  /// {@macro counter_app}
  PoralekhaApp({super.key}) : super(home: PoralekhaPage());
}
