import 'package:flutter/material.dart';
import 'package:projectwork/main_page.dart';
import 'package:projectwork/signup.dart';
import 'package:projectwork/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
