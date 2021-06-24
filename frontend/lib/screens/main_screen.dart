// @dart=2.9
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          fit: BoxFit.fitWidth,
          alignment: FractionalOffset.topCenter,
          image: AssetImage('assets/images/main_screen.png'),
        )),
      ),
    );
  }
}
