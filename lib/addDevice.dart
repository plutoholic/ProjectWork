import 'dart:ui';
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
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;

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
                          value: isSwitched4,
                          onChanged: (value) {
                            setState(() {
                              isSwitched1 = value;
                              isSwitched2 = value;
                              isSwitched3 = value;
                              isSwitched4 = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
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
                              value: isSwitched1,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched1 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
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
                              value: isSwitched2,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched2 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
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
                              value: isSwitched3,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched3 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
