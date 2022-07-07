import 'package:flutter/material.dart';
import 'package:memoria/screens/home/home.dart';

class faces extends StatefulWidget {
  const faces({Key? key}) : super(key: key);

  @override
  State<faces> createState() => _facesState();
}

class _facesState extends State<faces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PEOPLE'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              "MEET YOUR NEAR AND DEAR ONES!",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
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
                      Navigator.pushNamed(context, '/faceProfile');
                    },
                  ),
                ),
                FaceButton(),
                FaceButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaceButton(),
                FaceButton(),
                FaceButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaceButton(),
                FaceButton(),
                FaceButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaceButton(),
                FaceButton(),
                FaceButton(),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class FaceButton extends StatelessWidget {
  const FaceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 100,
      height: 100,
      child: ElevatedButton(
        child: Stack(
          children: const [
            Image(
              image: AssetImage("Sharat.png"),
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                "SHARAT",
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/faceProfile');
        },
      ),
    );
  }
}
