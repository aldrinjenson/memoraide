// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:memoria/screens/home/face_search.dart';
import 'package:memoria/widgets/starter_design.dart';

class Faces extends StatefulWidget {
  const Faces({Key? key}) : super(key: key);

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
                              builder: (context) => const FaceSearch()));
                    },
                  ),
                ),
                FaceButton(),
                FaceButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FaceButton(),
                FaceButton(),
                FaceButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaceButton(),
                FaceButton(),
                FaceButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaceButton(),
                FaceButton(),
                FaceButton(),
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
  const FaceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          width: 100,
          height: 100,
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
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  "assets/Sharat.png",
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
              Navigator.pushNamed(context, '/faceProfile');
            },
            child: Text(
              "ButtonName",
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
}
