import 'package:flutter/material.dart';
import 'package:memoria/widgets/starter_design.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Widget homeButton(BuildContext context, String g, String h) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    padding: EdgeInsets.all(15),
    width: double.infinity,
    height: 120,
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
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
          fontSize: 16,
          color: Colors.white,
          fontFamily: 'Jost',
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
            StartingDesign(),
            homeButton(context, "GEOLOCATION", "geolocation"),
            homeButton(context, "FACES", "faces"),
            homeButton(context, "SNAPSHOTS", "snapshots"),
            homeButton(context, "JOURNAL", "journal"),
          ],
        ),
      ),
    );
  }
}
