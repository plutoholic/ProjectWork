import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class checkstats extends StatefulWidget {
  const checkstats({Key? key}) : super(key: key);

  @override
  State<checkstats> createState() => _checkstatsState();
}

class _checkstatsState extends State<checkstats> {
  DatabaseReference ref = FirebaseDatabase.instance
      .refFromURL('https://smartex-fc0ff-default-rtdb.firebaseio.com/Sensor');

  bool isLoading = false;
  List<DataSnapshot> data = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        isLoading = true;
      });
      data = (await ref.get()).children.toList();
      setState(() {
        isLoading = false;
      });
    });
  }

  final realtime = FirebaseDatabase.instance;

  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd MMMM, yyy");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Check Stats"),
        ),
        body: Builder(builder: (context) {
          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (data.isEmpty) {
            return Center(
              child: Text("Something went wrong"),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "${dateFormat.format(date)}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Voltage:  ${data[1].value}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Current: ${data[2].value}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Power used: ${data[0].value}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
