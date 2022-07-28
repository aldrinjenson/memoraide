// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class StartingDesign extends StatelessWidget {
  late String DesignText1;
  late String DesignText2;
  late String Return;
  StartingDesign(
    String D1,
    String D2,
    String R, {
    Key? key,
  }) : super(key: key) {
    DesignText1 = D1;
    DesignText2 = D2;
    Return = R;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 37, 136, 249),
                Color.fromARGB(255, 110, 176, 250)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/testdecoration.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 255,
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                          text: DesignText1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: "\n" + DesignText2,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ]),
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 42,
                height: 42,
                margin: EdgeInsets.only(left: 10, top: 5),
                child: Return == "home"
                    ? TextButton(
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    : SizedBox(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
