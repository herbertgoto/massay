
// @dart=2.9
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {

  MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('LLEGUE AL MAIN SCREEN :)')),
    );
  }

}