// @dart=2.9
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:front_end_amplify/screens/email_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:front_end_amplify/shared/globals.dart';
import 'package:front_end_amplify/viewmodels/home_model.dart';
import 'package:front_end_amplify/widgets/button_widget.dart';
import 'package:front_end_amplify/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<HomeModel>(context);

    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Sign up'),
      ),
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
                'Cool Message',
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
                  height: 50.0,
                ),
              ],
            ),
            ButtonWidget(
              title: 'Create Account',
              hasBorder: false,
              onPressed: () => _createAccountOnPressed(context),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createAccountOnPressed(BuildContext context) async {
      final email = _emailController.text;
      final password = _passwordController.text;
      
      try{       
          await Amplify.Auth.signUp(
          username: email, 
          password: password,
          options: CognitoSignUpOptions( userAttributes: {
            'email': email,
            })
          );
          _gotToEmailConfirmationScreen(context, email);
    
      }on AuthException catch (e){
        print(e.message);
        _gotToEmailConfirmationScreen(context, email);
      }
      
  }

  void _gotToEmailConfirmationScreen(BuildContext context, String email) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EmailConfirmationScreen(email: email),
      ),
    ); 
  }
}