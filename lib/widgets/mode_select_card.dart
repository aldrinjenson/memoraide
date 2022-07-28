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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: const [Color(0xFF0979FD), Color(0xFF5CA7FF)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 30,
            spreadRadius: -20,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: TextButton(
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          trailing: const Icon(
            Icons.person,
            size: 45,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }
}
