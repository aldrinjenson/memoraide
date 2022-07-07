import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JOURNAL'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 200,
              width: 450,
              padding: EdgeInsets.all(15),
              color: Colors.grey[300],
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 15,
                maxLines: null, // when user presses enter it will adapt to it
                decoration:
                    InputDecoration.collapsed(hintText: 'Enter your thoughts!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
