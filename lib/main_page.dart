import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectwork/auth_page.dart';
import 'package:projectwork/firstpage.dart';
import 'package:projectwork/signup.dart';
import 'package:projectwork/splash.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return firstpage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
