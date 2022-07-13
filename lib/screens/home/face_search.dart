import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FaceSearch extends StatefulWidget {
  const FaceSearch({Key? key}) : super(key: key);

  @override
  State<FaceSearch> createState() => _FaceSearchState();
}

class _FaceSearchState extends State<FaceSearch> {
  void takePic() async {
    final cameras = await availableCameras();
    print(cameras);
// Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
    print(firstCamera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Memoria'),
          centerTitle: true,
          backgroundColor: Colors.orange[400],
        ),
        body: Center(
          child: (Column(
            children: [
              Text('Face search screen'),
              TextButton(
                  onPressed: () {
                    print('presed');
                    takePic();
                  },
                  child: Text('Take photo'))
            ],
          )),
        ));
  }
}
