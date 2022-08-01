import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/widgets/starter_design.dart';

class FaceProfile extends StatefulWidget {
  // const FaceProfile({Key? key}) : super(key: key);

  const FaceProfile({Key? key, required String pName}) : super(key: key);

  @override
  State<FaceProfile> createState() => _FacesState();
}

class _FacesState extends State<FaceProfile> {
  late String personName;

  FaceProfile(String pName) {
    personName = pName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StartingDesign("Sharat", "Your friend", "home"),
          Image(
            image: AssetImage("assets/$personName.png"),
          ),
          Text("Relation: Friend"),
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
