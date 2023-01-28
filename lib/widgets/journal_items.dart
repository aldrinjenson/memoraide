// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JournalItem extends StatelessWidget {
  late String Entry;
  late DateTime date;

  JournalItem(String entry, Timestamp dt, {Key? key}) : super(key: key) {
    Entry = entry;
    date = dt.toDate();
  }

  DateFormat dateFormat = DateFormat("HH:mm a dd/mm/yy");

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 30,
            spreadRadius: -30,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Text(Entry),
          Text(
            dateFormat.format(date),
          ),
        ],
      ),
    );
  }
}
