// @dart=2.9
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:front_end_amplify/widgets/customappbar_widget.dart';

class FactorsMainScreen extends StatefulWidget {
  FactorsMainScreen({Key key}) : super(key: key);

  @override
  _FactorsMainScreenState createState() => _FactorsMainScreenState();
}

class _FactorsMainScreenState extends State<FactorsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Amplify.Auth.getCurrentUser(),
      builder: (BuildContext context, AsyncSnapshot<AuthUser> snapshot) {
        final currentUser = snapshot.data;
        return Scaffold(
          appBar: CustomAppBar(
            title: "Factors",
            automaticallyImplyLeading: false,
            wantIcons: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("AWS Amplify"),
                Text("User ID ${currentUser?.userId}"),
                Text("User Name ${currentUser?.username}"),
              ],
            ),
          ),
        );
      },
    );
  }
}