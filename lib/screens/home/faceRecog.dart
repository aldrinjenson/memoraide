// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:memoria/screens/home/face_profile.dart';
import 'package:memoria/screens/home/face_search.dart';
import 'package:memoria/widgets/starter_design.dart';

class Faces extends StatefulWidget {
  Faces({Key? key}) : super(key: key);

  @override
  State<Faces> createState() => _FacesState();
}

List<Map<String, String>> allPeople = [
  {'name': 'Sharat', 'imgUrl': 'assets/Sharat.png'},
  {'name': 'Nikita', 'imgUrl': 'assets/Nikita.png'},
  {'name': 'Pranav', 'imgUrl': 'assets/Pranav.png'},
  {'name': 'Adithya', 'imgUrl': 'assets/Adithya.png'},
  {'name': 'Nayana', 'imgUrl': 'assets/Nayana.png'},
  {'name': 'Krishnendhu', 'imgUrl': 'assets/Krishnendhu.png'},
];

class _FacesState extends State<Faces> {
  List<Map<String, String>> people = allPeople;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StartingDesign(
                "people", "hold your near and dear loved ones close", "home"),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 210, 208, 208),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 1, // when user presses enter it will adapt to it
                decoration:
                    InputDecoration.collapsed(hintText: 'Search for people..'),
                onChanged: (String searchVal) {
                  print(searchVal);
                  Iterable<Map<String, String>> filtered = allPeople.where(
                      (el) => el.values
                          .toList()[0]
                          .toLowerCase()
                          .contains(searchVal));
                  setState(() {
                    people = filtered.toList();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FaceSearch()));
                    },
                  ),
                ),
              ],
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2, // width/height ratio
                mainAxisSpacing: 0, // between rows
                crossAxisSpacing: 0, // between columns
              ),
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                return FaceButton(people[index].values.toList()[0],
                    people[index].values.toList()[1]);
              },
              itemCount: people.length,
            ),
            // Wrap(
            //   runSpacing: 5.0,
            //   spacing: 5.0,
            //   children: [
            //     ListView.builder(
            //       scrollDirection: Axis.vertical,
            //       shrinkWrap: true,
            //       itemCount: people.length,
            //       itemBuilder: (context, index) => FaceButton(
            //           people[index].values.toList()[0],
            //           people[index].values.toList()[1]),
            //     ),
            //   ],
            // ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class FaceButton extends StatelessWidget {
  late String personName;
  late String personImgUrl;

  FaceButton(String pName, String imgUrl, {Key? key}) : super(key: key) {
    personName = pName;
    personImgUrl = imgUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                // "assets/$personName.png",
                personImgUrl,
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 30,
                spreadRadius: -18,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => const ModeSelect(),
                  builder: (context) => FaceProfile(pName: personName),
                ),
              );
              // Navigator.pushNamed(
              //   context,
              //   '/faceProfile',
              // );
            },
            child: Text(
              ".",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Text(
          personName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
