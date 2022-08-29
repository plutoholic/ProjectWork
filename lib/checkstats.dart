import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class checkstats extends StatefulWidget {
  const checkstats({Key? key}) : super(key: key);

  @override
  State<checkstats> createState() => _checkstatsState();
}

class _checkstatsState extends State<checkstats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Check Stats"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                "Voltage",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "     Current",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "     Total Power Usage",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
