import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class faces extends StatefulWidget {
  const faces({Key? key}) : super(key: key);

  @override
  State<faces> createState() => _facesState();
}

class _facesState extends State<faces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PEOPLE'),
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
