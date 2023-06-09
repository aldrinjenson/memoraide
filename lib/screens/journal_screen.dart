// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memoria/widgets/journal_items.dart';
import 'package:memoria/widgets/starter_design.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  dynamic firebaseData;
  dynamic journalSnapShot;

  Future<void> getData() async {
    var collection = FirebaseFirestore.instance
        .collection('journals')
        .orderBy('addedTime', descending: true);
    var querySnapshots = await collection.get();
    var snapshotData = querySnapshots.docs.map((e) => e.data());
    setState(() {
      journalSnapShot = snapshotData.toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  String journalEntry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StartingDesign(
                "Journal", "pen down your daily thoughts at any time", "home"),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: (String value) {
                  setState(() {
                    journalEntry = value;
                  });
                },
                keyboardType: TextInputType.multiline,
                minLines: 15,
                maxLines: null, // when user presses enter it will adapt to it
                decoration:
                    InputDecoration.collapsed(hintText: 'Enter your thoughts!'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                style: TextButton.styleFrom(
                  backgroundColor:
                      journalEntry.isEmpty ? Colors.grey : Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () async {
                  String msg = "Saving new entry!";
                  if (journalEntry.isEmpty) {
                    return;
                  }
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(msg)));
                  try {
                    dynamic db = FirebaseFirestore.instance;
                    final newJournalEntry = <String, dynamic>{
                      'addedTime': DateTime.now(),
                      'entry': journalEntry
                    };
                    await db.collection('journals').add(newJournalEntry);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Journal entry saved!"),
                    ));
                    getData();
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus &&
                        currentFocus.focusedChild != null) {
                      currentFocus.focusedChild?.unfocus();
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Error in saving journal entry!"),
                    ));
                    print("Error in saving: ");
                    print(e);
                  }
                },
                child: Text(
                  "SAVE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "PREVIOUS ENTRIES",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),
            journalSnapShot == null
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: journalSnapShot.length,
                    itemBuilder: ((context, index) => JournalItem(
                        journalSnapShot[index]['entry'],
                        journalSnapShot[index]['addedTime'])),
                  ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
