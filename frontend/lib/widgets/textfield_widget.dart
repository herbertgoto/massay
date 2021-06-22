// @dart=2.9
import 'package:flutter/material.dart';
import 'package:front_end_amplify/shared/globals.dart';
import 'package:front_end_amplify/viewmodels/home_model.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;

  TextFieldWidget({
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<HomeModel>(context);

    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Global.mediumBlue,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.mediumBlue),
        ),
        suffixIcon: GestureDetector(
          onTap: (){
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Global.mediumBlue,
          ),
        ),
        labelStyle: TextStyle(color: Global.mediumBlue),
      ) 
    );
  }
}