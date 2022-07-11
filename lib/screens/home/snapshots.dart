// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';
// import 'package:memoria/screens/home/home.dart';

class snapshots extends StatefulWidget {
  const snapshots({Key? key}) : super(key: key);

  @override
  State<snapshots> createState() => _snapshotsState();
}

class _snapshotsState extends State<snapshots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SNAPSHOTS'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          homeButton(context, "HOME", "home"),
        ],
      ),
    );
  }
}
