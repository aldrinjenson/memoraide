import 'package:flutter/material.dart';
import 'package:memoria/screens/home/face_recog.dart';
import 'package:memoria/screens/home/face_profile.dart';
import 'package:memoria/screens/home/face_search.dart';
import 'package:memoria/screens/home/geolocation.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/screens/home/journal.dart';
import 'package:memoria/screens/home/snapshots.dart';
import 'package:memoria/screens/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Jost',
      primaryColor: const Color(0xFF3D96E8),
    ),
    initialRoute: '/faces',
    routes: {
      '/': (context) => const Wrapper(),
      '/home': (context) => const Home(),
      '/geolocation': (context) => const geolocation(),
      '/snapshots': (context) => const snapshots(),
      '/faces': (context) => const faces(),
      '/facesearch': (context) => const FaceSearch(),
      '/faceProfile': (context) => const faceProfile(),
      '/journal': (context) => const Journal(),
    },
  ));
}
