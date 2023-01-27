// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SnapshotImageCard extends StatelessWidget {
  final String imageText;
  final DateTime imageDate;
  final String SnapName;
  final String imageUrl;

  // SnapshotImageCard({String SN,Key? key, Snap}) : super(key: key){ SnapName = SN};
  const SnapshotImageCard(
      {super.key,
      required this.SnapName,
      required this.imageDate,
      required this.imageUrl,
      required this.imageText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 44, 44, 44),
            blurRadius: 30,
            spreadRadius: -35,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 260,
                  child: Text(
                    imageText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  DateFormat.yMd().add_jm().format(imageDate),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
