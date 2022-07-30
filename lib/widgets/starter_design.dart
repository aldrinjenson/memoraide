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
        Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: Return == "homes" ? 220 : 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/testdecoration.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: Return == "homes" ? 45 : 35,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 25,
              left: 10,
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
