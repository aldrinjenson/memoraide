import 'package:flutter/material.dart';
import 'package:memoria/widgets/mode_select_card.dart';

class ModeSelect extends StatefulWidget {
  const ModeSelect({Key? key}) : super(key: key);

  @override
  State<ModeSelect> createState() => _ModeSelectState();
}

class _ModeSelectState extends State<ModeSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Select Mode",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 20),
        ModeSelectCard(
          title: "Sole Care Taker",
          subTitle: "You want to use Memoria to take care of your needs.",
        ),
        ModeSelectCard(
          title: "Care Taker",
          subTitle: "You want to use Memoria to help others.",
        ),
        ModeSelectCard(
          title: "Patient",
          subTitle: "You wish to start a new journey with Memoria.",
        ),
      ]),
    ));
  }
}
