// @dart=2.9
import 'package:flutter/material.dart';
import 'package:front_end_amplify/screens/Factors/factor_sleep_question.dart';
import 'package:front_end_amplify/shared/globals.dart';
import 'package:front_end_amplify/widgets/button_widget.dart';
import 'package:front_end_amplify/widgets/customappbar_widget.dart';

class FactorsMainScreen extends StatelessWidget {
  FactorsMainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Factors',
        automaticallyImplyLeading: false,
        wantIcons: false,
      ),
      backgroundColor: Global.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              Text(
                Global.stringFactorsInitialMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Global.letterColor,
                  fontSize: Global.letterSizeFactorsMain,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Image(
                  image: AssetImage('assets/images/factor_init_image.png'),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -100.0, 0.0),
                child: Text(
                  Global.stringInitialMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Global.letterColor,
                    fontSize: Global.letterSizeFactorQuestion,
                    fontWeight: FontWeight.w400,
                    fontFamily: Global.sFProText,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: ButtonBar(
                  alignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 150,
                      child: ButtonWidget(
                        title: 'Next   >',
                        hasBorder: false,
                        onPressed: () => _gotoFactorsQuestion(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoFactorsQuestion(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => FactorSleepQuestion(), fullscreenDialog: true));
  }
}