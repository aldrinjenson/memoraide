import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class FaceProfile extends StatefulWidget {
  const FaceProfile({Key? key}) : super(key: key);

  @override
  State<FaceProfile> createState() => _FacesState();
}

class _FacesState extends State<FaceProfile> {
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
