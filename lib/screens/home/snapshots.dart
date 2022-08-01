// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:memoria/screens/cameraScreens/camera_screen.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/widgets/starter_design.dart';
// import 'package:memoria/screens/home/home.dart';

class Snapshots extends StatefulWidget {
  const Snapshots({Key? key}) : super(key: key);

  @override
  State<Snapshots> createState() => _SnapshotsState();
}

class _SnapshotsState extends State<Snapshots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StartingDesign("snapshots",
                "add memories that you would like to capture forever", "home"),
            ElevatedButton(
                onPressed: () async {
                  final cameras = await availableCameras();
                  final firstCamera = cameras.first;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TakePictureScreen(
                        camera: firstCamera,
                      ),
                    ),
                  );
                },
                child: Text('+')),
            SizedBox(height: 20),
            Snapshot("testsnap1"),
            Snapshot("testsnap2"),
            Snapshot("testsnap3"),
            Snapshot("testsnap1"),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class Snapshot extends StatelessWidget {
  late String SnapName;
  Snapshot(
    String SN, {
    Key? key,
  }) : super(key: key) {
    SnapName = SN;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 44, 44, 44),
            blurRadius: 30,
            spreadRadius: -35,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage("assets/$SnapName.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "This is $SnapName",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "24 JULY",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
