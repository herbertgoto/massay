// @dart=2.9
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_amplify/screens/Factors/factors_main_screen.dart';
import 'package:front_end_amplify/screens/signup_screen.dart';
import 'package:front_end_amplify/shared/globals.dart';
import 'package:front_end_amplify/viewmodels/home_model.dart';
import 'package:front_end_amplify/widgets/button_widget.dart';
import 'package:front_end_amplify/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<HomeModel>(context);

    return Scaffold(
      backgroundColor: Global.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/login_image.png'),
            ),
            Center(
              child: Text(
                'Welcome message',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Global.letterColor,
                  fontSize: Global.letterSizeDescription,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'Burnout detection app... text. message description about the survey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Global.letterColor,
                  fontSize: Global.letterSizeDescription,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFieldWidget(
              hintText: 'Email',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              suffixIconData: model.isValid ? Icons.check : null,
              onChanged: (value){
                model.isValidEmail(value);
              },
              controller: _emailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  hintText: 'Password',
                  obscureText: model.isVisible ? false : true,
                  prefixIconData: Icons.lock_outline,
                  suffixIconData: model.isVisible ? Icons.visibility : Icons.visibility_off,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Global.mediumBlue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonWidget(
              title: 'Login',
              hasBorder: false,
              onPressed: () => _loginButtonOnPressed(context),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonWidget(
              title: 'Sign Up',
              hasBorder: true,
              onPressed: () => _gotoSignUpScreen(context),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loginButtonOnPressed(BuildContext context) async {
      final email = _emailController.text;
      final password = _passwordController.text;

      try {
        SignInResult res = await Amplify.Auth.signIn(
          username: email,
          password: password,
        );

        if(res.isSignedIn){
          Navigator.push(
            context,
            MaterialPageRoute(
              //TODO Change FactorsMainScreen to MainScreen
              builder: (_) => FactorsMainScreen(),
            ),
          );
        }       
      } on AuthException catch (e) {
        print(e.message);
        //TODO DELETE LATER
        await Amplify.Auth.signOut();
      }

  }

  void _gotoSignUpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignUpScreen(),
      ),
    );
  }
}