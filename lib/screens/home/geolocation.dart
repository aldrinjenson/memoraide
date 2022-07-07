import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class geolocation extends StatefulWidget {
  const geolocation({Key? key}) : super(key: key);

  @override
  State<geolocation> createState() => _geolocationState();
}

class _geolocationState extends State<geolocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GEOLOCATION'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          homeButton(context, "HOME", "home"),
        ],
      ),
    );
  }
}
