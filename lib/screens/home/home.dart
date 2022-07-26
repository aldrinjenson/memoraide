import 'package:flutter/material.dart';
import 'package:memoria/widgets/starter_design.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Widget homeButton(BuildContext context, String g, String h) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    padding: EdgeInsets.all(15),
    width: double.infinity,
    height: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [Color(0xFF0979FD), Color(0xFF5CA7FF)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 30,
          spreadRadius: -15,
          offset: Offset(4, 8), // Shadow position
        ),
      ],
    ),
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(-6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: () {
        if (h == "home") {
          Navigator.pop(context);
        } else {
          Navigator.pushNamed(context, '/$h');
        }
      },
      child: Text(
        g,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StartingDesign("MEMORIA", "We are here for you", "homes"),
            homeButton(context, "GEOLOCATION", "geolocation"),
            homeButton(context, "FACES", "faces"),
            homeButton(context, "SNAPSHOTS", "snapshots"),
            homeButton(context, "JOURNAL", "journal"),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
