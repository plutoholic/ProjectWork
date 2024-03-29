import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectwork/addDevice.dart';
import 'package:projectwork/checkstats.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: SizedBox(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        width: 220,
                        margin: const EdgeInsets.only(
                          top: 40,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(120),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                            ),
                          ],
                          image: const DecorationImage(
                            image: AssetImage("assets/girl.jpg"),
                          ),
                        ),
                      ),
                      const Text(
                        "Francis Agyemang",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Email:" + user.email!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const addDevice()));
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Colors.black,
                                    elevation: 3),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 15,
                                  ),
                                  child: Text(
                                    "Device Control",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const checkstats()));
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Color.fromARGB(255, 0, 0, 0),
                                    elevation: 3),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 15,
                                  ),
                                  child: Text(
                                    "Check Usage",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 12,
                              right: 12,
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Colors.white,
                                    elevation: 3),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 15,
                                  ),
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
