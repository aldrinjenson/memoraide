import 'package:flutter/material.dart';
import 'package:memoria/screens/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Memoria'),
          centerTitle: true,
          backgroundColor: Colors.blue[400],
        ),
        body: Center(child: (SignUp())));
  }
}
