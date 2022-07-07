import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JOURNAL'),
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
