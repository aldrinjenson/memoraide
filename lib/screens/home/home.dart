// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoria/widgets/starter_design.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Widget homeButton(
  BuildContext context,
  String ButtonName,
  String ButtonRoute,
  String ButtonImageName,
) {
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 30,
              spreadRadius: -15,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                "assets/$ButtonImageName.png",
              ),
              opacity: 0.9,
              fit: BoxFit.cover,
            )),
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: () {
            if (ButtonRoute == "home") {
              Navigator.pop(context);
            } else {
              Navigator.pushNamed(context, '/$ButtonRoute');
            }
          },
          child: Text(
            ButtonName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
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
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Successfully logged out')));
                },
                child: Text('Log Out')),
            homeButton(
              context,
              "GEOLOCATION",
              "geolocation",
              "testsnap1",
            ),
            homeButton(
              context,
              "REMINDERS",
              "reminders",
              "testsnap3",
            ),
            homeButton(
              context,
              "FACES",
              "faces",
              "testsnap2",
            ),
            homeButton(
              context,
              "SNAPSHOTS",
              "snapshots",
              "testsnap3",
            ),
            homeButton(
              context,
              "JOURNAL",
              "journal",
              "testsnap1",
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
