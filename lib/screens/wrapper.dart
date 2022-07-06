import 'package:flutter/material.dart';
import 'package:memoria/screens/authenticate/authenticate.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    // replace with proper logic later
    // bool isLoggedIn = 1 > 2;
    // return isLoggedIn ? Home() : Authenticate();
    return Authenticate();
  }
}
