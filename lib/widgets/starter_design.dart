import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartingDesign extends StatelessWidget {
  const StartingDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/decoration1.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
