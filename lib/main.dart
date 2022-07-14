import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memoria/screens/home/faceRecog.dart';
import 'package:memoria/screens/home/face_profile.dart';
import 'package:memoria/screens/home/face_search.dart';
import 'package:memoria/screens/home/geolocation.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/screens/home/journal.dart';
import 'package:memoria/screens/home/snapshots.dart';
import 'package:memoria/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//   dynamic db = FirebaseFirestore.instance;
//   // Create a new user with a first and last name
//   final user = <String, dynamic>{
//     "first": "Ada",
//     "last": "Lovelace",
//     "born": 1815
//   };

// // Add a new document with a generated ID
//   db.collection("users").add(user).then((DocumentReference doc) =>
//       print('DocumentSnapshot added with ID: ${doc.id}'));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Jost',
        primaryColor: const Color(0xFF3D96E8),
      ),
      initialRoute: '/faces',
      routes: {
        '/': (context) => const Wrapper(),
        '/home': (context) => const Home(),
        '/geolocation': (context) => const geolocation(),
        '/snapshots': (context) => const Snapshots(),
        '/faces': (context) => const Faces(),
        '/facesearch': (context) => const FaceSearch(),
        '/faceProfile': (context) => const FaceProfile(),
        '/journal': (context) => const Journal(),
      },
    ),
  );
}
