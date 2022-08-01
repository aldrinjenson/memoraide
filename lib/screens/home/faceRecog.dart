// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:memoria/screens/home/face_search.dart';
import 'package:memoria/widgets/starter_design.dart';

class Faces extends StatefulWidget {
  Faces({Key? key}) : super(key: key);

  @override
  State<Faces> createState() => _FacesState();
}

class _FacesState extends State<Faces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StartingDesign(
                "people", "hold your near and dear loved ones close", "home"),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 210, 208, 208),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 1, // when user presses enter it will adapt to it
                decoration:
                    InputDecoration.collapsed(hintText: 'Search for people..'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FaceSearch()));
                    },
                  ),
                ),
                FaceButton("Sharat"),
                FaceButton("Nayana"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaceButton("Nikita"),
                FaceButton("Adithya"),
                FaceButton("Pranav"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaceButton("Nayana"),
                FaceButton("Sharat"),
                FaceButton("Nikita"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaceButton("Pranav"),
                FaceButton("Adithya"),
                FaceButton("Sharat"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaceButton("Nayana"),
                FaceButton("Sharat"),
                FaceButton("Nikita"),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class FaceButton extends StatelessWidget {
  late String PersonName;
  FaceButton(
    String PN, {
    Key? key,
  }) : super(key: key) {
    PersonName = PN;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            "assets/$PersonName.png",
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 30,
            spreadRadius: -18,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/faceProfile');
        },
        child: Text(
          ".",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
