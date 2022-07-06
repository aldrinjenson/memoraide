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
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('lorem ipsum'),
                subtitle: Text(
                    'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Select'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          // MaterialPageRoute(builder: (context) => const Home()));
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
