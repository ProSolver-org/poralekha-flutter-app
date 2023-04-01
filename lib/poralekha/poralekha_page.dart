import 'package:flutter/material.dart';
import 'package:poralekha_flutter_app/poralekha/index.dart';

class PoralekhaPage extends StatefulWidget {
  const PoralekhaPage({required this.bloc, super.key});
  static const String routeName = '/poralekha';

  final PoralekhaBloc bloc;

  @override
  State<PoralekhaPage> createState() => _PoralekhaPageState();
}

class _PoralekhaPageState extends State<PoralekhaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Poralekha'),
        actions: [
          IconButton(
            icon: const Icon(Icons.error),
            onPressed: () {
              widget.bloc.add(ErrorPoralekhaEvent());
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              widget.bloc.add(AddPoralekhaEvent());
            },
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              widget.bloc.add(ClearPoralekhaEvent());
            },
          ),
        ],
      ),
      body: PoralekhaScreen(bloc: widget.bloc),
    );
  }
}
