import 'package:flutter/material.dart';
import 'package:projectwork/signup.dart';
import 'package:projectwork/splash.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially show, the login page boolean

  bool showSplash = true;

  void toggleScreens() {
    setState(() {
      showSplash = !showSplash;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSplash) {
      return Splash(showSignup: toggleScreens);
    } else {
      return Signup(showSplash: toggleScreens);
    }
  }
}
