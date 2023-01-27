// ignore_for_file: use_build_context_synchronously, override_on_non_overriding_member

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// final storage = FirebaseStorage.instance;
final storageRef = FirebaseStorage.instance.ref();
dynamic db = FirebaseFirestore.instance;

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String imageName;

  DisplayPictureScreen(
      {super.key, required this.imagePath, required this.imageName});

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Display the Picture')),
        body: Column(
          children: [
            Image.file(File(imagePath)),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description or note you want to remember',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (myController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please add a valid description!")));
                    return;
                  }
                  String fileName = imageName + DateTime.now().toString();
                  final imageRef = storageRef.child(fileName);
                  try {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Uploading image...")));
                    var res = await imageRef.putFile(File(imagePath));
                    String url = await imageRef.getDownloadURL();
                    final newSnapShotEntry = <String, dynamic>{
                      'addedTime': DateTime.now().toIso8601String(),
                      'imageName': fileName,
                      'url': url,
                      'text': myController.text
                    };
                    await db.collection('snapshots').add(newSnapShotEntry);
                    print(res);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("successfully uploaded")));
                    Navigator.of(context).pop();
                  } on FirebaseException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "There seems to be some error in uploading. please check your internet connectivity and try again in a short while!")));
                    print("error in uploading file..");
                    print(e.message);
                  }
                },
                child: Text("Upload and save Photo"))
          ],
        ));
  }
}
