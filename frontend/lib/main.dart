// @dart=2.9
// Amplify Flutter Packages
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:front_end_amplify/screens/login_screen.dart';
import 'package:front_end_amplify/viewmodels/home_model.dart';
import 'package:provider/provider.dart';

// Generated in previous step 
import 'amplifyconfiguration.dart'; 


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SF-Pro-Display'),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  initState() {
    super.initState(); 
    _configureAmplify(); 
  }


  void _configureAmplify() async {

    // Add Plugins
    Amplify.addPlugins([AmplifyAuthCognito(),AmplifyAPI()]);

    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
