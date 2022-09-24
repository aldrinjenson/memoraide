// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memoria/screens/cameraScreens/camera_screen.dart';
import 'package:memoria/widgets/starter_design.dart';

class Snapshots extends StatefulWidget {
  const Snapshots({Key? key}) : super(key: key);

  @override
  State<Snapshots> createState() => _SnapshotsState();
}

class _SnapshotsState extends State<Snapshots> {
  dynamic firebaseData;
  dynamic snapShots;

  Future<void> getData() async {
    try {
      var collection = FirebaseFirestore.instance
          .collection('snapshots')
          .orderBy('addedTime', descending: true);
      var querySnapshots = await collection.get();
      var snapshotData = querySnapshots.docs.map((e) => e.data());
      setState(() {
        snapShots = snapshotData.toList();
      });
      print(snapshotData.toList());
    } catch (e) {
      print("error in gettin data from firestore");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
            snapShots == null
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapShots.length,
                    itemBuilder: ((context, index) => Snapshot(
                        imageUrl: snapShots[index]['url'],
                        SnapName: snapShots[index]['imageName'],
                        imageText: snapShots[index]['text'],
                        imageDate: DateTime.parse(
                          snapShots[index]['addedTime'],
                        ))),
                  ),
            // Snapshot(
            //     SnapName: "testsnap1",
            //     imageDate: DateTime.now(),
            //     imageText: 'bruh'),
            // Snapshot(
            //     SnapName: "testsnap2",
            //     imageDate: DateTime.now(),
            //     imageText: 'bruh'),
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
  final String imageText;
  final DateTime imageDate;
  final String SnapName;
  final String imageUrl;

  // Snapshot({String SN,Key? key, Snap}) : super(key: key){ SnapName = SN};
  const Snapshot(
      {super.key,
      required this.SnapName,
      required this.imageDate,
      required this.imageUrl,
      required this.imageText});

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
                image: NetworkImage(imageUrl),
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
                  imageText,
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
