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
  Switches main = Switches('main', false);
  List<Switches> switches = [
    Switches('switch1', false),
    Switches('switch2', false),
    Switches('switch3', false),
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
                          value: main.state,
                          onChanged: (value) {
                            setState(() {
                              main.state = value;
                              if (!main.state) {
                                switches.forEach((e) {
                                  e.state = false;

                                  createUser(name: e.name, state: e.state);
                                });
                              }
                              createUser(name: main.name, state: main.state);
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
                                onChanged: !main.state
                                    ? null
                                    : (value) {
                                        setState(() {
                                          switches[index].state = value;
                                          createUser(
                                              name: switches[index].name,
                                              state: switches[index].state);
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
    final docUser = FirebaseFirestore.instance.collection('Switch').doc(name);

    final json = {
      'name': name,
      'state': state,
    };
    await docUser.set(json);
  }
}

class Switches {
  String name;
  bool state;

  Switches(this.name, this.state);
}
