import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoria/screens/authenticate/authenticate.dart';
import 'package:memoria/screens/home/home.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isUserLoggedIn = false;

  void updateUserStatus() {
    User? user = FirebaseAuth.instance.currentUser;
    print(user);
    if (!mounted) {
      print('not mounted. exiting');
      return;
    }
    setState(() {
      isUserLoggedIn = user != null;
    });
  }

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print('inside, auth status changed');
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          isUserLoggedIn = false;
        });
      } else {
        print('User is signed in!');
        setState(() {
          isUserLoggedIn = true;
        });
        print(user);
        print(user.uid);
      }
      updateUserStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: isUserLoggedIn ? Home() : Authenticate(),
    ));

    // return Authenticate();
  }
}
