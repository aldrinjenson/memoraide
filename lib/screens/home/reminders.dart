// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/widgets/starter_design.dart';
// import 'package:memoria/screens/home/home.dart';

class Reminders extends StatefulWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StartingDesign("reminders",
                "don't forget to take all your medicines on time!", "home"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250,
                  height: 200,
                  child: Image(
                    image: AssetImage("assets/medicines.png"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 200,
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
            SizedBox(height: 20),
            Medicine(1, "MORNING", "AFTER FOOD"),
            Medicine(2, "AFTERNOON", "BEFORE FOOD"),
            Medicine(3, "EVENING", "BEFORE FOOD"),
            Medicine(4, "EVENING", "AFTER FOOD"),
            Medicine(5, "EVENING", "AFTER SLEEP"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class Medicine extends StatelessWidget {
  late int MedicineNumber;
  late String MedicineTime;
  late String MedicineMealTime;
  Medicine(
    int MN,
    String MT,
    String MMT, {
    Key? key,
  }) : super(key: key) {
    MedicineNumber = MN;
    MedicineTime = MT;
    MedicineMealTime = MMT;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "MEDICINE $MedicineNumber",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 27, 27),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  MedicineTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 27, 27),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  MedicineMealTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0979FD), Color(0xFF5CA7FF)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              boxShadow: const[
                 BoxShadow(
                  color: Color.fromARGB(255, 44, 44, 44),
                  blurRadius: 30,
                  spreadRadius: -20,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton(    
              child: Text(
                "PARACETAMOL(TAKEN)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
