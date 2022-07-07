import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class faceProfile extends StatefulWidget {
  const faceProfile({Key? key}) : super(key: key);

  @override
  State<faceProfile> createState() => _facesState();
}

class _facesState extends State<faceProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHARAT'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(
          //   image: AssetImage("sharat.png"),
          // ),
          homeButton(context, "HOME", "home"),
        ],
      ),
    );
  }
}
