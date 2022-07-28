import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/widgets/starter_design.dart';

class Geolocation extends StatefulWidget {
  const Geolocation({Key? key}) : super(key: key);

  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
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
