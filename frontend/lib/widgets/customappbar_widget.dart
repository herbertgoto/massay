// @dart=2.9
import 'package:flutter/material.dart';
import 'package:front_end_amplify/shared/globals.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final bool automaticallyImplyLeading;
  final bool wantIcons;

  const CustomAppBar({
    Key key,
    this.title,
    this.automaticallyImplyLeading,
    this.wantIcons,
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
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}