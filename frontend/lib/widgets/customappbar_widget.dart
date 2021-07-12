// @dart=2.9
import 'package:flutter/material.dart';
import 'package:front_end_amplify/shared/globals.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;


  const CustomAppBar({
    Key key,
    this.title,
    this.actions,
    this.automaticallyImplyLeading,
  }) : super(key:key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Global.white,
      centerTitle: true,
      title: 
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: Global.letterSizeFactorTitle,
          ),
        ),
      elevation: 10,
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: IconThemeData(
        color: Colors.blue,
      ),
      actions: actions,
    );
  }

}