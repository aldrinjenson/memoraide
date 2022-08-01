import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/widgets/starter_design.dart';

class FaceProfile extends StatefulWidget {
  const FaceProfile({Key? key}) : super(key: key);

  @override
  State<FaceProfile> createState() => _FacesState();
}

class _FacesState extends State<FaceProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StartingDesign("Sharat", "your son", "home"),
          Image(
            image: AssetImage("assets/sharat.png"),
          ),
          homeButton(
            context,
            "HOME",
            "home",
            "testsnap1",
          ),
        ],
      ),
    );
  }
}
