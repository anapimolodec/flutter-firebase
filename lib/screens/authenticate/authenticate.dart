import 'package:ff/screens/authenticate/register.dart';
import 'package:ff/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Container(
          color: Colors.white, child: SignIn(function: toggleView));
    } else {
      return Container(
          color: Colors.white, child: Register(function: toggleView));
    }
  }
}
