// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:memoria/screens/home/face_search.dart';

class ModeSelectCard extends StatelessWidget {
  String title = '';
  String subTitle = '';
  String temp = 'hi';
  ModeSelectCard({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    fontSize: 20,
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
                    Navigator.pushNamed(context, '/home');
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
