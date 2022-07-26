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
    return Container(
      margin: EdgeInsets.all(5),
      width: 100,
      height: 100,
      child: ElevatedButton(
        child: Stack(
          children: const [
            Image(
              image: AssetImage("assets/Sharat.png"),
              fit: BoxFit.fill,
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/faceProfile');
        },
      ),
    );
  }
}
