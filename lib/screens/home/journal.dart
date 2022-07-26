import 'package:flutter/material.dart';
import 'package:memoria/widgets/starter_design.dart';
// import 'package:memoria/screens/home/home.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            StartingDesign(
                "journal", "pen down your daily thoughts at any time", "home"),
            Container(
              height: 200,
              width: 450,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              color: Colors.grey[100],
              child: TextField(
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
                  colors: [Color(0xFF0979FD), Color(0xFF5CA7FF)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                boxShadow: [
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {},
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
            SavedEntries(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            SavedEntries(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            SavedEntries(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class SavedEntries extends StatelessWidget {
  late String Entry;
  SavedEntries(
    String E, {
    Key? key,
  }) : super(key: key) {
    Entry = E;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 30,
            spreadRadius: -30,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Text.rich(
        TextSpan(
          text: "24 July 2021\n\n",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          children: <InlineSpan>[
            TextSpan(
              text: Entry,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: "\n\nJournaled at 11:59 PM",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
