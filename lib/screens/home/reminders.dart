// ignore_for_file: camel_case_types, unused_import, must_be_immutable

import 'package:memoria/utils.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memoria/widgets/medicine_widgets.dart';
import 'package:memoria/widgets/starter_design.dart';

class Reminders extends StatefulWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  String medicineName = '';
  String timeOfDay = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StartingDesign("reminders",
                "don't forget to take all your medicines on time!", "home"),

            Container(
              //medicine image + number of medicines left to take
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 100,
                    child: Image(
                      image: AssetImage("assets/medicines.png"),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: [Color(0xFF0979FD), Color(0xFF5CA7FF)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Text(
                          "3 more medicines",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Text(
                        "to take for today!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),

            ElevatedButton(
                onPressed: () {
                  createNotif({'title': 'Test title', 'body': 'lorem ipsum'});
                },
                child: Text('Trigger notification')),

            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                child: Text("Add New Medicine"),
                onPressed: () {
                  showModalBottomSheet<void>(
                    //the modal sheet widget

                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: 340,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'ADD NEW MEDICINE',
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 234, 232, 232),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  onChanged: (String value) {
                                    setState(() {
                                      medicineName = value;
                                    });
                                  },
                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,
                                  maxLines:
                                      null, // when user presses enter it will adapt to it
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'Enter name of medicine'),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'TIME OF DAY',
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MedicineTime("MORNING"),
                                  MedicineTime("AFTERNOON"),
                                  MedicineTime("EVENING"),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: const [
                                      Color(0xFF0979FD),
                                      Color(0xFF5CA7FF)
                                    ],
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
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  onPressed: () async {
                                    // Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("Saving new medicine!"),
                                    ));
                                    try {
                                      // dynamic db = FirebaseFirestore.instance;
                                      // final newReminderEntry =
                                      //     <String, dynamic>{
                                      //   'addedTime': DateTime.now(),
                                      //   'entry': reminderEntry
                                      // };
                                      // await db
                                      //     .collection('reminders')
                                      //     .add(newJournalEntry);

                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(SnackBar(
                                      //   content: Text("Medicine saved!"),
                                      // ));
                                      // getData();
                                      // FocusScopeNode currentFocus =
                                      //     FocusScope.of(context);
                                      // if (!currentFocus.hasPrimaryFocus &&
                                      //     currentFocus.focusedChild != null) {
                                      //   currentFocus.focusedChild?.unfocus();
                                      // }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text("Error in saving medicine!"),
                                      ));
                                      print("Error in saving: ");
                                      print(e);
                                    }
                                  },
                                  child: Text(
                                    "SAVE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Medicine(1, "MORNING", "AFTER FOOD"),
            // Medicine(2, "AFTERNOON", "BEFORE FOOD"),
            // Medicine(3, "EVENING", "BEFORE FOOD"),
            // Medicine(4, "EVENING", "AFTER FOOD"),
            // Medicine(5, "EVENING", "AFTER SLEEP"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
