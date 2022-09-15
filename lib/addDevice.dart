import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class addDevice extends StatefulWidget {
  const addDevice({Key? key}) : super(key: key);

  @override
  State<addDevice> createState() => _addDeviceState();
}

class _addDeviceState extends State<addDevice> {
  final realtime = FirebaseDatabase.instance;
  final firestoreInst = FirebaseFirestore.instance;
  Switches mains = Switches('D1', false);
  List<Switches> switches = [
    Switches('D2', false),
    Switches('D3', false),
    Switches('D4', false),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smartex Control"),
          backgroundColor: Colors.blue,
          elevation: 0.5,
        ),
        body: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "SMARTEX CONTROL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Switch(
                          value: mains.state,
                          onChanged: (value) {
                            setState(() {
                              mains.state = value;
                              if (!mains.state) {
                                switches.forEach((e) {
                                  e.state = false;

                                  createUser(name: e.name, state: e.state);
                                });
                              }
                              createUser(name: mains.name, state: mains.state);
                            });
                          },
                        ),
                      ],
                    ),
                    ...List.generate(
                      switches.length,
                      (index) => Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(66, 111, 111, 111),
                              blurRadius: 10,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/socket.png"),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            children: <Widget>[
                              Switch(
                                value: switches[index].state,
                                onChanged: !mains.state
                                    ? null
                                    : (value) {
                                        setState(() {
                                          switches[index].state = value;
                                          createUser(
                                            name: switches[index].name,
                                            state: switches[index].state,
                                          );
                                        });
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createUser({required String name, required bool state}) async {
    final realtime = FirebaseDatabase.instance
        .refFromURL('https://smartex-fc0ff-default-rtdb.firebaseio.com/$name');
    // final docUser = FirebaseFirestore.instance.collection('https://smartex-fc0ff-default-rtdb.firebaseio.com').doc(name);

    final json = {
      'state': state ? 1 : 0,
    };
    await realtime.set(json);
  }
}

class Switches {
  String name;
  bool state;

  Switches(this.name, this.state);
}
