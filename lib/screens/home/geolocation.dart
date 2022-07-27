import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/widgets/starter_design.dart';

class geolocation extends StatefulWidget {
  const geolocation({Key? key}) : super(key: key);

  @override
  State<geolocation> createState() => _geolocationState();
}

class _geolocationState extends State<geolocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StartingDesign("places", "check out where you are at", "home"),
          homeButton(context, "HOME", "home","testsnap1",),
        ],
      ),
    );
  }
}
