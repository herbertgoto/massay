// @dart=2.9
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:front_end_amplify/screens/Factors/factors_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:front_end_amplify/shared/globals.dart';
import 'package:front_end_amplify/widgets/button_widget.dart';
import 'package:front_end_amplify/widgets/textfield_widget.dart';

class EmailConfirmationScreen extends StatelessWidget {
  final String email;

  EmailConfirmationScreen({
    Key key,
    @required this.email,
  }) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _confirmationCodeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Confirm your email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text(
                'An email confirmation code is sent to $email. Please type the code to confirm your email.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Global.letterColor,
                  fontSize: Global.letterSizeDescription,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextFieldWidget(
                hintText: 'Confirmation Code',
                obscureText: false,
                controller: _confirmationCodeController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 40.0,
              ),
              ButtonWidget(
                title: 'Confirm',
                hasBorder: false,
                onPressed: () => _submitCode(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitCode(BuildContext context) async {
      final confirmationCode = _confirmationCodeController.text;
      try {
        final SignUpResult response = await Amplify.Auth.confirmSignUp(
          username: email,
          confirmationCode: confirmationCode,
        );
        if (response.isSignUpComplete) {
          _gotoMainScreen(context);
        }
      } on AuthException catch (e) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
  }

  void _gotoMainScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => FactorsMainScreen()));
  }
}