// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memoria/screens/cameraScreens/camera_screen.dart';
import 'package:memoria/utils.dart';
import 'package:memoria/widgets/custom_button.dart';
import 'package:memoria/widgets/snapshot_image_card.dart';
import 'package:memoria/widgets/starter_design.dart';

class Snapshots extends StatefulWidget {
  const Snapshots({Key? key}) : super(key: key);

  @override
  State<Snapshots> createState() => _SnapshotsState();
}

class _SnapshotsState extends State<Snapshots> {
  dynamic firebaseData;
  List<Map<String, dynamic>> snapShots = [];

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
    } catch (e) {
      print("error in gettin data from firestore");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> generateVideo() async {
    print('generating video');
    print(snapShots);
    List images = snapShots
        .map((snapshot) =>
            {"imgName": snapshot["imageName"], "url": snapshot['url']})
        .toList();
    print(images);
    String videoUrl = await callBackendAPI(images);
    print(videoUrl);
    Navigator.pushNamed(context, '/snapshotVideo',
        arguments: {"videoUrl": videoUrl});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StartingDesign("SnapshotS",
                "Add Memories that you would like to capture forever", "home"),
            CustomButton(
                text: "Check Generated Video",
                callback: () => Navigator.pushNamed(context, '/snapshotVideo',
                    arguments: {"videoUrl": 'http://localhost:5000/video'})),
            CustomButton(
                text: "Generate Video", callback: () => generateVideo()),
            CustomButton(
                text: "Add Photos",
                callback: () async {
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
                }),
            snapShots == null
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapShots.length,
                    itemBuilder: ((context, index) => SnapshotImageCard(
                        imageUrl: snapShots[index]['url'],
                        SnapName: snapShots[index]['imageName'],
                        imageText: snapShots[index]['text'],
                        imageDate: DateTime.parse(
                          snapShots[index]['addedTime'],
                        ))),
                  ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
