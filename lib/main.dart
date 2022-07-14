import 'package:flutter/material.dart';
import 'package:memoria/screens/home/faceRecog.dart';
import 'package:memoria/screens/home/face_profile.dart';
import 'package:memoria/screens/home/geolocation.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/screens/home/journal.dart';
import 'package:memoria/screens/home/snapshots.dart';
import 'package:memoria/screens/wrapper.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Jost',
      primaryColor: const Color(0xFF3D96E8),
          ),
    initialRoute: '/',
    routes: {
      '/': (context) => const Wrapper(),
      '/home': (context) => const Home(),
      '/geolocation': (context) => const geolocation(),
      '/snapshots': (context) => const Snapshots(),
      '/faces': (context) => const Faces(),
      '/faceProfile': (context) => const FaceProfile(),
      '/journal': (context) => const Journal(),
    },
  ));
}
