import 'package:flutter/material.dart';

class Medicine extends StatelessWidget {
  //this widget displays the medicine name, times to be taken at, and status of intake based on color
  late int MedicineNumber;
  late List MedicineTime;
  late String MedicineName;
  Medicine(
    int MN,
    List MT,
    String MMT, {
    Key? key,
  }) : super(key: key) {
    MedicineNumber = MN;
    MedicineTime = MT;
    MedicineName = MMT;
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
                "MEDICINE ${MedicineNumber + 1}",
                style: TextStyle(
                  fontSize: 16,
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
                  MedicineTime.join(', '),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),

              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //   decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 27, 27, 27),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: Text(
              //     MedicineName,
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 14,
              //     ),
              //   ),
              // ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0979FD), Color(0xFF5CA7FF)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              boxShadow: const [
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
                MedicineName,
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

class MedicineTime extends StatefulWidget {
  /* a widget utilized in the Medicine widget that focuses on the three times of day, 
  as well as before or after food */
  late String MedicineTimes;

  MedicineTime(
    String MTS, {
    super.key,
  }) {
    MedicineTimes = MTS;
  }

  @override
  State<MedicineTime> createState() => _MedicineTimeState();
}

class _MedicineTimeState extends State<MedicineTime> {
  bool press = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: press ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            press = !press;
          });
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
        ),
        child: Text(
          widget.MedicineTimes,
          style: TextStyle(color: press ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
