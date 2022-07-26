import 'package:flutter/material.dart';
import 'package:memoria/screens/authenticate/sign_in.dart';
import 'package:memoria/screens/authenticate/sign_up.dart';
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
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      theme: ThemeData(
          fontFamily: 'Jost',
          primaryColor: const Color.fromARGB(255, 9, 16, 21)),
      initialRoute: '/',
      routes: {
        '/': (context) => const Wrapper(),
        '/home': (context) => const Home(),
        '/signup': (context) => const SignUp(),
        '/signin': (context) => const SignIn(),
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
