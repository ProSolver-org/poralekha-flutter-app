import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poralekha_flutter_app/poralekha/index.dart';

class PoralekhaScreen extends StatefulWidget {
  const PoralekhaScreen({
    required PoralekhaBloc poralekhaBloc,
    Key? key,
  })  : _poralekhaBloc = poralekhaBloc,
        super(key: key);

  final PoralekhaBloc _poralekhaBloc;

  @override
  PoralekhaScreenState createState() {
    return PoralekhaScreenState();
  }
}

class PoralekhaScreenState extends State<PoralekhaScreen> {
  PoralekhaScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoralekhaBloc, PoralekhaState>(
        bloc: widget._poralekhaBloc,
        builder: (
          BuildContext context,
          PoralekhaState currentState,
        ) {
          if (currentState is UnPoralekhaState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorPoralekhaState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: _load,
                    child: const Text('reload'),
                  ),
                ),
              ],
            ));
          }
          if (currentState is InPoralekhaState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._poralekhaBloc.add(LoadPoralekhaEvent());
  }
}
