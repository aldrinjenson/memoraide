// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';
// import 'package:memoria/screens/home/home.dart';

class Snapshots extends StatefulWidget {
  const Snapshots({Key? key}) : super(key: key);

  @override
  State<Snapshots> createState() => _SnapshotsState();
}

class _SnapshotsState extends State<Snapshots> {
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
