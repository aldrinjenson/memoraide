// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class ModeSelectCard extends StatelessWidget {
  String title = '';
  String subTitle = '';
  String temp = 'hi';
  ModeSelectCard({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(title);
    print(subTitle);
    return Center(
      child: Container(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.white,
                ),
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    // color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    // color: Colors.white,
                  ),
                ),
                trailing: TextButton(
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        // MaterialPageRoute(builder: (context) => const Home()));
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
