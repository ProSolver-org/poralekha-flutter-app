import 'package:flutter/material.dart';
import 'package:poralekha_flutter_app/poralekha/index.dart';

class PoralekhaPage extends StatefulWidget {
  static const String routeName = '/poralekha';

  @override
  _PoralekhaPageState createState() => _PoralekhaPageState();
}

class _PoralekhaPageState extends State<PoralekhaPage> {
  final _poralekhaBloc = PoralekhaBloc(UnPoralekhaState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poralekha'),
      ),
      body: PoralekhaScreen(poralekhaBloc: _poralekhaBloc),
    );
  }
}
