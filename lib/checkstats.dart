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
        body: const Center(
          child: Text(
            "Check Stats",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
